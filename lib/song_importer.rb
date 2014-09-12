# require_relative '../db/data/songs.txt'

$song_hash = {}

class FileParser

	def initialize
		
		@filename = '../db/data/songs.txt'


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

		# Test
		$song_hash.each do |artist,path|
			p "#{artist}:#{path}"
		end

	end

end


file_parser = FileParser.new

puts file_parser.read_file