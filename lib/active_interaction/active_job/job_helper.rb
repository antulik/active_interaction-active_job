module ActiveInteraction::ActiveJob::JobHelper
  def perform *args
    if self.class.respond_to?(:module_parent)
      self.class.module_parent.run!(*args)
    else
      self.class.parent.run!(*args)
    end
  end
end
