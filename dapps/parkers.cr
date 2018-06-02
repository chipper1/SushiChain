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

module ::Sushi::Core::DApps::User
  class Parkers < UserDApp
    TARGET_ACTION = "parkers"
    VALID_ADDRESS = "VDAxMjJmMTcyNWE1NmE0MjExZTk0ZThkMGRiYmM2ZjE1YTQ5OWRmODM1MzliYmUy"

    def valid_addresses
      [VALID_ADDRESS]
    end

    def valid_networks
      ["testnet"]
    end

    def related_transaction_actions
      [TARGET_ACTION]
    end

    def valid_transaction?(transaction, prev_transactions)
      true
    end

    def activate
      nil
    end

    def deactivate
      nil
    end

    def new_block(block)
      # block.transactions.each do |tx|
      #   if tx.action == TARGET_ACTION
      #     info "parkers' transaction coming!"
      #  
      #     sender = create_sender("0.00001")
      #     recipient = create_recipient(transaction.senders[0][:address], "0.00001")
      #  
      #     id = create_transaction_id(block, transaction)
      #  
      #     created = create_transaction(
      #       id,
      #       "send",
      #       sender,
      #       recipient,
      #       tx.message,
      #       TOKEN_DEFAULT,
      #     )
      #  
      #     info "created a transaction from CreateTransaction(UserDApp): #{id}" if created
      #   end
      # end
    end

    def define_rpc?(call, json, context)
      if call == "parkers"
        action = "parkers-record"
        amount = json["amount"].as_s

        sender = create_sender(amount)
        recipient = create_recipient(json["user"].as_s, amount)

        id = sha256(action + amount)

        tx = create_transaction(
          id,
          action,
          sender,
          recipient,
          "",
          TOKEN_DEFAULT,
        )

        context.response.print tx.to_json
        return context
      end

      nil
    end
  end
end
