a = [[1,2], [3,4]]
b = [5,5]
new_array = []
a.each do | pair |
  new_array << [pair[0] + b[0], pair[1] + b[1]]
end

  p new_array
