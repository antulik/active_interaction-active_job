module ActiveInteraction::ActiveJob::JobHelper
  def perform *args
    self.class.parent.run!(*args)
  end
end
