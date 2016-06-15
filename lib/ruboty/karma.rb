require 'ruboty'
require 'ruboty/karma/version'
require 'ruboty/karma/actions/increase'
require 'ruboty/karma/actions/list'
require 'ruboty/karma/actions/delete'

module Ruboty
  module Handlers
    class Karma < Base
      INCREMENT_PATTERN = /@?(?<name>[^@:\s]+):?\s+\+\+/m
      DELETE_PATTERN = /delete karma @?(?<name>[^@:\s]+):?/m
      LIST_PATTERN = /list karma(\s+(?<args>.+))?/

      on(
        INCREMENT_PATTERN,
        name: 'increment',
        description: "increment a user's karma"
      )
      on(
        LIST_PATTERN,
        name: 'list',
        description: "list all users' karma"
      )
      on(
        DELETE_PATTERN,
        name: 'delete',
        description: "delete a user's karma"
      )

      def increment(message)
        Ruboty::Karma::Actions::Increase.new(message).call
      end

      def list(message)
        Ruboty::Karma::Actions::List.new(message).call
      end

      def delete(message)
        Ruboty::Karma::Actions::Delete.new(message).call
      end
    end
  end
end
