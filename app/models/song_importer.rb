require_relative '../../config/application'
# puts "Hello! I'm your model, being required correctly."

$song_hash = {}
$finished_songs = {}
$score = 0

class FileParser

	attr_reader :username

	def initialize(username)

		@filename = "/Users/devmode/Desktop/swag_vp/SWAG_VP/db/data/songs.txt"
		read_file
	end

	def read_file

		File.open(@filename, 'r') do |file|
			index=1
			while line = file.gets
				if(line!="\n")
					if index%2 != 0
						artist = line.sub("\n","")
					else
						answer =line.sub("\n","")
						$song_hash[artist] = answer
						$finished_songs[artist] = answer
					end
					index += 1
				end
			end
		end
		$song_hash
	end

	def play_song(song_path)
		View.start_song
		sleep(1)
		`afplay #{song_path}`
	end

	def evaluate_guess

		View.ask_question
		evaluate_guess = gets.chomp
		if evaluate_guess == $song_hash.keys[0]
			View.correct
			increment_score
		else
			View.incorrect
		end
	end


	def cue_next_song
		$song_hash.delete("#{$song_hash.keys[0]}")
	end

	def reload
		$song_hash = $finished_songs
		end
	end

	def increment_score
		$score += 1
	end

# end
	public
	def restart_game
		puts"Would you like to replay?"
		resonse = gets.chomp
			if resonse == "yes"
				Controller.run
			else
				puts "Thanks for playing!"
			end

	end



