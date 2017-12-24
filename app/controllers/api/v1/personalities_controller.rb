class Api::V1::PersonalitiesController < ApplicationController

  def show
    searches = my_user.searches.map { |t| t.search_term }.join(', ')
    
    content = searches +" Fourteen days holed up here with peels of wallpaper, like streamers, looping in mock festivity above my head.
    Today is my birthday marking fourteen years, the past two weeks spent hiding in this carcass of wooden ribs, like Jonah, swallowed whole by a whale.
    The temperature dips, icing demolished cornstalks in the field, their season complete. My body’s a cash crop, harvested yearlong.
    Javier’s taunts echo like a dirge: Eres mio. Never leave. I will find you. Others visit here; they shoot-up, fuck, or sleep. We’ve struck a deal:
    leave me be, upstairs. When he finds me, I will jump. "

    username = "aca8a87b-5568-401b-ad0b-6148de8c1a4d"
    password = "Z6Z88HPzBG4v"
    response = Excon.post("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13",
      body: content,
      headers: { "Content-Type": "text/plain" },
      user: username,
      password: password,
      query: {
        "raw_scores": true,
        "consumption_preferences": true,
        "version": "2017-10-13"
      }
    )

    insights = JSON.parse(response.body)
    # new_insight = Personality.create(insight: insights, user_id: my_user.id)
    # my_user.personalities
    render json: { insights: insights }
  end
end
