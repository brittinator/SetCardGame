# SetCardGame
Ruby Implementation of the matching style card game set
Coding Challenge

Models:

## Card
each card has 1 of each attribute below
* color (r/g/p)
* shape (diamond, squiggle, oval)
* shading (solid, empty, striped)
* number (1,2,3)
* total number of cards to initialize: 3^4 = 81

## Board
* draws cards
* at beginning draws 12
* from then on draws 3 at a time

## Game method
* play a game
  * instantiate deck of cards
  * randomizes cards
  * tells when game is complete by using other methods
  * returns how many matched sets happened

## Set? method
* input 3 cards
* output T/F if can make a set

## findSet method
* input board of cards
* either
    * find set
    * determine no sets available
