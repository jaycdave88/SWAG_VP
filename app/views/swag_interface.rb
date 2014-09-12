require_relative '../../config/application'

puts "Hello! I'm your swag_interface, being required correctly."

SWAG_LOGO = "███████╗██╗    ██╗ █████╗  ██████╗      ██████╗ ██╗   ██╗██╗███████╗
██╔════╝██║    ██║██╔══██╗██╔════╝     ██╔═══██╗██║   ██║██║╚══███╔╝
███████╗██║ █╗ ██║███████║██║  ███╗    ██║   ██║██║   ██║██║  ███╔╝ 
╚════██║██║███╗██║██╔══██║██║   ██║    ██║▄▄ ██║██║   ██║██║ ███╔╝  
███████║╚███╔███╔╝██║  ██║╚██████╔╝    ╚██████╔╝╚██████╔╝██║███████╗
╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝      ╚══▀▀═╝  ╚═════╝ ╚═╝╚══════╝
                                                                    "

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def pink
    colorize(35)
  end

  def white
    colorize(37)
  end

  def blue
    colorize(34)
  end

  def blinking
    colorize(25)
  end


end

class View

  def self.draw_line
    puts "="*68
    puts ""
  end

  def self.welcome_message
    draw_line
    puts SWAG_LOGO
    draw_line
    puts "Hello and welcome to the Swag Music Quiz"
  end

  def self.get_user_details
    puts "Enter your name for the High Scores Table (if you're good enough)"
    gets.chomp
  end

  def self.display_final_score
    puts "Congratulations, your final score is #{$score}!"
  end

  # def self.display_high_scores_table(high_scores)
  #   high_scores.each { |score_record|
  #     puts score_record
  #   }
  # end

  def self.display_answers
    puts "Here are the correct answers to all the songs:"
    puts "[#{$song_hash.keys}]".blue
  end

  def self.start_song
   puts "The song is about to start...".pink
  end

  def self.ask_question
    puts "Whats the artist?!".white.blinking
  end

  def self.incorrect
    puts "Sorry... That Was incorrect".red
  end

  def self.correct
    puts "Congratulations!!!".green
    puts"--------------------".white
    puts "You got it correct!".green
  end

  def self.clear_screen
    print "\e[2J"
  end


end