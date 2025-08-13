# kiwi [![CI](https://github.com/yglukhov/kiwi/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/yglukhov/kiwi/actions?query=branch%3Amaster) [![nimble](https://img.shields.io/badge/nimble-black?logo=nim&style=flat&labelColor=171921&color=%23f3d400)](https://nimble.directory/pkg/kiwi)

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
* [overconstrained](https://yglukhov.github.io/Overconstrained) - collection of similar projects ([github](https://github.com/yglukhov/Overconstrained))
