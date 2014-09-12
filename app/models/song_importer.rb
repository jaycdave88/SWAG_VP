require_relative '../../config/application'

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
		# SONG PLAYS
	end

	def evaluate_guess
		sleep(6)
		View.ask_question
		evaluate_guess = gets.chomp
			if evaluate_guess ==
			end
		end
	end

	def cue_next_song
		$song_hash.pop
	end

	def reload
		$finished_songs.each do |finished_song|
			$song_hash << finished_song
		end
	end






end
end


# file_parser = FileParser.new()

# puts file_parser.read_file
