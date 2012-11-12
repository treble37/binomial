# Binomial   
Binomial is a ruby gem for quickly calculating probabilities that are modelled by the [Binomial Theorem](http://en.wikipedia.org/wiki/Binomial_theorem).   
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
-   ~~Add support for cumulative binomial probabilities (X > 5, X ≤ 7, etc)~~   
-   Some sort of input validation
-   TESTING!
-   Documentation
