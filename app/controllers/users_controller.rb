class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render action: 'show'
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render action: 'show'
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :username, :email, :password)
    end
end