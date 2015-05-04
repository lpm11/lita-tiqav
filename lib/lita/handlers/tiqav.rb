require 'tiqav'

module Lita
  module Handlers
    class Tiqav < Handler
      route /tiqav (.*)/i, :tiqav, command: false

      def tiqav(response)
        query = response.matches[0][0]

        begin
          results = ::Tiqav.search(query)
          raise if (results.empty?)

          url = results.first.url.to_s()
        rescue
          response.reply("#{query} not matched.")
          return
        end
        response.reply(url)
      end
    end

    Lita.register_handler(Tiqav)
  end
end
