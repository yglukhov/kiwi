type
    SymbolKind* = enum
        EXTERNAL,
        SLACK,
        ERROR,
        DUMMY

    Symbol* = distinct int32

proc newSymbol*(uniqueId: int32, kind: SymbolKind): Symbol {.inline.} =
    Symbol(int32(uniqueId and 0x3fffffff'i32) or (ord(kind).int32 shl 30))

proc `==`*(a, b: Symbol): bool {.borrow.}

template kind*(s: Symbol): SymbolKind = SymbolKind(s.int32 shr 30)
template invalid*(s: Symbol): bool = s.int32 == 0
template valid*(s: Symbol): bool = s.int32 != 0
