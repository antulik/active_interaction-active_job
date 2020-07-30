module ActiveInteraction::ActiveJob::Sidekiq::JobHelper
  def perform *args
    # support for sidekiq encrypted params
    if args.length > 1 && args[0].nil?
      args.shift
    end

    args = ActiveJob::Arguments.deserialize(args)
    if self.class.respond_to?(:module_parent)
      self.class.module_parent.run!(*args)
    else
      self.class.parent.run!(*args)
    end
  end
end
