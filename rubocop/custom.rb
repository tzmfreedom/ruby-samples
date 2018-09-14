module RuboCop
  module Cop
    module Style
      class Custom < Cop
        MSG = 'Use variable on rescue clause'

        # def on_send(node)
        #   receiver, method_name, *args = *node
        #   if method_name.to_s == 'hogehoge'
        #     add_offense(node)
        #   end
        # end

        def_node_matcher :res, <<-PATTERN
          (resbody nil? (lvasgn $...) ...)
        PATTERN

        def on_resbody(node)
          rescued, variable, body = *node
          return unless variable

          offense = true
          checker = VariableChecker.new(variable.children[0])

          if body.send_type? && checker.(body)
            offense = false
          elsif body.begin_type?
            body.children.each do |child|
              if checker.(child)
                offense = false
              end
            end
          end

          if offense
            add_offense(node)
          end
        end
      end
    end

    class VariableChecker
      def initialize(variable_name)
        @variable_name = variable_name
      end

      def call(node)
        return true unless node.send_type?

        _, _, *args = *node
        args.each do |arg|
          if arg.variable? && arg.children[0] == @variable_name
            return true
          end
        end

        false
      end
    end
  end
end
