class Admin::UsersController < AdminController
  before_filter :find_user, :only => [:edit, :update, :show]

  def index
    @users = User.all
  end

  def edit

  end

  def update
    if @user.update_attributes(params[:user])
      #TODO modify this to handle multiple roles
      @user.has_role! :admin if params[:admin]
      redirect_to admin_users_path, :notice => 'User was updated!'
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end

