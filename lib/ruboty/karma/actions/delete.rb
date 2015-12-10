module Ruboty
  module Karma
    module Actions
      class Delete < Ruboty::Actions::Base
        def call
          name = message[:name]
          reset(name)
          delete_user(name)
          reply(name)
        end

        private

        def reply(name)
          message.reply("Deleted #{name}")
        end

        def delete_user(name)
          brain = message.robot.brain
          key = 'karma-list'
          brain.data[key] ||= []
          users = brain.data[key]
          users.delete(name)
          brain.data[key] = users
        end

        def reset(name)
          brain = message.robot.brain
          key = "karma-@#{name}"
          brain.data[key] = nil
        end
      end
    end
  end
end
