module ActiveInteraction::ActiveJob::Sidekiq::Core
  extend ActiveSupport::Concern
  include ActiveInteraction::ActiveJob::Core

  module ClassMethods
    def default_job_class
      ActiveInteraction::ActiveJob::Sidekiq::DefaultJob
    end

    def set options = {}
      ::ActiveInteraction::ActiveJob::Sidekiq::ConfiguredJob.new(job_class, options)
    end
  end
end
