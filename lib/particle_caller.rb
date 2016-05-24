class ParticleCaller
  def initialize()
  end

  def help_is_coming
      Particle.configure do |c|
        c.access_token = Rails.application.secrets.particle_api_key
      end

      Particle.device(Rails.application.secrets.particle_device_id).function('slackRespond')
    rescue
  end
end
