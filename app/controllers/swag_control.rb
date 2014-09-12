require_relative '../../config/application'

puts "Hello! I'm your swag_control, being required correctly."

class Controller

  def self.run
    View.welcome_message
    username = View.get_user_details
    game_session = FileParser.new(username)

    run_game

    View.display_final_score(score)
    View.display_answers

    if high_score(score)
      game_session.capture_high_score(score)
      View.display_high_scores_table(game_session.high_scores)
    end

  end

  def run_game(song_count=5)
    song_count.times do

      current_song = $song_hash.values[0]
      play_song(current_song)
      evaluate_guess
      cue_next_song
      # start_timer
      # until ( guess == correct || song_finished? )
      #   accept_guesses
      # end
      # stop_timer

      # if evaluate_guess(View.get_guess) then
      #   increment_score
      #   View.correct_message
      # else
      #   View.incorrect_message
      end

      # reset_timer
    end
  end


  def start_playing_song(song)

  end

  def start_timer

  end

  def stop_timer

  end

  def reset_timer

  end

  def accept_guesses

  end

  def high_score

  end

end
