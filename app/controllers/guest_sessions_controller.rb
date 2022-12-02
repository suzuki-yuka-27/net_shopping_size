class GuestSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[create]

  def create
    @guest_user = User.create(
      email: SecureRandom.alphanumeric(10) + "@example.com",
      password: 'password',
      password_confirmation: 'password',
      role: 'general'
      )
      auto_login(@guest_user)
      redirect_back_or_to root_path, success: t('.login')
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end
end
