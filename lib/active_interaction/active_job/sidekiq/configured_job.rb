class ActiveInteraction::ActiveJob::Sidekiq::ConfiguredJob < ::ActiveJob::ConfiguredJob
  def perform_now(*args)
    @job_class.run!(*args)
  end

  def perform_later(*args)
    wait = @options.delete(:wait)
    wait_until = @options.delete(:wait_until)

    args = ActiveJob::Arguments.serialize(args)

    scope = @job_class.set(options)
    if wait
      scope.perform_in(wait, *args)
    elsif wait_until
      scope.perform_at(wait_until, *args)
    else
      scope.perform_async(*args)
    end
  end
end
