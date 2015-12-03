require 'ruboty'
require 'ruboty/karma/version'
require 'ruboty/karma/actions/increase'
require 'ruboty/karma/actions/list'

module Ruboty
  module Handlers
    class Karma < Base
      on(
        /@?(?<username>\S+)\s*\+\+/m,
        name: 'increment',
        description: "increment a user's karma"
      )
      on(
        /list karma/,
        name: 'list',
        description: "list all menber's karma"
      )

      def increment(message)
        Ruboty::Karma::Actions::Increase.new(message).call
      end

      def list(message)
        Ruboty::Karma::Actions::List.new(message).call
      end
    end
  end
end
