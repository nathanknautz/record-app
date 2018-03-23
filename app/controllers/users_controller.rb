class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user_id = current_user.id 
    render 'index.json.jbuilder'
  end

  def show
    @current_user_id = current_user.id 
    @user = User.find(params[:id])
    render 'show.json.jbuilder'

  end
  def create
    user = User.new(first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )
    if user.save
      render json: {message: "Account created. Thanks for signing up!"}
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end


