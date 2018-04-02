require 'digest'
require 'json'

matches = Hash.new
file_names = Array.new
new_file_names = Array.new
if ARGV.length == 1
    if Dir.exist?("#{ARGV[0]}")
        Dir.entries("#{ARGV[0]}").each do |filename|
            file_abs_path = File.absolute_path("#{filename}", "#{ARGV[0]}")
            if not Dir.exist?("#{file_abs_path}")
                sha256 = Digest::SHA256.file File.absolute_path("#{filename}", "#{ARGV[0]}")
                sha256_hexdigest = "#{sha256.hexdigest}"
                if matches.key?("#{sha256_hexdigest}")
                    file_names = Array.new(matches["#{sha256.hexdigest}"].each do |my_file| my_file end)
                    file_names << "#{filename}"
                    matches["#{sha256.hexdigest}"] = file_names
                    new_file_names = []
                else
                    new_file_names = ["#{filename}"]
                    matches["#{sha256.hexdigest}"] = new_file_names
                end
            end

        end
        new_hash = Hash["matches:" => matches.values ]
        puts JSON.pretty_generate(new_hash)
    end
end
