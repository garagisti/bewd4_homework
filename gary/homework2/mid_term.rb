require 'rest-client'

# SDP: Please stick to Ruby conventions where possible, they especially
# become important in Rails, for examples rails would totally get Confused
# by WikiInput for a file name
require './WikiInput'
require './GenerateUri'
require './OutputResult'

wiki_input = WikiInput.new
action = wiki_input.get_action
format = wiki_input.get_format
rvprop = wiki_input.get_rvprop
prop = wiki_input.get_prop
search_term = wiki_input.get_search_term

parameters = { action: action, titles: search_term, rvprop: rvprop, format: format, prop: prop }

end_point = 'http://en.wikipedia.org/w/api.php'

# SDP: Good use of a class, but perhaps the responsibility of this
# class could have been divided up to keep each class lean
generate_uri = GenerateUri.new
uri = generate_uri.generate(end_point,parameters)

data = RestClient.get(uri)

puts uri
output_result = OutputResult.new
output_result.display_result(format, data)
