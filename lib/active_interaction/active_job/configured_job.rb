class ActiveInteraction::ActiveJob::ConfiguredJob
  def initialize job_class, service_class, options={}
    @options = options
    @service_class = service_class
    @job_class = job_class
  end

  def run *args
    @job_class.new(@service_class.name, *args).enqueue @options
  end

  alias_method :run!, :run
end
