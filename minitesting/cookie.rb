class Cookie

  CALORIES_IN_SUGAR = 4
  CALORIES_IN_FLOUR = 4


  def initialize(sugar, flour)
    @sugar = sugar
    @flour = flour
  end

  def calorie_count
    @sugar*CALORIES_IN_SUGAR +
    @flour*CALORIES_IN_FLOUR
    # @calories
  end

end
