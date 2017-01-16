
require 'active_support'
require 'active_support/rails'
require 'active_job'

require "active_interaction/active_job/version"

module ActiveInteraction
  module ActiveJob
    extend ActiveSupport::Autoload

    autoload :Core
    autoload :DefaultJob
    autoload :JobHelper
  end
end
