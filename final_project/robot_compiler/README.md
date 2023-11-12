# ITESM Robot Language Compiler

### Link to the Github project

https://github.com/LaloVene/compilers-lecture/tree/final-project/final_project/robot_compiler

### Description of the problem

Industry 4.0 encompasses intelligent manufacturing and the emergence of smart factories, which have recently extended their influence to the mechanical industry. This expansion is driven by the rapid advancement of technology and the growing demand for high-quality products with increased efficiency. Consequently, the role of robots has become crucial, highlighting the significance of robot programming languages. To address this challenge, the development and implementation of a robust robot language compiler are necessary.

This project tries to encourage the students to simulate the CPU of a car robot, create the programing language and its compiler

The Robot has the next constraints

- Only 2 supported instructions:

  - MOV <num of blocks to move>
  - TURN <either: {90,180,270,360}>

- The field where the robot will move is a 2-D square matrix of 10 blocks

- If the instruction leads the robot out of the boundaries of the matrix, the CPU should return an illegal instruction error.

- The programing language must be polite.

### List of sample inputs to be detected or rejected

- Examples of valid sentences:
  - Robot please move 2 blocks ahead
  - Robot please move 3 blocks ahead and then turn 90 degrees, then move 2 blocks
- Examples of invalid sentences:
  - Robot moves 2 blocks
  - Robot moves 2 blocks quickly
  - Move 2 blocks right now
  - Robot 2 blocks moves
  - Moves Robot 2 blocks and turn 89 degrees

### Definition of automata that specifies the logic of CPU

The Robot CPU Automaton has the following components:

- Alphabet:

  - START
  - MOVE
  - TURN
  - BLOCKS
  - DEGREES
  - NEWLINE
  - AND
  - THEN
  - COMMA
  - INTEGER

- States:

  - Initial State.
  - Action.
  - Link.
  - End State.

- Transition from Initial to Recognizing Instruction:
  On encountering START, transition to recognizing an instruction.

- Recognizing Instruction:
  Various components (action, link, order) based on the presence of specific terminals.

- Recognizing Action:
  Specific actions (MOVE and TURN) based on the presence of corresponding terminals and literals (INTEGER).

- Handling Links:
  Different orders based on the precense of linking elements (COMMA, AND, THEN).

- Handling Errors:
  On encountering an invalid instruction.

- Accepting State:
  When a valid sequence of terminals and literals is processed, the automaton reaches the end state, which is also the accepting state.

### Definition of CFG and Lexemas

A CFG defines the valid structure of instructions, including statements, movements, and turns.

- Terminals:

  - START
  - MOVE
  - TURN
  - BLOCK
  - DEGREES
  - NEWLINE
  - AND
  - THEN
  - COMMA
  - INTEGER

- Non-terminals:

  - instructions
  - instruction
  - order
  - action
  - link

- Production Rules:
  - Instructions:
    - instructions → instructions instruction
    - instructions → ε (empty)
  - Instruction
    - instruction → NEWLINE
    - instruction → START order NEWLINE
    - instruction → error NEWLINE
  - Order:
    - order → action link action link action
    - order → action link action
    - order → action
  - Action:
    - action → MOVE INTEGER BLOCKS
    - action → TURN INTEGER DEGREES
  - Link:
    - link → COMMA AND THEN
    - link → AND THEN
    - link → COMMA THEN
    - link → COMMA AND
    - link → COMMA
    - link → AND

Lexemes:

- Lexemes are the smallest units of meaning in a programming a language and are used by the lexer to recognize tokens.
- Tokens:
  - START: Start of an instruction.
  - MOVE: Movement action.
  - TURN: Turn action.
  - BLOCKS: Unit of movement.
  - DEGREES: Unit of turn.
  - NEWLINE: End of an instruction.
  - AND: Conjunction of a sentence.
  - THEN: Conjunction of a sentence.
  - COMMA: Conjunction of a sentence.
  - INTEGER: Numeric value.

### Link to video recording that shows the execution and testing

https://youtu.be/w6mydobnVYY
