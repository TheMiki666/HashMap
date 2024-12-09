require_relative "lib/hash_map"

map = HashMap.new

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
p map.buckets # Delete and change attr_reader

map.set("Bruce", "Hulk")
map.set("Pepper", "Ironman")
puts map.length
p map.buckets # Delete and change attr_reader

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
p map.buckets # Delete and change attr_reader
puts "------"
p map.remove("Diana")
puts map.length
puts map.has?("Diana")
p map.buckets # Delete and change attr_reader
puts "------"
p map.remove("Steve")
puts map.length
puts map.has?("Steve")
p map.buckets # Delete and change attr_reader
puts "------"
p map.remove("Dick")
puts map.length
puts map.has?("Dick")
p map.buckets # Delete and change attr_reader
puts "------"

map.clear
puts map.length
puts map.has?("Logan")
p map.buckets # Delete and change attr_reader

p map.keys
p map.values
p map.entries