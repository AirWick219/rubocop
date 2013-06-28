# encoding: utf-8

module Rubocop
  module Cop
    module Style
      # This cop checks the . position in multi-line method calls.
      class DotPosition < Cop
        MSG = 'Place the . on the next line, together with the method name.'

        def on_send(node)
          return unless node.loc.dot

          dot_line = node.loc.dot.line
          selector_line = node.loc.selector.line

          if dot_line != selector_line
            add_offence(:convention, node.loc.dot, MSG)
          end

          super
        end
      end
    end
  end
end
