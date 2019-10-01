module ActiveInteraction::ActiveJob::Sidekiq::JobHelper
  def perform *args
    if args.length > 1 && args[0].nil?
      args.shift
    end

    args = ActiveJob::Arguments.deserialize(args)
    self.class.parent.run!(*args)
  end
end
