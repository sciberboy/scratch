TravelTimes = [
  [ 0, 10, 15, 20],
  [10,  0, 35, 25],
  [15, 35,  0, 30],
  [20, 25, 30,  0]
].freeze



def solve(stops, path = [0])
  costs = ->(path) { path.each_cons(2).sum { |a, b| TravelTimes[a][b] } }

  if stops.empty?
    puts costs.call(path)
    puts (path + [0]).join('-')
  else
    stops.each do |num|
      solve(stops - [num], path + [num])
    end
  end
end

solve([1, 2, 3])
