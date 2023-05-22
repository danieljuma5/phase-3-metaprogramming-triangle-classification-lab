require "pry"
class Triangle
  attr_reader :length, :width, :height
    def initialize(length,width,height)
      @length = length
      @width = width
      @height = height
    end
   def kind
    validate_triangle
    if length == width && width == height
      :equilateral
    elsif length == width || length == height || width == height
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_sides
    validate_triangle_inequality
  end

  def validate_positive_sides
    raise TriangleError, 'Triangle sides must be greater than 0' if @length <= 0 || @width <= 0 || @height <= 0
  end

  def validate_triangle_inequality
    unless length + width > height && width + height > length && length + height > width
      raise TriangleError, 'Triangle inequality violation'
    end
  end

  class TriangleError < StandardError
  end
end

