# Write best practice code in Ruby to calculate the check digit of an ISBN13 barcode

# The algorithm is:
# Take each digit, from left to right and multiply them alternatively by 1 and 3
# Sum those numbers
# Take mod 10 of the summed figure
# Subtract 10 and if the end number is 10, make it 0
# Example for 978014300723:
# (9×1) + (7×3) + (8×1) + (0×3) + (1×1) + (4×3) + (3×1) + (0×3) + (0×1) + (7×3) + (2×1) + (3×3)
# 86
# 86 mod 10 = 6
# 10 – 6 = 4
# Therefore the complete ISBN is: 9780143007234

class IsbnThirteen
  def initialize(str)
    @str = str
  end

  def valid?
    # print entry number
    puts "\n----------------------------\n"
    puts "Input: #{@str}"

    if valid_format?
      puts "Calculated Output: #{get_complete_isbn} \n"
      # puts "Calculated ISBN13: #{get_complete_isbn.insert(3, '-').insert(5, '-').insert(10, '-').insert(15,'-')} \n"
      puts "----------------------------\n"
      return get_complete_isbn
    
    elsif has_complete_isbn13?
      puts "ALREADY VALID ISBN13: #{sanitized_str}"
      puts "----------------------------\n"
      return sanitized_str
    else
      puts "ERROR: Invalid ISBN13 format!\n"
      puts "----------------------------\n"
    end
  end
  
  private

  # Remove all dashes
  def sanitized_str
    @sanitized_str ||= @str.delete('-')
  end

  
  # once dashes are removed,
  # Accepts only 12 numbers
  def valid_format?
    sanitized_str =~ /^\d{12}$/
  end

  def has_complete_isbn13?
    sanitized_str =~ /^\d{13}$/
  end

  # Force convert all of the group of characters to integers 
  def num_list
    sanitized_str.chars.map do |c|
      c.to_i
    end
  end

  
  def sum_of_multiplied_numbers
    # multiply by 1 or 3
    # then get the sum of all multiplied numbers
    total = 0
    num_list.each_with_index do |num, index|
      index += 1

      if index.odd?
        total += (num * 1)
      else
        total += (num * 3)
      end
    end

    return total
  end

  def get_last_digit
    mod = sum_of_multiplied_numbers % 10
    last_digit = 10 - mod

    last_digit = 0 if last_digit == 10

    return last_digit
  end

  def get_complete_isbn
    isbn = sanitized_str.to_s
    last_digit = get_last_digit.to_s

    isbn = isbn << last_digit

    return isbn
  end



end

module IsbnThirteenVerify
  def self.valid?(str)
    IsbnThirteen.new(str).valid?
  end
end