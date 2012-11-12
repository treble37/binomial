require 'binomial/calculator'

module Binomial
  class CumulativeCalculator < Calculator
    attr_accessor :sign

    # sign: P(X {{sign}} {{target}}) 
    #       The probability X is [equal to, less than, greater than, etc] the 
    #       target when X = number of successes
    def initialize(params = {})
      super
      @sign = params[:sign]
    end

    def calculate
      total = 0
      case @sign
      when :equals
        super
      when :less_than
        calc_cumulative @target - 1
      when :less_than_or_equal_to
        calc_cumulative @target
      when :greater_than
        1 - calc_cumulative(@target)
      when :greater_than_or_equal_to
        1 - calc_cumulative(@target - 1)
      else
        p "Case not handled?!"
      end
    end

    def calc_cumulative(up_to)
      total = 0.0
      while up_to >= 0 do
        calc = Calculator.new trials: @trials, probability: @probability, target: up_to
        total += calc.calculate
        up_to -= 1
      end
      total
    end
  end
end
