class UsersController < ApplicationController

  # GET /register
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to books_path }
        session[:user_id] = @user.id
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  def user_params
    params.require(:user).permit(:username, :password, :email, :password_confirmation)
  end
end
