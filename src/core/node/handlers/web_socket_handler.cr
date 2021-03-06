# Copyright © 2017-2018 The SushiChain Core developers
#
# See the LICENSE file at the top-level directory of this distribution
# for licensing information.
#
# Unless otherwise agreed in a custom licensing agreement with the SushiChain Core developers,
# no part of this software, including this file, may be copied, modified,
# propagated, or distributed except according to the terms contained in the
# LICENSE file.
#
# Removal or modification of this copyright notice is prohibited.

module ::Sushi::Core
  class WebSocketHandler < HTTP::WebSocketHandler
    def initialize(@path : String, &@proc : HTTP::WebSocket, HTTP::Server::Context -> Void)
    end

    def call(context : HTTP::Server::Context)
      if context.request.path == @path
        super(context)
      else
        call_next(context)
      end
    end
  end
end
