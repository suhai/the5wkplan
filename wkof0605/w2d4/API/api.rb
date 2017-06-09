require 'open-uri'
kittens = open('http://placekitten.com')
body = kittens.read[559, 441]
puts body


# require 'open-uri'
# placekitten = open('http://placekitten.com/')
# # Add your code below!
# puts placekitten.status