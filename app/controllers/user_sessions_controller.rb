class UserSessionsController < ApplicationController
  def guest_login
    @guest_user = User.create(
      name: 'ゲスト',
      email: 'guest@example',
      password: 'password01',
      password_confirmation: 'password01'
    )
    auto_login(@guest_user)
    redirect_to root_path, success: t('.login')
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end
end
