puts 'SERIALIZATION'
puts 'JSON'
# this is the process of converting a ruby (whatever language) to a format that can be saved to the hard drive for future reloading or transfer to another computer over a network.
# There are many formats of serializing or representung data, the most popular of which is JSON. JSON supports a few primitive forms of data: numbers, strings, arrays and hashes.
# You can easily serialize basic Ruby objects to a JSON string:

# exmaple1.rb
 require 'json'
{ "a" => "always",
    "b" => "be",
    "c" => "closing" }.to_json # '{"a":"always","b":"be","c":"closing"}'

JSON.parse('{"a":"always","b":"be","c":"closing"}') # {"a"=>"always", "b"=>"be", "c"=>"closing"}

# JSON doesn't know how to serialize more complicated classes though:
Cat.new("Breakfast", 8, "San Francisco").to_json #<Cat:0x007fb87c81b398>
# This iw here YAML comes to the rescue.

puts 'YAML'
# example2.rb
require 'yaml'
c = Cat.new("Breakfast", 8, "San Francisco")
#<Cat:0x007ff434926690 @age=8, @city="San Francisco", @name="Breakfast">
puts c.to_yaml #
# --- !ruby/object:Cat
# name: Breakfast
# age: 8
# city: San Francisco

serialized_cat = c.to_yaml #
# "--- !ruby/object:Cat\nname: Breakfast\nage: 8\ncity: San Francisco\n"

puts serialized_cat #
# --- !ruby/object:Cat
# name: Breakfast
# age: 8
# city: San Francisco

puts YAML::load(serialized_cat)
#<Cat:0x007ff4348098e8 @age=8, @city="San Francisco", @name="Breakfast">