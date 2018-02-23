class GenresController < ApplicationController
  def index
    @genres = Genre.all
    render 'index.json.jbuilder'
  end

  def show
    @genre = Genre.find(params[:id])
    render 'show.json.jbuilder'
    
  end

  def create
    @genre = Genre.new(name: params[:id])
    if @genre.save 
      render 'show.json.jbuilder'
    else
      render json: {errors: @genre.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @genre = Genre.find(params[:id])

    @genre.name = params[:name] || @genre.name

    if @genre.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @genre.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    @genre = Genre.find(params[:id])

    if @genre.destroy
      render json: {message: "Genre removed successfully"}
    else
      render json: {errors: @genre.errors.full_messages}, status: :unprocessable_entity
    end
    
  end




end
