require_relative '../../config/application'

# puts "Hello! I'm your swag_control, being required correctly."

class Controller

  def self.run
    View.welcome_message
    username = View.get_user_details
    game_session = FileParser.new(username)

    self.run_game(game_session)

    View.display_final_score
    View.display_answers
  end

  def self.run_game(game_session,song_count=5)
    song_count.times do
      current_song = $song_hash.values[0]
      game_session.play_song(current_song)
      game_session.evaluate_guess
      game_session.cue_next_song

    end
  game_session.reload
  game_session.restart_game
    end
  end
