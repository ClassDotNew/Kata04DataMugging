def read_file(file, col_a, col_b, col_c, 
  ignore_line, filter_char,
  key_1, key_2, key_3)
  # Read File method will take a full directory path
  # to the file and filter line by line based on the following
  # configuration:
  # col_a => column position based on dat file you want to include
  # col_b => column position based on dat file you want to include
  # col_c => column position based on dat file you want to include
  # ignore_line => line position you want to ignore before filtering through file
  # filter_char => filter character out from the data we're mining
  arr = []
  line_counter = 0
  File.open(file).each do |line|
    if line_counter >= ignore_line
      arr_line = line.split(" ")
      unless arr_line[col_a - 1] == filter_char
        arr << {
          key_1 => arr_line[col_a - 1],
          key_2 => arr_line[col_b - 1][0..1],
          key_3 => arr_line[col_c - 1][0..1]
          }
      end
    end
    line_counter += 1
  end
  return arr
end

def printing_weather(arr)
  arr.each do |line|
    puts "Day: #{line["day"]}\t
      Maximum temp: #{line["maxTemp"]}\t
      Minimum temp: #{line["minTemp"]}"
  end
end

def smallest_temp_spread(arr)
  temp_arr = []
  arr.each do |element|
    temp_arr << {
      "day" => element["day"],
      "spread" => (element["maxTemp"].to_f - element["minTemp"].to_f).abs
    }
  end
  temp_arr.sort!{|a,b| a["spread"] <=> b["spread"]}
  puts "The smallest temperature spread occured on day: #{temp_arr[0]["day"].to_s}"
end

path_dir = "/Users/raycheng/Desktop/Actualize/Exercise/weather.dat"
weather_arr = read_file(path_dir, 1, 2, 3, 2, "mo", 
  "day", "maxTemp", "minTemp")
# printing_weather(weather_arr)
smallest_temp_spread(weather_arr)
