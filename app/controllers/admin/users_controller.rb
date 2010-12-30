class Admin::UsersController < AdminController
  before_filter :find_user, :only => [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, :notice => "The user was deleted!"
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end

