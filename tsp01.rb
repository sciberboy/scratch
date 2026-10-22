def solve(matrix, path = [0])
  number_of_stops = matrix.size
  travel_times = ->(stops) { stops.each_cons(2).sum { |a, b| matrix[a][b] } }

  if path.size == number_of_stops
    total = travel_times.call(path + [0])
    puts (path + [0]).join('-') + " Times:#{total}"
  else
    stops = (1...number_of_stops).to_a - path
    stops.each do |next_stop|
      solve(matrix, path + [next_stop])
    end
  end
end

# Example usage
travel_times = [
  [ 0, 10, 15, 20],
  [10,  0, 35, 25],
  [15, 35,  0, 30],
  [20, 25, 30,  0]
]

solve(travel_times)
