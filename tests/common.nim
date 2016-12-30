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
