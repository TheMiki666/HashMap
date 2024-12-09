require_relative "lib/hash_map"

map = HashMap.new

puts map.total_entries
map.set("Erik", "Magneto")
map.set("Bruce", "Batman")
map.set("Clark", "Superman")
map.set("Logan", "Wolverine")
map.set("Ororo", "Storm")
map.set("Steve", "Capitan America")
map.set("Selina", "Catwoman")
map.set("Diana", "Wonder Woman")
map.set("Tony", "Ironman")
puts map.total_entries
p map.buckets

map.set("Bruce", "Hulk")
puts map.total_entries
p map.buckets

puts map.get ("Ororo")
puts map.get ("Logan")
puts map.get ("Kevin")
puts map.get ("Bruce")
