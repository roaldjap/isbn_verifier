require "minitest/autorun"
require "./isbn_thirteen"

class IsbnThirteenTest < Minitest::Test
  
  def test_isbn_should_have_12_digits
    string = "978014300723"
    assert IsbnThirteenVerify.valid?(string), "Expected true, '#{string}' has only '#{string.length}' digits!"
  end

  def test_isbn_has_12_digits_with_dashes
    string = "978-3-16-148410-"
    assert IsbnThirteenVerify.valid?(string), "Expected true, '#{string}' did not even sanitized"
  end

  def test_isbn_has_13_digits_already
    string = "978-3-16-148410-0"
    assert IsbnThirteenVerify.valid?(string), "Expected true, '#{string}' has only '#{string.length}' digit(s)!"
  end

  # Expected Failures

  def test_isbn_has_invalid_length
    string = "12345-67890"
    refute IsbnThirteenVerify.valid?(string), "Expected false, '#{string}' is a invalid isbn format."
  end

  def test_isbn_has_13_alpha_numeric_characters
    string = "12345-67890-AFS"
    refute IsbnThirteenVerify.valid?(string), "Expected false, '#{string}' is a invalid isbn format."
  end

end