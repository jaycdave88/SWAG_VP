require_relative '../../config/application'

puts "Hello! I'm your swag_interface, being required correctly."

class View

  def self.welcome_message
    puts "Hello and welcome to the Swag Music Quiz"
  end

  def self.get_user_details
    puts "Enter your name for the High Scores Table (if you're good enough)"
    gets.chomp
  end

  def self.display_final_score(final_score)
    puts "Congratulations, your final score is #{final_score}!"
  end

  def self.display_high_scores_table(high_scores)
    high_scores.each { |score_record|
      puts score_record
    }
  end

  def self.display_answers
    puts "Here are the correct answers to all the songs:"
    puts "[correct answers be here...]"
  end

  def self.start_song
    # puts a message saying song is going to start
  end

  def self.ask_question
    puts "Whats the artist?!"
  end


end
