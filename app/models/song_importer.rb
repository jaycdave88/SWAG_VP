require_relative '../../config/application'
puts "Hello! I'm your model, being required correctly."

$song_hash = {}
$finished_songs = {}

class FileParser

	attr_reader :username

	def initialize(username)

		@filename = '../../db/data/songs.txt'

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
					end
					index += 1
				end
			end
		end
		$song_hash
	end

	def play_song(song_path)
		View.start_song
		sleep(2)
		`afplay db/data/cut_song1.mp3`
	end

	def evaluate_guess
		sleep(6)
		View.ask_question
		evaluate_guess = gets.chomp
		if evaluate_guess == key
			View.correct
			increment_score
		else
			View.incorrect
		end
	end


	def cue_next_song
		$finished_songs << $song_hash.pop
	end

	def reload
		$finished_songs.each do |finished_song|
			$song_hash << finished_song
		end
	end

	def increment_score
		$score += 1
	end
end


# end
# end


# file_parser = FileParser.new()

# puts file_parser.read_file
