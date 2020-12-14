require "minitest/autorun"

class TestIsbnThirteen < Minitest::Test
  def setup
    @isbn = IsbnThirteen.new
  end

  def test_isbn_has_twelve_digits
    assert_equal "true", @isbn.valid_digits?
  end

end