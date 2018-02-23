class ArtistsController < ApplicationController
  def index
    @artists = Artist.all 
    render 'index.json.jbuilder'
  end

  def show
    @artist = Artist.find(params[:id])
    render 'show.json.jbuilder'
    
  end

  def update
    @artist = Artist.find(params[:id])

    @artist.name = params[:name] || @artist.name
    @artist.bio = params[:bio] || @artist.bio
    
    if @artist.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @artist.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def create
    @artist = Artist.new(name: params[:name],
                         bio: params[:bio]
                         )
    if @artist.save 
      render 'show.json.jbuilder'
    else
      render json: {errors: @artist.errors.full_messages}, status: :unprocessable_entity
    end
    
  end

  def destroy
    @artist = Artist.find(params[:id])

    if @artist.destroy
      render json: {message: "Artist removed successfully"}
    else
      render json: {errors: @artist.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
