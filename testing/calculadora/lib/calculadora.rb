require "calculadora/version"

module Calculadora
  def self.sum(num1, num2)
    num1 + num2
  end

  def self.times(num1, num2)
    num1 * num2
  end

  def self.div(num1, num2)
    num1 / num2
  end

  def self.math(num1, num2, num3)
    sum(times(num1, num2), num3)
  end

  def self.sumatory(arr)
    sum = 0
    arr.each { |num| sum += num.to_i }
    sum
    # arr.map(&:to_i)reduce(:+) || 0
  end
end
