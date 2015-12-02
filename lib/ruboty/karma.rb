require 'ruboty'
require 'ruboty/karma/version'

module Ruboty
  module Handlers
    class Karma < Base
      on(
        /@?(?<username>)\s*\+\+/m,
        name: 'increment',
        description: "increment a user's karma"
      )

      def increment(message)
        Ruboty::Karma::Actions::Increase.new(message).call
      end
    end
  end
end
