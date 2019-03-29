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
      'Triple Frontier',
      'Tucker and Dale vs Evil',
      'Book of Shadows: Blair Witch 2',
      'Fifty Shades of Grey',
      'Dragonball Evolution',
      'Epic Movie',
      'Son of the Mask',
      'Disaster Movie',
      'House of the Dead',
      'Race 3',
      'Gunday',
      'Alone in the Dark'
    ]
    @movie_list2 = [
      'The Godfather',
      'The Godfather: Part II',
      'The Lord of the Rings: The Return of the King',
      '12 Angry Men',
      'Fight Club',
      'Forrest Gump',
      'RoboCop 3',
      'Escape Plan 2: Hades',
      'Furry Vengeance',
      'Norbit',
      'Prom Night',
      'Caddyshack II',
      'Saving Christmas',
      'Birdemic: Shock and Terror',
      'Manos: The Hands of Fate',
      'Going Overboard',
      'Pledge This!',
      'The Hottie & the Nottie'
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

  def get_data()
    if (File.file?('public/save.json'))
      array_data = JSON.parse(File.read('public/save.json'))
      return array_data
    end
    return [{}, {}, {}]
  end

  def save
    if File.file?('public/save.json')
      # File already exists
      array_data = get_data()
      file = File.open('public/save.json', 'w')
      data = {
        player: $player,
        date: Time.now.strftime("%d/%m/%Y %H:%M"),
        movies: @movies
      }
      array_data[$selected - 1] = data
      file.write(JSON.pretty_generate(array_data))
      file.close
    else
      array_data = [{}, {}, {}]
      data = {
        player: $player,
        date: Time.now.strftime("%d/%m/%Y %H:%M"),
        movies: @movies
      }
      array_data[$selected - 1] = data
      file = File.open('public/save.json', 'w')
      file.write(JSON.pretty_generate(array_data))
      file.close
    end
  end

  def load
    array_data = get_data
    if (array_data[$selected - 1]["player"])
      $player = array_data[$selected - 1]["player"]
      @movies = array_data[$selected - 1]["movies"]
      return true
    end
    return false
  end

  def get_movie(title)
    key = 'da057664'
    url = "http://www.omdbapi.com/?apikey=#{key}&"
    uri = URI(url + "t=#{title}")
    response = Net::HTTP.get(uri)
    return response
  end

  def get_movies
    my_list = rand(2) == 0 ? @movie_list : @movie_list2
    my_list.each do |movie|
      response = JSON.parse(get_movie(movie))
      @movies << {
        "title" => response["Title"],
        "year" => response["Year"],
        "genre" => response["Genre"],
        "director" => response["Director"],
        "plot" => response["Plot"],
        "imdbRating" => response["imdbRating"],
        "poster" => response["Poster"]
      }
    end
  end
end