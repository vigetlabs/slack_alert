class ActivityController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def button_press
    ButtonPress.create(pushed_at: Time.now)

    render text: slack_poster.success?
  end

  def slack_response
    if SlackResponseHandler.new(params[:text]).meaningful?
      ButtonPress.order(:pushed_at).last.update_attributes(responded_to: true)

      # push out to Particle
      ParticleCaller.new.help_is_coming

      # say thanks!
      SlackPoster.new("Thanks!").success?
    end

    render nothing: true
  end

  private

  def slack_poster
    SlackPoster.new("I'm stuck in the stairwell, please halp!")
  end
end
