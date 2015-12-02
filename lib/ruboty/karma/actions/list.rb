module Ruboty
  module Karma
    module Actions
      class List < Ruboty::Actions::Base
        def call
          key = 'karma-list'
          brain = message.robot.brain
          brain.data[key] ||= []
          lists = brain.data[key].map do |user|
            [user, brain.data["karma-@#{user}"]]
          end
          text = lists.sort_by { |e| -e[1] }.map { |e| e.join(': ') }.join("\n")
          message.reply(text)
        end
      end
    end
  end
end
