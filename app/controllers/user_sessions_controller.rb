class UserSessionsController < ApplicationController
  def guest_login
    @guest_user = User.create(
      id: SecureRandom.base58,
      name: 'ゲスト',
      email: 'guest@example',
      password: 'password',
      password_confirmation: 'password'
    )
    if current_user
      redirect_back_or_to root_path, warning: t('.logged_in')
    else
      auto_login(@guest_user)
      redirect_to root_path, success: t('.login')
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end
end
