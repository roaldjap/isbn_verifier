# ISBN13 Barcode Verifier

[![Build Status](https://travis-ci.com/roaldjap/isbn_verifier.svg?branch=master)](https://travis-ci.com/github/roaldjap/isbn_verifier)
A ISBN13 Verifier made in Ruby. The following project uses the following:

  - *Minitest* - for Unit Testing 
  - Integrated Test with *TravisCI*
  - Uses `bundle exec rake test` command to test it out
----
# Installation
This project requires atleast Ruby 2.6+
  - Clone this repository then, run `bundle install`
---
# Usage
### Unit Testing
All files has suffix with `_test.rb` will be tested by Minitest, You can add / modify test cases there.
  - To run the test
```sh
$ bundle exec rake test
```


# Given Problem:

Write best practice code in Ruby to calculate the check digit of an ISBN13 barcode

The algorithm is: Take each digit, from left to right and multiply them alternatively by 1 and 3
Sum those numbers
Take mod 10 of the summed figure
Subtract 10 and if the end number is 10, make it 0

Example for 978014300723:
(9×1) + (7×3) + (8×1) + (0×3) + (1×1) + (4×3) + (3×1) + (0×3) + (0×1) + (7×3) + (2×1) + (3×3)
86
86 mod 10 = 6
10 – 6 = 4

Therefore the complete ISBN is: 9780143007234