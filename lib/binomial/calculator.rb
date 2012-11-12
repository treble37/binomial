require 'binomial/integer'
module Binomial
  # Params:
  #   - trials:         Total number of trials conducted
  #   - probability:    The probability of one success
  #   - target:         The desired amount of successes
  class Calculator
    attr_accessor :trials, :probability, :target

    def initialize(params = {})
      @trials = params[:trials]
      @probability = params[:probability]
      @target = params[:target]
    end

    def model
      "X~B(#{@trials}, #{@probability})"
    end

    # A representation of the equation performed
    def equation
      "P(X=#{@target}) = #{@trials}C#{@target} * #{@probability}^#{@target} *"
      + " #{1 - @probability}^#{@trials - @target} = #{calculate().to_s}"
    end

    # Calculates the result
    def calculate
      @trials.choose(@target) *
      (@probability ** @target) *
      ((1 - @probability) ** (@trials - @target))
    end
  end
end
