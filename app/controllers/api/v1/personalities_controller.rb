class Api::V1::PersonalitiesController < ApplicationController

  def create
    user_searches = my_user.searches.map { |t| t.search_term }.join(', ')
    user_values = my_user.attributes.values.join(', ')
    user_words = user_searches + user_clicks + user_values

    resp = Excon.post("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13",
      body: user_words,
      headers: { "Content-Type": "text/plain" },
      user: ENV['WATSON_PERSONALITY_USERNAME'],
      password: ENV['WATSON_PERSONALITY_PASSWORD'],
      query: {"raw_scores": true, "consumption_preferences": true, "version": "2017-10-13"}
    )

    @personality = Personality.create(personality_data: resp.body, user_id: my_user.id)
    @personality_json = JSON.parse(@personality.personality_data)

    render json: @personality_json
  end

  def show
    @personality = my_user.personalities.last
    @personality_json = JSON.parse(@personality.personality_data)
    render json: @personality_json
  end

end
