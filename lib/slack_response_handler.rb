class SlackResponseHandler
  def initialize(text)
    @text = text
  end

  def meaningful?
    intentional_response? && hanging_button_press? && recent_button_press?
  end

  private

  def intentional_response?
    intentional_regexes.any? do |regex|
      @text.match(regex).present?
    end
  end

  def intentional_regexes
    [
      /on it/i,
      /onit/i,
      /be there/i,
      /got you/i,
      /gotchu/i
    ]
  end

  def hanging_button_press?
    !latest_button_press.try(:responded_to)
  end

  def recent_button_press?
    latest_button_press.try(:pushed_at) > 1.minute.ago
  end

  def latest_button_press
    @latest_button_press ||= ButtonPress.order(:pushed_at).last
  end
end
