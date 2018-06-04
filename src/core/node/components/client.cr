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

module ::Sushi::Core::NodeComponents
  #
  # todo:
  # memo
  #
  class ClientHandler < HandleSocket
    alias ClientContext = NamedTuple(id: String)
    alias Client = NamedTuple(context: ClientContext, socket: HTTP::WebSocket)

    @socket_pool = [] of HTTP::WebSocket

    def send(socket, t, content)
      
    end

    def clean_connection(socket)
      @socket_pool.delete(socket)
    end

    def client(socket : HTTP::WebSocket)
      @socket_pool << socket
    end
  end
end
