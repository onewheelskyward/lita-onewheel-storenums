require 'rest-client'

module Lita
  module Handlers
    class OnewheelStorenums < Handler
      route /^storenum (.+)$/i, :lookup_store, command: true

      def lookup_store(response)
        if response.matches[0][0].length < 3
          response.reply "Please send at least 3 characters to match."
          return
        end

        possibilities = []

        f = File.open('stores.dat').each do |line|
          line.chomp!
          possibilities.push line if line.match /#{response.matches[0][0]}/i
        end
        response.reply possibilities.join ', '
      end

      Lita.register_handler(self)
    end
  end
end
