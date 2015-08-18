class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(session_params)

    if user
      sign_in(user)
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email)
  end
end
