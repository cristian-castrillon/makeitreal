require "test_helper"

class CalculadoraTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Calculadora::VERSION
  end

  # def test_it_does_something_useful
  #   assert false
  # end

  def test_it_sums_two_positive_numbers
    suma = Calculadora.sum(2, 4)
    # assert suma == 6, 'sum should be 6'
    assert_equal suma, 6, 'sum should be 6'
  end

  def test_it_multiply_two_positive_numbers
    multiply = Calculadora.times(2, 4)
    assert_equal multiply, 8, 'result should be 8'
  end

  def test_it_multiply_two_numbers_with_different_sign
    multiply = Calculadora.times(2, -4)
    assert_equal multiply, -8, 'result should be -8'
  end

  def test_it_should_raise_error_if_dividin_by_zero
    # result = Calculadora.div(2, 0)
    assert_raises ZeroDivisionError do
      Calculadora.div(2, 0)
    end
  end

  # def test_it_should_compute_math
    
  # end

  def test_it_sumatory_of_array_1
    sumatoria = Calculadora.sumatory([])
    assert_equal sumatoria, 0
  end

  def test_it_sumatory_of_array_2
    sumatoria = Calculadora.sumatory([1, 2, 3, 4])
    assert_equal sumatoria, 10
  end

  def test_it_sumatory_of_array_3
    sumatoria = Calculadora.sumatory([-1, -2, -3, -4])
    assert_equal sumatoria, -10
  end

  def test_it_sumatory_of_array_4
    sumatoria = Calculadora.sumatory([1, -2, 3, -4])
    assert_equal sumatoria, -2
  end

  def test_it_sumatory_of_array_5
    sumatoria = Calculadora.sumatory(["1", 2, "4", "-5"])
    assert_equal sumatoria, 2
  end
end
