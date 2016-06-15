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
          sorted = lists.sort_by { |e| -e[1] }
          text = sorted.map { |e|
            e.last = quiet_name(e.last) if quiet?
            e.join(': ')
          }.join("\n")
          message.reply(text)
        end

        def args
          message['args'].split(/\s+/)
        end

        def quiet?
          args.include?('-q') || args.include?('--quiet')
        end

        def quiet_name(name)
          name.split('').join(' ')
        end
      end
    end
  end
end
