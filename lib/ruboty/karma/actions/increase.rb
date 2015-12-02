module Ruboty
  module Karma
    module Actions
      class Increase < Ruboty::Actions::Base
        def call
          name = message[:username]
          add_user(name)
          updated_karma = increment(name)
          message.reply("#{name}: #{updated_karma}")
        end

        def add_user(name)
          brain = message.robot.brain
          key = 'karma-list'
          brain.data[key] ||= []
          users = brain.data[key]
          brain.data[key] = users.push(name).uniq
        end

        def increment(name)
          brain = message.robot.brain
          key = "karma-@#{name}"
          brain.data[key] ||= 0
          brain.data[key] += 1
        end
      end
    end
  end
end
