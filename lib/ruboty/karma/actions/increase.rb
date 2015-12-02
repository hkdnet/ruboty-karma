module Ruboty
  module Karma
    module Actions
      class Increase < Ruboty::Actions::Base
        def call
          username = message[:username]
          brain = message.robot.brain
          key = "karma-#{username}"
          brain.data[key] ||= 0
          brain.data[key] += 1
          message.reply("#{username}: #{brain.data[key]}")
        end
      end
    end
  end
end
