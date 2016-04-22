require 'psych'

class Yamlapi
    def initialize(file_to_load)
        begin
            @file_data = Psych.load_file("./frontend/data/#{file_to_load}.yaml")
        rescue
            puts "YAML parse error"
            @file_data = nil
        end
    end
    def get_data()
        if @file_data.nil?
            return nil
        else
            return @file_data
        end
    end
end