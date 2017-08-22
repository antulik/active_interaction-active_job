class ActiveInteraction::ActiveJob::Sidekiq::DefaultJob
  include Sidekiq::Worker
  include ActiveInteraction::ActiveJob::Sidekiq::JobHelper
end
