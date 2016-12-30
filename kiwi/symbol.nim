type
    SymbolKind* = enum
        INVALID,
        EXTERNAL,
        SLACK,
        ERROR,
        DUMMY

    Symbol* = ref object
        mKind: SymbolKind

proc newSymbol*(kind: SymbolKind = INVALID): Symbol =
    result.new()
    result.mKind = kind

proc kind*(s: Symbol): SymbolKind = s.mKind
