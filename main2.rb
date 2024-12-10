require_relative "lib/hash_set"

map = HashSet.new

# Test 1: checking the capacity growing and shrinking
# You have to uncomment the lines 153 and 161 of the HashSet#change_capacity method if you want to play this test properly
(1..256).each do |i|
  puts i
  map.set(i.to_s)
end
p "Deleting"
(1..256).each do |i|
  puts 256-i
  map.remove(i.to_s)
end


# Test 2: checking the funcionality (on the Odin Assignment way)
test = HashSet.new
puts "-----------------"
puts "-----------------"
puts "Populating"
test.set('apple')
test.set('banana')
test.set('carrot')
test.set('dog')
test.set('elephant')
test.set('frog')
test.set('grape')
test.set('hat')
test.set('ice cream')
test.set('jacket')
test.set('kite')
test.set('lion')
p "Length: #{test.length}"
p "Capacity: #{test.capacity}"
p test.keys
puts "-----------------"
puts "Trying to add repeated keys"
test.set('jacket')
test.set('ice cream')
p "Length: #{test.length}"
p "Capacity: #{test.capacity}"
p test.keys
puts "-----------------"
puts "Growing capacity"
test.set('moon')
p "Length: #{test.length}"
p "Capacity: #{test.capacity}"
p test.keys
puts "-----------------"
puts "Other functionalities"
p test.has?('grape')
p test.has?('house')
test.remove('frog')
p test.has?('frog')
puts "-----------------"
puts "Clearing"
test.clear
p "Length: #{test.length}"
p "Capacity: #{test.capacity}"
p test.keys



