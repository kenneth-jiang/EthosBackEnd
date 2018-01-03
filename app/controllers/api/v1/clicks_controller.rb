class Api::V1::ClicksController < ApplicationController

  def create
    @click = Click.find_by(click_term: params['click_term'])
    if (!@click)
      Click.create(click_term: params['click_term'], user_id: my_user.id)
      render json: {success: "Success"}
    else
      render json: {error: "Already created"}
    end
  end

end
