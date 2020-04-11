import ../kiwi, unittest

template editVariables(s: Solver, body: untyped) =
  block:
    template suggest(v: Variable, value: float) =
      s.addEditVariable(v, STRONG)
      s.suggestValue(v, value)

    body
    s.updateVariables()
    s.removeAllEditVariables()

const EPSILON = 1.0e-8
template `=~`(a, b: float): bool =
  abs(a - b) <= EPSILON

suite "Common":
  test "Smoke":
    let s = newSolver()
    let x = newVariable()
    let y = newVariable()

    s.addConstraint(x == 20)
    s.addConstraint(x + 2 == y + 10)
    s.updateVariables()

    check:
      x.value == 20
      y.value == 12

  test "Edits":
    let s = newSolver()
    let x = newVariable()
    let y = newVariable()

    s.addConstraint(x + 2 == y + 10)

    s.editVariables:
      x.suggest 10

    check:
      x.value == 10
      y.value == 2

  test "Underdefined":
    let
      ale  = newVariable("ale")
      beer = newVariable("beer")
      profit = newVariable("profit")
      corn = newVariable("corn")
      hops = newVariable("hops")
      malt = newVariable("malt")
      solver = newSolver()

      cns = [
        13 * ale + 23 * beer == profit,
        5 * ale + 15 * beer <= corn,
        4 * ale + 4 * beer <= hops,
        35 * ale + 20 * beer <= malt,
        ale >= 0.0,
        beer >= 0.0,
        corn <= 480.0,
        hops <= 160.0,
        malt <= 1190.0,
        malt >= 0.0,
        corn >= 0.0,
        hops >= 0.0,
      ]

    for c in cns:
      solver.addConstraint(c)

    solver.editVariables:
      profit.suggest 1000

    check:
      profit.value =~ 800
      ale.value =~ 12
      beer.value =~ 28
      corn.value =~ 480
      hops.value =~ 160

    # underdefined constraint
    # check(malt.value =~ 980)

  test "More edits":
    let s = newSolver()
    let x = newVariable()
    let y = newVariable()
    let width = newVariable()
    let height = newVariable()
    let xOffset = newVariable()
    
    let superWidth = newVariable()
    let superHeight = newVariable()

    s.addConstraint(x == xOffset)
    s.addConstraint(y == 5)
    s.addConstraint(width == superWidth - 10)
    s.addConstraint(height == superHeight - 10)

    s.addConstraint(width >= 150)
    s.addConstraint(height >= 150)

    s.editVariables:
      xOffset.suggest(5)
      superWidth.suggest(800)
      superHeight.suggest(600)

    check:
      xOffset.value == 5
      x.value == 5
      y.value == 5
      width.value == 790
      height.value == 590
      superWidth.value == 800
      superHeight.value == 600

    s.editVariables:
      width.suggest(500)
      height.suggest(400)

    check:
      xOffset.value == 0
      x.value == 0
      y.value == 5
      width.value == 500
      height.value == 400
      superWidth.value == 510
      superHeight.value == 410
