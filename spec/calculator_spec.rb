require 'spec_helper'
require 'binomial'

describe "Binomial::Calculator" do
  describe "calculate" do
    it "should validate probability is > 0" do
      expect {
        Binomial::Calculator.new(
          :trials       => 10,
          :probability  => 0,
          :target       => 3
        ).calculate
      }.to raise_error
    end

    it "should validate probability is < 1" do
      expect {
        Binomial::Calculator.new(
          :trials       => 10,
          :probability  => 1.1,
          :target       => 3
        ).calculate
      }.to raise_error
    end

    it "should succeed if probability is >0 and <1" do
      expect {
        Binomial::Calculator.new(
          :trials       => 10,
          :probability  => 0.2,
          :target       => 3
        ).calculate
      }.to_not raise_error
    end

    it "should validate target < trials" do
      expect {
        Binomial::Calculator.new(
          :trials       => 10,
          :probability  => 0.2,
          :target       => 11
        ).calculate
      }.to raise_error
    end

    it "should succeed if target < trials" do
      expect {
        Binomial::Calculator.new(
          :trials       => 10,
          :probability  => 0.2,
          :target       => 3
        ).calculate
      }.to_not raise_error
    end

    it "should validate target > 0" do
      expect {
        Binomial::Calculator.new(
          :trials       => 10,
          :probability  => 0.2,
          :target       => 0
        ).calculate
      }.to raise_error
    end

    it "should succeed if target > 0" do
      expect {
        Binomial::Calculator.new(
          :trials       => 10,
          :probability  => 0.2,
          :target       => 3
        ).calculate
      }.to_not raise_error
    end

    it "should produce the correct results" do
      Binomial::Calculator.new(
        :trials       => 2,
        :probability  => 0.5,
        :target       => 2
      ).calculate.should == 0.25
      
      Binomial::Calculator.new(
        :trials       => 2,
        :probability  => 0.5,
        :target       => 1
      ).calculate.should == 0.5
    end
  end
end
