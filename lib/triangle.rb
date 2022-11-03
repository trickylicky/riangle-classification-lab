require "pry"
class Triangle

  attr_accessor :side_a,:side_b,:side_c

  def initialize(side_a,side_b,side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end
  def kind
    if @side_a == @side_b && @side_b == @side_c
      :equilateral
    elsif @side_a == @side_b && @side_b !=  @side_c || @side_b == @side_c && @side_b !=  @side_a || @side_a == @side_c && @side_b !=  @side_c
      :isosceles
    else 
      :scalene
    end
  end

  def sides_greater_than_zero?
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end

