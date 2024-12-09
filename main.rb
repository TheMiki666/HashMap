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




map.clear
puts map.length
puts map.has?("Logan")
p map.buckets # Delete and change attr_reader