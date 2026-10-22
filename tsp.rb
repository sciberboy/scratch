def print_perm_tree(remaining, path = [0])
  if remaining.empty?
    puts (path + [0]).join("-")
  else
    remaining.each do |num|
      print_perm_tree(remaining - [num], path + [num])
    end
  end
end

print_perm_tree([1, 2, 3])
