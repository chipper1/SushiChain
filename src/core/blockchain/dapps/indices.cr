module ::Sushi::Core
  class Indices < DApp
    @indices : Array(Hash(String, Int64)) = Array(Hash(String, Int64)).new

    def get(transaction_id : String) : Int64?
      @indices.reverse.each do |indices|
        return indices[transaction_id] if indices[transaction_id]?
      end

      nil
    end

    def actions : Array(String)
      [] of String
    end

    def related?(action : String) : Bool
      true
    end

    def valid_impl?(transaction : Transaction, prev_transactions : Array(Transaction)) : Bool
      true
    end

    def record(chain : Models::Chain)
      return if @indices.size >= chain.size

      chain[@indices.size..-1].each do |block|
        @indices.push(Hash(String, Int64).new)

        block.transactions.each do |transaction|
          @indices[-1][transaction.id] = block.index
        end
      end
    end

    def clear
      @indices.clear
    end

    def fee(action : String) : Int64
      0_i64
    end
  end
end