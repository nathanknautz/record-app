class UserRecordsController < ApplicationController
  belongs_to :record 
  belongs_to :user

  def index
    @user_record = current_user.user_records
    render 'index.json.jbuilder'
    
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
      render json: {errors: user_record.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    @user_record = UserRecord.find(params[:id])
    if @user_record.update(status: 2)
      render json: {message: "Record removed from your collection"}
    else
      render json: {errors: user_record.errors.full_messages}, status: :unprocessable_entity
    end
  end


end
