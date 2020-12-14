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
  # Should have the first 12 digits
  ISBN_PATTERN = /^\d{11}[\dX]$/.freeze
  
  def calculate_last_digit(isbn)
    # Cleanse all dashes
    isbn = isbn.gsub('-', '')

    # return false unless valid_digits?(isbn)

    # total = 0

    # isbn.chars.each.with_index do |digit, index|
    #   digit = 10 if digit == 'X'
    #   total += digit.to_i * (index + 1)
    # end
    # (total % 11).zero?
  end

  def valid_digits?(isbn)
    isbn =~ ISBN_PATTERN
  end

end