def stringReduction_recursor(s, manipulations)
  if matching_chars?(s)
    return s.length
  end

  manipulations.each do |index|
    #place hold
  end

  new_manipulations = choices(s)
  new_manipulations.each do |manipulation|
    stringReduction_recursor(s, manipulation)
  end
end

def stringReduction(s)
  stringReduction_recursor(s, [])
end

def choices(s)
  c = []

  s.each_char.with_index do |letter, index|
    c << index if s[index] != s[index + 1] && index + 1 < s.length
  end

  c
end

def matching_chars?(s)
  if s.length == 0
    raise 'empty string'
  end

  firstchar = s[0]

  s.each_char do |char|
    if char != firstchar
      return false
    end
  end

  return true
end

stringReduction('abaac')

#Hackerrank input style
#input = File.new("./input")
#input.readline # Throw away line
#
#input.each do |line|
#  stringReduction(line.chomp.chars)
#end
