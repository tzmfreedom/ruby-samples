module RuboCop
  module Cop
    module Style
      class Custom < Cop
        MSG = 'foobar'

        def on_send(node)
          receiver, method_name, *args = *node
          if method_name.to_s == 'hogehoge'
            add_offense(node)
          end
        end

        def on_resbody(node)
          rescued, variable, body = *node
          if body.send_type?
            receiver, method_name, *args = *body
            args.each do |arg|
              if arg.variable?
                if arg.children[0] == :e
                  add_offense(node)
                end
              end
            end
          end
        end

        def on_lvasgn(node)
          lhs, rhs = *node
        end
      end
    end
  end
end
