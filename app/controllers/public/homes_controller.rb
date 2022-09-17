class Public::HomesController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("d6599ce988e5da53192a7a5539607824")
  # 映画情報の表示の際の言語設定を日本語にする
  Tmdb::Api.language("ja")

  def top
    #@movie = Movie.find(params[:id])
  end

  def search
  end

end

#"http://api.themoviedb.org/3/search/movie?api_key=d6599ce988e5da53192a7a5539607824&language=ja&query=Harry"