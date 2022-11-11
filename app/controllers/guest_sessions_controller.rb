class GuestSessionsController < ApplicationController
  def create
    @guest_user = User.create(
      email: SecureRandom.urlsafe_base64 + "@example.com",
      password: 'password',
      password_confirmation: 'password'
      )
      auto_login(@guest_user)
      redirect_back_or_to root_path, success: t('.login')
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end
end
