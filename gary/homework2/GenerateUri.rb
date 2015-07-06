# This class generates the full URI of the query
class GenerateUri

  def generate(end_point, parameters)
    first_parameter = true
    uri = ''
    # SDP: Can also say parameters.each do |key,value|
    # which is a bit neater, then all you need to say
    # in the code is value instead of parameters[key]
    parameters.keys.each do |key|
      if first_parameter
        # SDP: Use string interpolation where possible as it is
        # more efficient in Ruby
        uri = end_point + '?' + key.to_s + '=' + parameters[key]
        first_parameter = false
      else
        # SDP: Same again use string interpolation where possible
        uri += '&' + key.to_s + '=' + parameters[key]
      end
    end
    uri
  end

end
