require 'binomial/integer'
module Binomial
  # Params:
  #   - trials:         Total number of trials conducted
  #   - probability:    The probability of one success
  #   - target:         The desired amount of successes
  class Calculator
    ATTRS = [:trials, :probability, :target]
    ATTRS.each do |attribute|
      self.send(:attr_accessor, attribute)
    end

    def initialize(params = {})
      ATTRS.each do |attribute|
        instance_eval "@#{attribute.to_s} = params[:#{attribute.to_s}]"
      end
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
