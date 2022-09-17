class Public::MoviesController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("d6599ce988e5da53192a7a5539607824")
  # 映画情報の表示の際の言語設定を日本語にする
  Tmdb::Api.language("ja")

  def new
    @movie = Movie.new(moviedata_id: params[:moviedata_id])
    @moviedata = Tmdb::Movie.detail(params[:moviedata_id], language: 'ja')
  end

  def show
   if Movie.exists?(moviedata_id: params[:id])
    @movie_data = JSON.parse((Tmdb::Movie.detail(params[:id], language: 'ja')).to_json)
    @movie = Movie.find_by(moviedata_id: params[:id])
   else
    @movie_data = JSON.parse((Tmdb::Movie.detail(params[:id], language: 'ja')).to_json)
    @movie = Movie.new(moviedata_id: params[:id])
    @movie.save
   end
  end



end
