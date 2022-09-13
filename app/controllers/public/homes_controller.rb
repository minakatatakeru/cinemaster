class Public::HomesController < ApplicationController

  require 'themoviedb-api'
  Tmdb::Api.key("0c76fa476747c678b8e71329680c5b5e")
  # 映画情報の表示の際の言語設定を日本語にする
  Tmdb::Api.language("ja")

end
