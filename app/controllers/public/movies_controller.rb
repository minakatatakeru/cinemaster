class Public::MoviesController < ApplicationController
 #ユーザーのログイン状態を確かめる。indexはログインしてなくても閲覧可能にしてます。
 before_action :authenticate_customer!, only: [:show, :create]


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
    @movies = Movie.all
    @comments = @movie.comments  #投稿詳細に関連付けてあるコメントを全取得
    @comment = Comment.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end

   def create
     @movie = current_customer.movies.new(movie_params)
     if @movie.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
     else
      redirect_back(fallback_location: root_path)  #同上
     end
   end

  private
  def movie_params
    params.require(:movie).permit(:movie_content)
  end

end
