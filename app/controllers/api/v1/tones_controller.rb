class Api::V1::TonesController < ApplicationController
  def create
    user_messages = my_user.messages.map { |t| t.content.capitalize + "." }.last(5).join(' ')

    resp = Excon.post("https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2017-09-21",
      body: user_messages,
      headers: { "Content-Type": "text/plain" },
      user: ENV['WATSON_TONE_USERNAME'],
      password: ENV['WATSON_TONE_PASSWORD'],
      query: {"sentences": true, "version": "2017-9-21"}
    )

    @tone = Tone.create(tone_data: resp.body, user_id: my_user.id)
    @tone = JSON.parse(@tone.tone_data)

    render json: @tone
  end
end
