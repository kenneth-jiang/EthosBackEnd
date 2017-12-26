class Api::V1::PersonalitiesController < ApplicationController

  def show
    user_searches = my_user.wolfram.map { |t| t.searches }.join(', ')+"Fourteen days holed up here with peels of wallpaper, like streamers, looping in mock festivity above my head. Today is my birthday marking fourteen years, the past two weeks spent hiding in this carcass of wooden ribs, like Jonah, swallowed whole by a whale. The temperature dips, icing demolished cornstalks in the field, their season complete. My body’s a cash crop, harvested yearlong. Javier’s taunts echo like a dirge: Eres mio. Never leave. I will find you. Others visit here; they shoot-up, fuck, or sleep. We’ve struck a deal: leave me be, upstairs. When he finds me, I will jump."

    resp = Excon.post("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13",
      body: user_searches,
      headers: { "Content-Type": "text/plain" },
      user: ENV['WATSON_USERNAME'],
      password: ENV['WATSON_PASSWORD'],
      query: {"raw_scores": true, "consumption_preferences": true, "version": "2017-10-13"}
    )
    resp_json = JSON.parse(resp.body)
    render json: resp_json
  end

end
