
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
    if line_counter >= ignore_line and line_counter != 18
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

def smallest_score_spread(arr, key_a_result, key_b_diff, key_c_diff)
  temp_arr = []
  arr.each do |element|
    temp_arr << {
      key_a_result => element[key_a_result],
      "spread" => (element[key_b_diff].to_f - element[key_c_diff].to_f).abs
    }
  end
  temp_arr.sort!{|a,b| a["spread"] <=> b["spread"]}
  puts "The smallest score spread happen on team: #{temp_arr[0][key_a_result].to_s}"
end

path_dir = "/Users/raycheng/Desktop/Actualize/Exercise/football.dat"
football_arr = read_file(path_dir, 2, 7, 9, 1, "-", 
  "team", "forGoals", "againstGoals")
smallest_score_spread(football_arr, "team", "forGoals", "againstGoals")