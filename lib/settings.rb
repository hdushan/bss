require 'yaml'
require 'ostruct'

class Settings
  def self.setup(env)
    filename = "#{env}.yml"
    YAML.load(File.open(File.join(File.dirname(__FILE__), "../config/", filename))).each do |key, value|
      return_value = value.kind_of?(Hash) ? OpenStruct.new(value) : value

      define_singleton_method key do
        return_value
      end
    end
  end
end