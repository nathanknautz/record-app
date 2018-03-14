class RecordsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  def index
    @records = Record.all 
    render 'index.json.jbuilder'
    
  end

  def show
    @record = Record.find(params[:id])
    render 'show.json.jbuilder'
    
  end

  def create
    @record = Record.new(release_year: params[:release_year],
                         title: params[:title],
                         playtime: parmas[:playtime],
                         tracklist: [:tracklist]
                         )
    if @record.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @record.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def update
    @record = Record.find(params[:id])

    @record.release_year = params[:release_year] || @record.release_year
    @record.title = params[:title] || @record.title
    @record.playtime = params[:playtime] || @record.playtime
    @record.tracklist = params[:tracklist] || @record.tracklist

    if @record.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @record.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @record = Record.find(params[:id])

    if @record.destroy
      render json: {message: "Record removed successfully"}
    else
      render json: {errors: @record.errors.full_messages}, status: :unprocessable_entity
    end

  end
end
