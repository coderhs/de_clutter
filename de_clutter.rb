require 'dry/cli'

module DeClutter
  module Commands
    extend Dry::CLI::Registry

    # Require each command file
    require_relative 'lib/de_clutter/commands/organize_folder'

    # Register the commands
    Commands.register 'organize_folder', OrganizeFolder
  end

  # Base CLI class that registers commands
  class Base
    def self.start(args)
      Dry::CLI.new(Commands).call(arguments: args)
    end
  end
end

DeClutter::Base.start(ARGV)
