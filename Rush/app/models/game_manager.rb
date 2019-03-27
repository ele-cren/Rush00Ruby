require 'json'
require 'net/http'

class GameManager
  def initialize
    @movie_list = [
      'The Shawshank Redemption',
      'The Green Mile',
      'Cast Away',
      'Blow',
      'The Curious Case of Benjamin Button',
      'The Dark Knight',
      'Pulp Fiction',
      'Venom',
      'Robin Hood',
      "Ocean's Eight",
      'Wonder Park',
      'Triple Frontier',
      'Tucker and Dale vs Evil',
      'Book of Shadows: Blair Witch 2',
      'Fifty Shades of Grey',
      'Dragonball Evolution',
      'Epic Movie',
      'Son of the Mask',
      'Disaster Movie'
    ]
    @movies = []
  end

  def check_battle
    if (rand(2) == 1)
      number_movie = rand(@movie_list.length)
      return @movies[number_movie]
    end
    return nil
  end

  def get_movie(title)
    key = 'da057664'
    url = "http://www.omdbapi.com/?apikey=#{key}&"
    uri = URI(url + "t=#{title}")
    response = Net::HTTP.get(uri)
    return response
  end

  def get_movies
    @movie_list.each do |movie|
      response = JSON.parse(get_movie(movie))
      @movies << {
        title: response["Title"],
        year: response["Year"],
        genre: response["Genre"],
        director: response["Director"],
        plot: response["Plot"],
        imdbRating: response["imdbRating"],
        poster: response["Poster"]
      }
    end
  end
end