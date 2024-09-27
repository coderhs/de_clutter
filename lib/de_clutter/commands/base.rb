require 'ostruct'
require 'mimemagic'
require 'json'

module DeClutter
  class Base < Dry::CLI::Command
    def exit_with_message(message, status)
      puts message
      exit(status)
    end
  end
end
