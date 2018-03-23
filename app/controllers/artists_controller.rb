class ArtistsController < ApplicationController
  def index
    # page = 0
    # puts params["page"]
    # if params["page"].to_i > 1
    #  page = params["page"].to_i * 20
    # end
    if params["page"].to_i > 0
      page = (params["page"].to_i - 1) * 20
    else 
      page = 0
    end
    @artists = Artist.all.order(:name).limit(20).offset(page)
    render 'index.json.jbuilder'
    puts params[:page]
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
