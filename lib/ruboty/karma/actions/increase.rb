module Ruboty
  module Karma
    module Actions
      class Increase < Ruboty::Actions::Base
        def call
          name = message[:name]
          add_user(name)
          updated_karma = increment(name)
          replay(name, updated_karma)
        end

        private

        def reply(name, updated_karma)
          template = ENV['RUBOTY_KARMA_ADD'] || '%s: %d'
          message.reply(format(template, name, updated_karma))
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
