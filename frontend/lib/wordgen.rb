require_relative 'yamlapi'

module Wordgen
    def Wordgen.get_from_catagory(catagory)
        data_file = Yamlapi.new("dictionary")
        data = Hash.new
        begin
            data = data_file.get_data()
        rescue Exception => e
            return "ERROR"
        end
        return data[catagory][rand(data[catagory].length)]
    end
end