class UserRecordsController < ApplicationController
  before_action :authenticate_user 
  def index
    @user_records = current_user.user_records
    # .where(status: params[:status] -- add this to view to show wishlist/owned
    render 'index.json.jbuilder'
    
  end
  
  def show
    @user_record = current_user.user_records.find(params[:id])
    render 'show.json.jbuilder'
    
  end

  def create
    @user_record = UserRecord.new(record_id: params[:record_id],
                                  price: params[:price],
                                  user_id: current_user.id,
                                  status: params[:status]
                                  )
    if @user_record.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user_record.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    @user_record = UserRecord.find(params[:id])
    if @user_record.update(status: 2)
      render json: {message: "Record removed from your collection"}
    else
      render json: {errors: @user_record.errors.full_messages}, status: :unprocessable_entity
    end
  end


end
