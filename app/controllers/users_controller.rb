class UsersController < ApplicationController
  # before_action :logged_in_user, only: %i[index edit update destroy]
  before_action :correct_user, only: %i[edit update]
  before_action :set_user, only: %i[show edit update destroy]
  before_action :admin_user, only: [:destroy]
  def new
    @user = User.new
  end

  def index
    # @users = User.where(activated: FILL_IN).paginate(page: params[:page], per_page: 5)
    @users = User.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = 'Please check your email to activate your account'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    # redirect_to root_url and return unless FILL_IN

    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'Update successfully!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    set_user.destroy
    flash[:success] = 'User deleted'
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin
  end
end
