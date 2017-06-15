import ../kiwi

template editVariables(s: Solver, body: untyped) =
    block:
        template suggest(v: Variable, value: float) =
            s.addEditVariable(v, STRONG)
            s.suggestValue(v, value)

        body
        s.updateVariables()
        s.removeAllEditVariables()

block:
    let s = newSolver()
    let x = newVariable()
    let y = newVariable()

    s.addConstraint(x == 20)
    s.addConstraint(x + 2 == y + 10)
    s.updateVariables()

    assert(x.value == 20)
    assert(y.value == 12)

block:
    let s = newSolver()
    let x = newVariable()
    let y = newVariable()

    s.addConstraint(x + 2 == y + 10)

    s.editVariables:
        x.suggest 10

    assert(x.value == 10)
    assert(y.value == 2)

block:
    const EPSILON = 1.0e-8

    proc assertEquals(a, b, c: float64) =
        assert(abs(a - b) <= c)

    var
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

    assertEquals(profit.value, 800, EPSILON)
    assertEquals(ale.value, 12, EPSILON)
    assertEquals(beer.value, 28, EPSILON)
    assertEquals(corn.value, 480, EPSILON)
    assertEquals(hops.value, 160, EPSILON)
    # underdefined constraint
    #assertEquals(malt.value, 980, EPSILON)
