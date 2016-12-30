# kiwi [![Build Status](https://travis-ci.org/yglukhov/kiwi.svg?branch=master)](https://travis-ci.org/yglukhov/kiwi) [![nimble](https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble_js.png)](https://github.com/yglukhov/nimble-tag)

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
* [kiwi-java] (https://github.com/alexbirkett/kiwi-java)
* [Kiwi](https://github.com/nucleic/kiwi)
* [Java Cassowary](https://github.com/pybee/cassowary-java)
* [Haxe-Kiwi](https://github.com/Tw1ddle/haxe-kiwi)
