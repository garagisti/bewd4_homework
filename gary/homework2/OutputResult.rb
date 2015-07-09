# This class outputs the result (in JSON or text format as appropriate
require 'json'
require 'neatjson'

class OutputResult
  
  def display_result(format, data)
    if format == 'json'
      json_data = JSON.parse(data)
      puts JSON.neat_generate(json_data, short: true)
    else
      puts data
      end
  end
end