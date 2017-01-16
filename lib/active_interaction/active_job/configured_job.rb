class ActiveInteraction::ActiveJob::ConfiguredJob < ::ActiveJob::ConfiguredJob

  alias_method :run!, :perform_later
  alias_method :run, :perform_later

end
