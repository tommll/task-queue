require 'net/http'
require 'json'
require 'dotenv'
Dotenv.load

BASE_URL = ENV['SERVER_URL']

# To enqueue a task:
def enqueue(function)
  uri = URI("#{BASE_URL}/enqueue")
  req = Net::HTTP::Post.new(uri)
  req['Content-Type'] = 'application/json'
  req.body = { function: function }.to_json
  res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
  puts res.body
end

# To perform tasks:
def perform
  uri = URI("#{BASE_URL}/perform")
  req = Net::HTTP::Post.new(uri)
  res = Net::HTTP.start(uri.hostname, uri.port) { |http| http.request(req) }
  puts res.body
end

# To dequeue results:
def dequeue
  uri = URI("#{BASE_URL}/dequeue")
  res = Net::HTTP.get_response(uri)
  puts res.body
end
