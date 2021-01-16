class UserMailer < ApplicationMailer
  include Devise::Controllers::UrlHelpers

  def user_welcome(user)
    @url = new_user_session_url
    @user = user
    # Here goes email for that need to create sendGrid or related account
  end
end
