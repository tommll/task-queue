require_relative './worker'

class TaskQueue
  def initialize
    @work_queue = []
    @result_queue = []
    @worker = Worker.new
    @is_working = false
  end

  def enqueue(function)
    @work_queue << function
    { message: 'Task enqueued successfully' }
  end

  def dequeue
    return { error: 'No result to dequeue' } if @result_queue.empty?

    { result: @result_queue.shift }
  end

  def perform
    return { error: 'Already working' } if @is_working

    return { error: 'No work to do' } if @work_queue.empty?

    @is_working = true
    work = @work_queue.shift
    @result_queue << @worker.send(work)
    @is_working = false

    { message: 'Task performed successfully' }
  end
end
