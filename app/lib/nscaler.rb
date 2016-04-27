require_relative 'entrychooser'

module NScaler
    def NScaler.scale(start_level, query)
        if start_level <= 1
            return ""
        end
        result = EntryChooser.get(start_level, query)
        if result.eql?("")
            return EntryChooser.get(start_level - 1, query.last(start_level - 1))
        else
            return result
        end
    end
end