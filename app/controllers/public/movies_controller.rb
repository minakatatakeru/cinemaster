class Public::MoviesController < ApplicationController
 #ユーザーのログイン状態を確かめる。indexはログインしてなくても閲覧可能にしてます。
 before_action :authenticate_customer!, only: [:show, :create]

  def new
    @movie = Movie.new(moviedata_id: params[:moviedata_id])
    @moviedata = Tmdb::Movie.detail(params[:moviedata_id], language: 'ja')
  end

  def show
   @movie_data = JSON.parse((Tmdb::Movie.detail(params[:id], language: 'ja')).to_json)

   # @movie = Movie.new
   # @movie.moviedata_id = params[:id]

   # @movies = Movie.where(moviedata_id: params[:id])

   @movie = Movie.find_by(moviedata_id: params[:id])
   #@customer = @movie.customer
   @comment = Comment.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
   @comment.movie_id = @movie.id
   @comment.moviedata_id = @movie.moviedata_id
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
    params.require(:movie).permit(:movie_content, :star, :moviedata_id, :title)
  end

end
