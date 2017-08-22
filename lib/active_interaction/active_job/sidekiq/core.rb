module ActiveInteraction::ActiveJob::Sidekiq::Core
  extend ActiveSupport::Concern
  include ActiveInteraction::ActiveJob::Core

  module ClassMethods
    def delay options = {}
      ::ActiveInteraction::ActiveJob::Sidekiq::ConfiguredJob.new(job_class, options)
    end
  end
end
