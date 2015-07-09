# This class generates the URL parameters used in the query
class WikiInput

# generic method to read input as text input
  def read_input(prompt, error_message, acceptable_values)
    puts prompt
    acceptable_values.each do |value|
      puts value
    end
    valid_input = false
    input = ''
    while (!valid_input)
      input = gets.chomp
      valid_input = acceptable_values.include?(input)
      if (!valid_input)
        puts error_message
      end
    end
    input
  end

# generic method to read input as a number selection
  def read_input_from_menu(prompt, error_message, acceptable_values)
    valid_input = false; #SDP: Note the redundant ;
    int_input = '0' # SDP: Why is this a string and not a number?
    while (!valid_input)
      puts prompt
      acceptable_values.each_with_index do |value, index|
        puts "#{index}:  #{acceptable_values[index]}"
      end

      input = gets.chomp
      int_input = Integer(input) rescue nil
      # SDP: Better if this was all part of the if statement
      # Plus the code still fails if I enter an invalid numeric value
      valid_input = (int_input != nil) && (int_input > -1) && (int_input < acceptable_values.size)
      if (!valid_input)
        puts error_message
      end
    end
    acceptable_values[int_input]
  end

  def get_action
    prompt = 'Enter the action type.  Select one of the numbers below:'
    error_message = 'Input not an integer in the available list.  Enter again.'
    acceptable_values = ['query']
    read_input_from_menu(prompt, error_message, acceptable_values)
  end

  def get_rvprop
    prompt = 'Enter the rvprop value.  Select one of the numbers below:'
    error_message = 'Input not an integer in the available list.  Enter again.'
    acceptable_values = ['ids', 'flags', 'timestamp', 'user', 'userid', 'size',
                         'sha1', 'contentmodel', 'comment', 'parsedcomment',
                         'content', 'tags']
    read_input_from_menu(prompt, error_message, acceptable_values)
  end

  def get_format
    prompt = 'Enter the format.  Select one of the numbers below:'

    # SDP: This variable is duplicated across the methods, better being
    # an instance variable instead
    error_message = 'Input not an integer in the available list.  Enter again.'
    acceptable_values = ['dbg', 'dbgfm', 'dump', 'dumpfm', 'json', 'jsonfm',
                         'none', 'php', 'phpfm', 'rawfm', 'txt', 'txtfm',
                         'wddx', 'wddxfm', 'xml', 'xmlfm', 'yaml', 'yamlfm']
    read_input_from_menu(prompt, error_message, acceptable_values)
  end


  def get_prop
    prompt = 'Enter the prop value.  Select one of the numbers below:'
    error_message = 'Input not an integer in the available list.  Enter again.'
    acceptable_values = ['revisions']
    read_input_from_menu(prompt, error_message, acceptable_values)
  end

  def get_search_term
    puts 'Enter the search term (can be anything):'
    # SDP: To return gets.chomp would have sufficed
    input = gets.chomp
    input
  end

end
