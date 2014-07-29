class SearchController < ApplicationController

  def create
    key_word = params[:search][:key_word]
    @locations = Search.new(key_word).search
    render 'locations/index'
  end

 
    private
    def search_params
        params.require(:search).permit(:key_word)
    end

end