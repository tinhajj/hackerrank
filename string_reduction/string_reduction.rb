def stringReduction(a)
end

input = File.new("./input")
input.readline # Throw away line

input.each do |line|
  stringReduction(line.chomp.chars)
end
