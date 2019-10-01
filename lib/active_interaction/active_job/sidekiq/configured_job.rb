class ActiveInteraction::ActiveJob::Sidekiq::ConfiguredJob < ::ActiveJob::ConfiguredJob
  def perform_now(*args)
    @job_class.run!(*args)
  end

  def perform_later(*args)
    args = ActiveJob::Arguments.serialize(args)
    scope = @job_class.set(@options.except(:wait, :wait_until))

    if @job_class.sidekiq_options['encrypt']
      args.prepend(nil)
    end

    if @options[:wait]
      scope.perform_in @options[:wait], *args
    elsif @options[:wait_until]
      scope.perform_at @options[:wait_until], *args
    else
      scope.perform_async *args
    end
  end

  alias_method :run!, :perform_later
  alias_method :run, :perform_later
end
