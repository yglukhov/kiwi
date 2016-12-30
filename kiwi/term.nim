import variable

type Term* = ref object
    variable*: Variable
    coefficient*: float

proc newTerm*(variable: Variable, coefficient: float = 1): Term =
    result.new()
    result.variable = variable
    result.coefficient = coefficient

proc value*(t: Term): float =
    t.coefficient * t.variable.value

proc `$`*(t: Term): string =
    "variable: (" & $t.variable & ") coefficient: " & $t.coefficient
