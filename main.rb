require_relative './task_queue'

queue = TaskQueue.new
queue.enqueue('study')

puts 'done enqueue'

queue.perform

puts 'done perform'

puts queue.dequeue
