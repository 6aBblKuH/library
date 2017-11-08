# frozen_string_literal: true

class Book
  attr_reader :title, :author
  attr_accessor :rate

  def initialize(title, author)
    @title = title
    @author = author
    @rate = 0
  end

  def to_s
    "#{@title}, #{@author.name}"
  end

  def <=>(other)
    raise 'Unnormed data' unless other.is_a?(Book)
    rate <=> other.rate
  end
end
