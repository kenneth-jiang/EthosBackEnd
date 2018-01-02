class Api::V1::PersonalitiesController < ApplicationController

  def create
    user_searches = my_user.searches.map { |t| t.search_term }.join(', ')+"Fourteen days holed up here with peels of wallpaper, like streamers, looping in mock festivity above my head. Today is my birthday marking fourteen years, the past two weeks spent hiding in this carcass of wooden ribs, like Jonah, swallowed whole by a whale. The temperature dips, icing demolished cornstalks in the field, their season complete. My body’s a cash crop, harvested yearlong. Javier’s taunts echo like a dirge: Eres mio. Never leave. I will find you. Others visit here; they shoot-up, fuck, or sleep. We’ve struck a deal: leave me be, upstairs. When he finds me, I will jump."
    user_clicks = my_user.clicks.map { |t| t.click_term }.join(', ')
    user_words = user_searches + user_clicks

    resp = Excon.post("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13",
      body: user_words,
      headers: { "Content-Type": "text/plain" },
      user: ENV['WATSON_USERNAME'],
      password: ENV['WATSON_PASSWORD'],
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
