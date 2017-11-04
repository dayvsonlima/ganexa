require 'thor'
require 'ganexa'
require_relative '../server/app'

trap('SIGINT') { exit! }

module Ganexa
  class CLI < Thor
    include Thor::Actions

    map %w(-v --version) => :version

    desc 'server', 'ganexa server'
    def server
      App.run!
    end

    desc 'version', 'ganexa version'
    def version
      puts Ganexa::VERSION
    end
  end
end
