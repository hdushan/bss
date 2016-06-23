require 'yaml'
require 'ostruct'

module BSSWizard
  class Settings
    def self.setup(env)
      filename = "#{env}.yml"
      YAML.load_file(File.join("config", filename)).each do |key, value|
        return_value = value.kind_of?(Hash) ? OpenStruct.new(value) : value

        define_singleton_method key do
          return_value
        end
      end
    end
  end
end