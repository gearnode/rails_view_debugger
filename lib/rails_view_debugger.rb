#require "rails_view_debugger/version"
require 'logger'

module RailsViewDebugger
  LOGGER = Logger.new(STDOUT)

  def trace(&block)
    if block_given?
      block.call
    end
  rescue => e
    LOGGER.error(e.class)
    LOGGER.error(e.message)
    LOGGER.error(e.backtrace.join("\n"))
    fail e
  end
  module_function :trace
end
