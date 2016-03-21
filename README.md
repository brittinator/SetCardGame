# SetCardGame
March 20 2016
Ruby Implementation of the matching style card game 'Set'
Coding Challenge

* Using Rspec for unit tests. Code coverage calculated: 91.55%

## Classes
* _Card, Deck, Board_

## Card
each card has 1 of each attribute below
* color (r/g/p)
* shape (diamond, squiggle, oval)
* shading (solid, empty, striped)
* number (1,2,3)

## Deck
* total number of cards to initialize: 3^4 = 81
* need to shuffle deck of cards to they come out onto board randomly
* can count cards remaining in deck
* can draw cards from deck into board

## Board
* draws cards
* at beginning draws 12
* from then on draws 3 at a time
* has score attribute
* can add and remove 3 cards at a time
* needs to find sets by each attribute`

## Play Game method
* play a game
  * instantiate deck of cards
  * tells when game is complete
  * returns how many matched sets happened

## Set? method
* input 3 cards
* output T/F if can make a set

## findSet method
* input board of cards
* either
    * find set
    * determine no sets available  
    * My implementation of this was to sort the board by each characteristic, and then walk through the entire board. This is likely not very efficient, as you have to sort and then go through entire board 4 times.
Note: I know recursion is a possibility for traversing the board to get 3 cards at a time, but I'm not comfortable enough with that algorithm at this time.
