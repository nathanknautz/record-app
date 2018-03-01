class RelatedArtistsController < ApplicationController
  def authorize
    render json: {message: "visit this url",
                  url: "https://accounts.spotify.com/authorize/?client_id=#{ENV['SPOTIFY_CLIENT_ID']}&response_type=code&redirect_uri=http://localhost:3000/spotify/callback"}
  end

  def callback
    render json: {code: params[:code],
                  error: params[:error],
                  state: params[:state]}
  end

  def tokens
    response = Unirest.post(
                              "https://accounts.spotify.com/api/token",
                              parameters: {
                                          grant_type: "authorization_code",
                                          code: params[:code],
                                          redirect_uri: "http://localhost:3000/spotify/callback",
                                          client_id: ENV['SPOTIFY_CLIENT_ID'],
                                          client_secret: ENV['SPOTIFY_CLIENT_SECRET']}
                                          )
    json_data = response.body
    render json: {
                  access_token: json_data["access_token"],
                  token_type: json_data["token_type"],
                  scope: json_data["scope"],
                  expires_in: json_data["expires_in"],
                  refresh_token: json_data["refresh_token"]
    }
            
  end
  def profile
    response = Unirest.get("https://api.spotify.com/v1/me",
                            headers: {
                                      Authorization: "Bearer #{params[:access_token]}"
                              })
        render json: response.body
  end

end
