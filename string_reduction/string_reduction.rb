require 'benchmark'

def stringReduction_recursor(s, memo)
  if memo[s]
    return memo[s]
  end

  if (choices = choices(s)).empty?
    return s.length
  end

  sizes = []

  choices.each do |choice_index|
    new_string = Array.new(s)
    replacement = other_char(s[choice_index..choice_index+1])

    new_string.slice!(choice_index..choice_index+1)
    new_string.insert(choice_index, replacement)

    sizes << stringReduction_recursor(new_string, memo)
  end

  memo[s] = sizes.min
  return sizes.min
end

def stringReduction(s)
  stringReduction_recursor(s.each_char.to_a, {})
end

def other_char(s)
  if s.include?('a') && s.include?('b')
    'c'
  elsif s.include?('a') && s.include?('c')
    'b'
  elsif s.include?('c') && s.include?('b')
    'a'
  else
    raise 'no definitive other character'
  end
end

def choices(s)
  c = []

  s.each.with_index do |letter, index|
    c << index if s[index] != s[index + 1] && index + 1 < s.length
  end

  c
end

#p stringReduction('babcbbaabcbcbcbaabbccaacccbbbcaaacabbbbaaaccbcccacbbccaccbbaacaccbabcaaaacaccacbaacc')
p stringReduction('babbcbababcbabbaac')
#p stringReduction('abaac')

#hackerrank input
#input = File.new("./input")
#input.readline # Throw away line
#
#input.each do |line|
#  p stringReduction(line.chomp)
#end
