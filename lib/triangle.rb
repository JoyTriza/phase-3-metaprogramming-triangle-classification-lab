class Triangle

  attr_reader :x, :y, :z
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def kind
    validate_triangle
    if x == y && y == z
      :equilateral
    elsif x == y || y == z || x == z
      :isosceles
    else
      :scalene
    end
  end

  def is_larger_than_zero?
    [x, y, z].all?(&:positive?)
  end

  def is_larger_than_two?
    x + y > z && x + z > y && y + z > x
  end

  def validate_triangle
    raise TriangleError unless is_larger_than_zero? && is_larger_than_two?
  end

  class TriangleError < StandardError
  end
end