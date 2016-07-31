class UsersController < ApplicationController
  before_action :authorize_user, only: [:show]
  # renders the home page
def home
  @name = current_user ? @current_user.username : "test: not logged in"
end

  def index
    @users = User.all
  end

  # renders the signup form
  def new
  end

  def show
    @group = Group.new
    @activity = Activity.new
    @user = current_user
    @activities = @user.activities
    @groups = @user.groups
  end

  # receives form and creates a user from that data
  def create
    user = User.new(user_params)
    if user.save
        session[:user_id] = user.id
        redirect_to '/profile'
    else
      redirect_to '/signup'
    end
  end


  def createandlinktoactivity
    @activity = Activity.find_by(id: params[:id])
    user = User.new(user_params)
    if user.save
      redirect_to ("/activity/#{@activity.id}/join")
    else
      redirect_to ("/activity/#{@activity.id}/signup")
    end
  end

  def join
    @activity = Activity.find_by(id: params[:id])

  end



  private

  def user_params
     params
     .require(:user)
     .permit(:username, :email, :password, :password_confirmation)
  end
end
