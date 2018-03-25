class ArtistsController < ApplicationController
  def index
    if params["limit"].to_i == 0
      display_results = 20 
    else
      display_results = params["limit"].to_i
    end

    if params["page"].to_i > 0
      page = (params["page"].to_i - 1) * display_results
    else 
      page = 0
    end
    sort = params["sort"].to_i 
    if sort == 2
      @artists = Artist.all.order(name: :desc).limit(display_results).offset(page)
    else
      @artists = Artist.all.order(:name).limit(display_results).offset(page)
    end
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
