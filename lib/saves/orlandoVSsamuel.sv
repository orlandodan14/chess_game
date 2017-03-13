--- !ruby/object:Game
player1: &33 !ruby/object:Player
  name: ORLANDO
  king: &9 !ruby/object:King
    position:
    - 8
    - 5
    piece: "♔"
  queen: &10 !ruby/object:Queen
    position:
    - 8
    - 4
    piece: "♕"
  bishop1: &11 !ruby/object:Bishop
    position:
    - 8
    - 3
    piece: "♗"
  bishop2: &12 !ruby/object:Bishop
    position:
    - 8
    - 6
    piece: "♗"
  knight1: &13 !ruby/object:Knight
    position:
    - 8
    - 2
    piece: "♘"
  knight2: &14 !ruby/object:Knight
    position:
    - 8
    - 7
    piece: "♘"
  rook1: &15 !ruby/object:Rook
    position:
    - 8
    - 1
    piece: "♖"
  rook2: &16 !ruby/object:Rook
    position:
    - 8
    - 8
    piece: "♖"
  pawn1: &1 !ruby/object:Pawn
    position:
    - 7
    - 1
    piece: "♙"
    path: 0
  pawn2: &2 !ruby/object:Pawn
    position:
    - 7
    - 2
    piece: "♙"
    path: 0
  pawn3: &3 !ruby/object:Pawn
    position:
    - 7
    - 3
    piece: "♙"
    path: 0
  pawn4: &4 !ruby/object:Pawn
    position:
    - 6
    - 4
    piece: "♙"
    path: 1
  pawn5: &5 !ruby/object:Pawn
    position:
    - 7
    - 5
    piece: "♙"
    path: 0
  pawn6: &6 !ruby/object:Pawn
    position:
    - 7
    - 6
    piece: "♙"
    path: 0
  pawn7: &7 !ruby/object:Pawn
    position:
    - 7
    - 7
    piece: "♙"
    path: 0
  pawn8: &8 !ruby/object:Pawn
    position:
    - 7
    - 8
    piece: "♙"
    path: 0
  pawns:
  - *1
  - *2
  - *3
  - *4
  - *5
  - *6
  - *7
  - *8
  pieces:
  - *9
  - *10
  - *11
  - *12
  - *13
  - *14
  - *15
  - *16
  - *1
  - *2
  - *3
  - *4
  - *5
  - *6
  - *7
  - *8
player2: &34 !ruby/object:Player
  name: SAMUEL
  king: &25 !ruby/object:King
    position:
    - 1
    - 5
    piece: "♚"
  queen: &26 !ruby/object:Queen
    position:
    - 1
    - 4
    piece: "♛"
  bishop1: &27 !ruby/object:Bishop
    position:
    - 1
    - 3
    piece: "♝"
  bishop2: &28 !ruby/object:Bishop
    position:
    - 1
    - 6
    piece: "♝"
  knight1: &29 !ruby/object:Knight
    position:
    - 1
    - 2
    piece: "♞"
  knight2: &30 !ruby/object:Knight
    position:
    - 1
    - 7
    piece: "♞"
  rook1: &31 !ruby/object:Rook
    position:
    - 1
    - 1
    piece: "♜"
  rook2: &32 !ruby/object:Rook
    position:
    - 1
    - 8
    piece: "♜"
  pawn1: &17 !ruby/object:Pawn
    position:
    - 2
    - 1
    piece: "♟"
    path: 0
  pawn2: &18 !ruby/object:Pawn
    position:
    - 4
    - 2
    piece: "♟"
    path: 1
  pawn3: &19 !ruby/object:Pawn
    position:
    - 2
    - 3
    piece: "♟"
    path: 0
  pawn4: &20 !ruby/object:Pawn
    position:
    - 2
    - 4
    piece: "♟"
    path: 0
  pawn5: &21 !ruby/object:Pawn
    position:
    - 2
    - 5
    piece: "♟"
    path: 0
  pawn6: &22 !ruby/object:Pawn
    position:
    - 2
    - 6
    piece: "♟"
    path: 0
  pawn7: &23 !ruby/object:Pawn
    position:
    - 2
    - 7
    piece: "♟"
    path: 0
  pawn8: &24 !ruby/object:Pawn
    position:
    - 2
    - 8
    piece: "♟"
    path: 0
  pawns:
  - *17
  - *18
  - *19
  - *20
  - *21
  - *22
  - *23
  - *24
  pieces:
  - *25
  - *26
  - *27
  - *28
  - *29
  - *30
  - *31
  - *32
  - *17
  - *18
  - *19
  - *20
  - *21
  - *22
  - *23
  - *24
board: !ruby/object:Board
  player1: *33
  player2: *34
  cells:
  - "♜"
  - "♞"
  - "♝"
  - "♛"
  - "♚"
  - "♝"
  - "♞"
  - "♜"
  - "♟"
  - " "
  - "♟"
  - "♟"
  - "♟"
  - "♟"
  - "♟"
  - "♟"
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - "♟"
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - " "
  - "♙"
  - " "
  - " "
  - " "
  - " "
  - "♙"
  - "♙"
  - "♙"
  - " "
  - "♙"
  - "♙"
  - "♙"
  - "♙"
  - "♖"
  - "♘"
  - "♗"
  - "♕"
  - "♔"
  - "♗"
  - "♘"
  - "♖"
  positions:
  - - 1
    - 1
  - - 1
    - 2
  - - 1
    - 3
  - - 1
    - 4
  - - 1
    - 5
  - - 1
    - 6
  - - 1
    - 7
  - - 1
    - 8
  - - 2
    - 1
  - - 2
    - 2
  - - 2
    - 3
  - - 2
    - 4
  - - 2
    - 5
  - - 2
    - 6
  - - 2
    - 7
  - - 2
    - 8
  - - 3
    - 1
  - - 3
    - 2
  - - 3
    - 3
  - - 3
    - 4
  - - 3
    - 5
  - - 3
    - 6
  - - 3
    - 7
  - - 3
    - 8
  - - 4
    - 1
  - - 4
    - 2
  - - 4
    - 3
  - - 4
    - 4
  - - 4
    - 5
  - - 4
    - 6
  - - 4
    - 7
  - - 4
    - 8
  - - 5
    - 1
  - - 5
    - 2
  - - 5
    - 3
  - - 5
    - 4
  - - 5
    - 5
  - - 5
    - 6
  - - 5
    - 7
  - - 5
    - 8
  - - 6
    - 1
  - - 6
    - 2
  - - 6
    - 3
  - - 6
    - 4
  - - 6
    - 5
  - - 6
    - 6
  - - 6
    - 7
  - - 6
    - 8
  - - 7
    - 1
  - - 7
    - 2
  - - 7
    - 3
  - - 7
    - 4
  - - 7
    - 5
  - - 7
    - 6
  - - 7
    - 7
  - - 7
    - 8
  - - 8
    - 1
  - - 8
    - 2
  - - 8
    - 3
  - - 8
    - 4
  - - 8
    - 5
  - - 8
    - 6
  - - 8
    - 7
  - - 8
    - 8
curr_player: *33
other_player: *34
