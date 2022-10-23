class Public::HomesController < ApplicationController

  def top
    #@movie = Movie.find(params[:id])
    @tmdb_genres = Tmdb::Genre.movie_list.map {|g| [g.name, g.id]}
    @tmdb_genre_name = @tmdb_genres.select {|g| g.second.to_s == params[:genre_id] }.flatten.first
    result = if params[:looking_for].present?
        Tmdb::Search.movie(params[:looking_for])
      elsif params[:genre_id].present?
        Tmdb::Genre.movies(params[:genre_id])
      else
        Tmdb::Movie.now_playing
      end
    @tmdb_movies = TmdbMovie.get(result)
  end

  def guest
    guest = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
    sign_in guest
    redirect_to root_path
  end

  def search
  end

end

#"http://api.themoviedb.org/3/search/movie?api_key=d6599ce988e5da53192a7a5539607824&language=ja&query=Harry"