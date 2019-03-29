class GameControllerController < ApplicationController
  # global var
  $view = '' # Current view
  $game = {
    game_manager: GameManager.new,
    movie_battle: nil,
    message_battle: '',
  }
  $selected = 1 # Selected slot
  $player = {
    position: [0, 0], # Player position
    strength: 3, # Player strength, start at 3, inscrease by one for each captured moviemon
    moviedex: [], # Moviemons player has captured
    selected_movie: 0
  }
  # pages
  def title_screen
  end

  def worldmap
  end

  def moviedex
    @movie = $player[:moviedex][$player[:selected_movie]]
  end

  def save_game
  end

  def load_game
  end

  def battle
    @current_movie = $game[:movie_battle]
    @player_strength = $player[:strength]
  end

  def win_battle
    @movie_title = $game[:movie_battle][:title]
  end

  def lose_battle
    @message = $game[:message_battle]
  end
  # inputs
  def power
  end

  def start
    if $view == ''
      $game[:game_manager].get_movies
      $view = 'worldmap'
    elsif $view == 'worldmap'
      $view = 'moviedex'
    end
    redirect_to "/#{$view}"
  end

  def select
    if $view == ''
      $view = 'load'
    elsif $view == 'worldmap'
      $view = 'save'
    elsif $view == 'moviedex' || $view == 'save'
      $view = 'worldmap'
    elsif $view == 'load'
      $view = ''
    end
    redirect_to "/#{$view}"
  end

  def button_b
    if $view == 'battle'
      $view = 'lose'
      $game[:message_battle] = "You are a coward ! #{$game[:movie_battle][:title]} escaped.."
    end
    redirect_to "/#{$view}"
  end

  def button_a
    if $view == 'battle'
      if $player[:strength].to_f < $game[:movie_battle][:imdbRating].to_f
        $view = 'lose'
        $game[:message_battle] = "You were not strong enough ! #{$game[:movie_battle][:title]} escaped.."
      else
        $view = 'win'
        $player[:strength] += 1
        $player[:moviedex] << $game[:movie_battle]
      end
    elsif $view == 'win' || $view == 'lose'
      $view = 'worldmap'
    elsif $view == 'save'
      $game[:game_manager].save
    end
    redirect_to "/#{$view}"
  end

  def up
    if $view == 'worldmap'
      $player[:position][1] = $player[:position][1] > 0 ? $player[:position][1] - 1 : 9
      $game[:movie_battle] = $game[:game_manager].check_battle
      if ($game[:movie_battle] != nil)
        $view = 'battle'
      end
    elsif $view == 'save' || $view == 'load'
      $selected = $selected > 1 ? $selected - 1 : 3
    end
    redirect_to "/#{$view}"
  end

  def right
    if $view == 'worldmap'
      $player[:position][0] = $player[:position][0] < 9 ? $player[:position][0] + 1 : 0
      $game[:movie_battle] = $game[:game_manager].check_battle
      if ($game[:movie_battle] != nil)
        $view = 'battle'
      end
    elsif $view == 'moviedex'
      if $player[:selected_movie] < $player[:moviedex].length - 1
        $player[:selected_movie] += 1
      end
    end
    redirect_to "/#{$view}"
  end

  def bottom
    if $view == 'worldmap'
      $player[:position][1] = $player[:position][1] < 9 ? $player[:position][1] + 1 : 0
      $game[:movie_battle] = $game[:game_manager].check_battle
      if ($game[:movie_battle] != nil)
        $view = 'battle'
      end
    elsif $view == 'load' || $view == 'save'
      $selected = $selected < 3 ? $selected + 1 : 1 
    end
    redirect_to "/#{$view}"
  end

  def left
    if $view == 'worldmap'
      $player[:position][0] = $player[:position][0] > 0 ? $player[:position][0] - 1 : 9
      $game[:movie_battle] = $game[:game_manager].check_battle
      if ($game[:movie_battle] != nil)
        $view = 'battle'
      end
    elsif $view == 'moviedex'
      if $player[:selected_movie] > 0
        $player[:selected_movie] -= 1
      end
    end
    redirect_to "/#{$view}"
  end
end
