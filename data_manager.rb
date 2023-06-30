require 'json'

class DataManager
  def save_data(filename, data)
    File.new(filename, 'w') unless File.exist?(filename)
    serialize_data = data.map(&:serialize)
    File.open(serialize_data.to_json)
  end
end
