class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to root_path, success: t('.login')
    else
      render :new
      flash[:danger] = t('.not_login')
    end
  end

  def destroy
    logout
    redirect_to root_path, success: t('.logout')
  end
end
