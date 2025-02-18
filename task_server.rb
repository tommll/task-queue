require_relative './task_queue'
require 'sinatra'
require 'json'

queue = TaskQueue.new

post '/enqueue' do
  content_type :json
  request_body = JSON.parse(request.body.read)
  queue.enqueue(request_body['function']).to_json
end

post '/perform' do
  content_type :json
  queue.perform.to_json
end

get '/dequeue' do
  content_type :json
  queue.dequeue.to_json
end
