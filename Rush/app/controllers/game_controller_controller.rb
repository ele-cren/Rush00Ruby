class GameControllerController < ApplicationController
  # global var
  $view = '/' # Current view
  $game = {
    game_manager: GameManager.new,
    movie_battle: nil
  }
  $selected = 0 # Selected movie in moviedex
  $player = {
    position: [0, 0], # Player position
    strength: 3, # Player strength, start at 3, inscrease by one for each captured moviemon
    moviedex: [] # Moviemons player has captured
  }
  # pages
  def title_screen
  end

  def worldmap
  end

  def moviedex
  end

  def save_game
  end

  def load_game
  end

  def battle
  end

  def win_battle
  end

  def lose_battle
  end
  # inputs
  def power
  end

  def start
    if $view == '/'
      $game[:game_manager].get_movies
      $view = 'worldmap'
      redirect_to "/#{$view}"
    elsif $view == 'worldmap'
      $view = 'moviedex'
      redirect_to "/#{$view}"
    else
      redirect_to "/#{$view}"
    end
  end

  def select
    if $view == '/'
      $view = 'load'
      redirect_to "/#{$view}"
    elsif $view == 'worldmap'
      $view = 'save'
      redirect_to "/#{$view}"
    elsif $view == 'moviedex' || $view == 'save'
      $view = 'worldmap'
      redirect_to "/#{$view}"
    elsif $view == 'load'
      $view = '/'
      redirect_to "#{$view}"
    else
      redirect_to "#{$view}"
    end
  end

  def button_b
  end

  def button_a
  end

  def up
    if $view == 'worldmap'
      $player[:position][1] = $player[:position][1] > 0 ? $player[:position][1] - 1 : 9
    end
    redirect_to "/#{$view}"
  end

  def right
    if $view == 'worldmap'
      $player[:position][0] = $player[:position][0] < 9 ? $player[:position][0] + 1 : 0
      $game[:movie_battle] = $game[:game_manager].check_battle
      if ($game[:movie_battle] != nil)
        puts $game[:movie_battle][:title] # redirect to fight screen
      end
    end
    redirect_to "/#{$view}"
  end

  def bottom
    if $view == 'worldmap'
      $player[:position][1] = $player[:position][1] < 9 ? $player[:position][1] + 1 : 0
    end
    redirect_to "/#{$view}"
  end

  def left
    if $view == 'worldmap'
      $player[:position][0] = $player[:position][0] > 0 ? $player[:position][0] - 1 : 9
    end
    redirect_to "/#{$view}"
  end
end
