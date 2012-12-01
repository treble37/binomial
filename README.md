# Binomial   
Binomial is a ruby gem for quickly calculating probabilities that are modeled by the [Binomial Theorem](http://en.wikipedia.org/wiki/Binomial_theorem).   
The master branch of this repo may be rather buggy at times. For a stable version, use `gem install binomial` or download a tagged version.   
## Usage

```ruby
require 'binomial'

calc = Binomial::Calculator.new trials: 10, probability: 0.2, target: 3

# Returns the probability of 3 successes occuring during 10 trials where the 
# probability of a success is 0.2
calc.calculate 
```

## Todo   
Check the [Issue Tracker](https://github.com/loddy1234/binomial/issues) for an idea of what I think needs doing. 
Feel free to add your own improvements! :smile:   
