  STARTINGCARDS = 12
  DECK = 81

  NUMBER = [1,2,3]
  COLOR = ['red', 'green', 'purple']
  SHAPE = ['diamond', 'squiggle', 'oval']
  SHADING = ['solid', 'empty', 'striped']

  class Card
    attr_reader :number, :color, :shape, :shading

    def initialize(number, color, shape, shading)
      @number = number
      @color = color
      @shape = shape
      @shading = shading
    end
  end # card class

  class Deck
    attr_reader :num_cards

    def initialize
      @deck = []
      @deck = create_deck
      @num_cards = count_cards
      @deck.shuffle!
      @deck.shuffle!
    end

    def create_deck
      NUMBER.each do |n|
        COLOR.each do |c|
          SHAPE.each do |s|
            SHADING.each do |shade|
              card = Card.new(n,c,s,shade)
              @deck.push(card)
            end
          end
        end
      end
      return @deck
    end

    def count_cards
      num_cards = 0
      @deck.each do |card|
        num_cards += 1
      end
      puts "#{num_cards} number of cards left in the deck"
      return num_cards
    end

    def draw
      return (@deck.pop)
    end

  end # deck class

  class Board
    attr_accessor :board_num_of_cards

    def initialize
      @board = []
      populate_board
      @board_num_of_cards = @board.length
    end

    def populate_board
      @myDeck = Deck.new
      STARTINGCARDS.times do
        card = @myDeck.draw
        @board.push(card)
      end
    end



    def set?(card1, card2, card3)
      if(card1.color == card2.color && card2.color == card3.color)
        return true
      elsif(card1.number == card2.number && card2.number == card3.number)
        return true
      elsif(card1.shape == card2.shape && card2.shape == card3.shape)
        return true
      elsif(card1.shading == card2.shading && card2.shading == card3.shading)
      else
        return false
      end
    end

    def find_set()
      # sort on all 4 axis
      # call set? method on these 3 cards
      start_index = 0
      match_found = false
      # 012, 123, 234, 345
      ending_index = @board.length - 3
      ending_index.times do
        match_found = set?(@deck[start_index], @deck[start_index + 1], @deck[start_index + 2])
        start_index += 1
      end

    end

    def sort_by_num
      @deck.each do |card|


      end
    end

    def sort_by_color

    end

    def sort_by_shape

    end

    def sort_by_shading

    end

    def play_game

    end


  end # board class
