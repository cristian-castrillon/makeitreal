require "calculadora/version"

module Calculadora
  def self.sum(num1, num2)
    num1 + num2
  end

  def self.times(num1, num2)
    num1 * num2
  end

  def div(num1, num2)
    num1 / num2
  end

  def self.math(num1, num2, num3)
    sum(times(num1, num2), num3)
  end
end
