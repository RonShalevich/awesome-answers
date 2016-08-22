
#grab what you are testing with this:
# require "./cookie.rb"
#
# require "minitest/autorun"
#
# class CookieTest < MiniTest::Test
#
#   # to define a test example, you should define a method that starts with
#   # test_
#
#   def test_calorie_count
#
#     #GIVEN: we have a cookie object with 5g of sugar and 7g of flour
#     c = Cookie.new(5, 7)
#
#     #WHEN: when we call calorie_count on the object that we have
#     outcome = c.calorie_count
#
#     #THEN: We should get back 48 (calories)
#     assert_equal(48, outcome)
#
#   end
#
# end

require "./rectangle.rb"

require "minitest/autorun"

class RectangleTest < MiniTest::Test

  def test_area

    #GIVEN: Width and Height
    c = Rectangle.new(5, 7)

    #WHEN: we call area method
    outcome = c.area

    #THEN: We should get back 35
    assert_equal(35, outcome)
  end

  def test_is_square?
    #GIVEN: Width and Height
    d = Rectangle.new(6, 6)

    #WHEN: we call is_square? method
    outcome = d.is_square?

    #THEN: We should get back true
    assert_equal(true, outcome)

    #GIVEN: Width and Height
    d = Rectangle.new(6, 7)

    #WHEN: we call is_square? method
    outcome = d.is_square?

    #THEN: We should get back true
    assert_equal(false, outcome)
  end

end
