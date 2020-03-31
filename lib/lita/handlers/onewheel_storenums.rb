require 'rest-client'

module Lita
  module Handlers
    class OnewheelStorenums < Handler
      route /^storenum (.+)$/i, :lookup_store, command: true

      def lookup_store(response)
        response.reply 'x'
      end

      Lita.register_handler(self)
    end
  end
end
