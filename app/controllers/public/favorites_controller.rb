class Public::FavoritesController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("d6599ce988e5da53192a7a5539607824")
  # 映画情報の表示の際の言語設定を日本語にする
  Tmdb::Api.language("ja")

  def create
    @movie = Movie.find_by(moviedata_id: params[:id])
    favorite = current_customer.favorites.new(moviedata_id: @moviedata.id)
    favorite.save
  end

  def destroy
    @movie = Movie.find_by(moviedata_id: params[:id])
    favorite = current_customer.favorites.find_by(moviedata_id: @moviedata.id)
    favorite.destroy
  end
end
