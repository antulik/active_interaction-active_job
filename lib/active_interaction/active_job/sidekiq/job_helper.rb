module ActiveInteraction::ActiveJob::Sidekiq::JobHelper
  def perform *args
    args = ActiveJob::Arguments.deserialize(args)
    self.class.parent.run!(*args)
  end
end
