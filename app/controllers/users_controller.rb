class UsersController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def new
    @user = User.current_user.build
    @past_events = previous_events
    @upcoming_events = upcoming_events
  end

  def create
    @user = User.current_user.build(event_params)
    @user.save
    session[:user_id] = @user.id
    flash.notice = "User #{@user.name} successfully created! Thank you for signing up!"
    redirect_to user_path(@user)
  end

  def show
    @all_events = Event.all
    @events = Event.where(user_id: current_user.id)
  end
end
