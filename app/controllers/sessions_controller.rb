class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create register ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    @user = User.new
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def register
    @user = User.new(params.require(:user).permit(:email_address, :username, :password, :password_confirmation))

    if @user.save
      flash[:notice] = "Account created!"
      start_new_session_for @user
      redirect_to after_authentication_url
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
