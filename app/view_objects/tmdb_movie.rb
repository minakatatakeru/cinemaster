class TmdbMovie
  attr_accessor :title, :id, :release_date, :poster_path

  def self.get(result)
    result.results.map {|r| new(r)}
  end

  def initialize(movie_result)
    @title = movie_result.title
    @id = movie_result.id
    @release_date = movie_result.release_date
    @poster_path = movie_result.poster_path
  end
end