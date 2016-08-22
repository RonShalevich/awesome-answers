class Rectangle

  def initialize(width, length)
    # @width = width
    # @length = length

    @width, @length = width, length
  end

  def area
    @width * @length
  end

  def is_square?
    @width == @length
  end

end
