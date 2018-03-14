class SearchesController < ApplicationController
  def combined_search
    keyword = params["term"]
    @artists = Artist.where("name iLIKE ?", "%#{keyword}%").limit(10)
    @records = Record.where("title iLIKE ?", "%#{keyword}%").limit(10)
    @results = @artists + @records
    render 'index.json.jbuilder'
  end

end
