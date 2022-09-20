class Public::CustomersController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("d6599ce988e5da53192a7a5539607824")
  # 映画情報の表示の際の言語設定を日本語にする
  Tmdb::Api.language("ja")

  def show
    @customer = Customer.find(params[:id])
    @movies = @customer.movies
  end

  def edit
  end
end
