# kiwi [![Build Status](https://github.com/yglukhov/kiwi/workflows/CI/badge.svg?branch=master)](https://github.com/yglukhov/kiwi/actions?query=branch%3Amaster) [![nimble](https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble_js.png)](https://github.com/yglukhov/nimble-tag)

A Nim port of the [kiwi-java](https://github.com/alexbirkett/kiwi-java) implementation of the Cassowary constraint solving algorithm

## Usage
```nim
import kiwi

let s = newSolver()
let x = newVariable()
let y = newVariable()

s.addConstraint(x == 20)
s.addConstraint(x + 2 == y + 10)
s.updateVariables()

assert(x.value == 20)
assert(y.value == 12)
```

# Links
* [overconstrained.io](http://overconstrained.io) - collection of similar projects ([github](https://github.com/Overconstrained/Overconstrained))
