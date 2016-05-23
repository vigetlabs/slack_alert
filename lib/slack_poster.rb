class SlackPoster
  def initialize(message)
    @message = message
  end

  def success?
    request.code == 200
  end

  private

  def request
    HTTParty.post(url,
      body:    body,
      headers: headers)
  end

  def url
    Rails.application.secrets.slack_api_url
  end

  def body
    { text: @message }.to_json
  end

  def headers
    { 'Content-Type' => 'application/json' }
  end
end
