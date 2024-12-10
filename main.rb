require_relative "lib/hash_map"

map = HashMap.new

# Test 1: checking the capacity growing and shrinking
# You have to uncomment the lines 187 and 195 of the HashMap#change_capacity method if you want to play this test properly
(1..256).each do |i|
  puts i
  map.set(i.to_s, "Foo")
end
p "Deleting"
(1..256).each do |i|
  puts 256-i
  map.remove(i.to_s)
end

# Test 2: checking the funcionality (on my own way)
map.clear
puts map.length
map.set("Erik", "Magneto")
map.set("Bruce", "Batman")
map.set("Clark", "Superman")
map.set("Logan", "Wolverine")
map.set("Ororo", "Storm")
map.set("Steve", "Capitan America")
map.set("Selina", "Catwoman")
map.set("Diana", "Wonder Woman")
map.set("Tony", "Ironman")
puts map.length
p map.keys
p map.values
p map.entries

map.set("Bruce", "Hulk")
map.set("Pepper", "Ironman")
puts map.length
p map.keys
p map.values
p map.entries

puts map.get("Ororo")
puts map.get("Logan")
puts map.get("Kevin")
puts map.get("Bruce")

puts map.has?("Selina")
puts map.has?("Bruce")
puts map.has?("Peter")
map.set("Peter", "Spiderman")
puts map.has?("Peter")
puts map.length

p map.keys
p map.values
p map.entries

puts "------"
p map.remove("Clark")
puts map.length
puts map.has?("Clark")
p map.keys
p map.values
p map.entries
puts "------"
p map.remove("Diana")
puts map.length
puts map.has?("Diana")
p map.keys
p map.values
p map.entries
puts "------"
p map.remove("Steve")
puts map.length
puts map.has?("Steve")
p map.keys
p map.values
p map.entries
puts "------"
p map.remove("Dick")
puts map.length
puts map.has?("Dick")
p map.keys
p map.values
p map.entries
puts "------"

map.clear
puts map.length
puts map.has?("Logan")
p map.keys
p map.values
p map.entries

# Test 3: checking the funcionality (on the Odin Assignment way)
puts "-----------------"
puts "-----------------"
puts "Populating"
test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
p "Length: #{test.length}"
p "Capacity: #{test.capacity}"
p test.keys
p test.values
p test.entries
puts "-----------------"
puts "Replacing"
test.set('jacket', 'pink')
test.set('ice cream', 'orange')
p "Length: #{test.length}"
p "Capacity: #{test.capacity}"
p test.keys
p test.values
p test.entries
puts "-----------------"
puts "Growing capacity"
test.set('moon', 'silver')
p "Length: #{test.length}"
p "Capacity: #{test.capacity}"
p test.keys
p test.values
p test.entries
puts "-----------------"
puts "Other functionalities"
p test.get('hat')
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
p test.values
p test.entries
