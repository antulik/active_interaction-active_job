module ActiveInteraction::ActiveJob::Core
  extend ActiveSupport::Concern

  included do
    define_job_class
  end

  module ClassMethods
    def define_job_class klass = default_job_class
      unless const_defined?(:Job, false)
        const_set(:Job, Class.new(klass))
      end
    end

    def default_job_class
      ActiveInteraction::ActiveJob::DefaultJob
    end

    def active_job &block
      job_class.class_exec(&block)
    end

    def job_class
      const_get(:Job, false)
    end

    def inherited subclass
      super
      subclass.define_job_class job_class
    end

    def set options = {}
      ::ActiveJob::ConfiguredJob.new(job_class, options)
    end

    alias_method :delay, :set

    def async *args
      delay.run! *args
    end
  end
end
