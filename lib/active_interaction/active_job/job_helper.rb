module ActiveInteraction::ActiveJob::JobHelper
  def perform interaction_klass_name, *args
    interaction_klass_name.constantize.run!(*args)
  end
end
