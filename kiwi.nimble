# Package

version       = "0.1.0"
author        = "Yuriy Glukhov"
description   = "Cassowary constraint solving"
license       = "MIT"

# Dependencies

requires "nim >= 0.15.3"

task test, "Run tests":
    exec "nim c -r tests/common.nim"
    exec "nim js -r tests/common.nim"
