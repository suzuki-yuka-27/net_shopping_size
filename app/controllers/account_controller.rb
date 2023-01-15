class AccountController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to account_link_path, success: t('.login')
    else
      flash.now[:danger] = t('.not_login')
      render :new
    end
  end

end
