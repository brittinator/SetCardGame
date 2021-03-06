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
      3.times do
        @deck.shuffle!
      end
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
      if @deck.length == 0
        return
      end

      num_cards = 0
      @deck.each do |card|
        num_cards += 1
      end
      return num_cards
    end

    def draw
      until (@deck.length == 0)
        return (@deck.pop)
      end
    end
  end # deck class

  class Board
    attr_accessor :board_num_of_cards, :score, :sets

    def initialize(deck)
      @board = []
      @myDeck = deck
      @score = 0
      @sets = {}
      STARTINGCARDS.times do
        card = @myDeck.draw
        @board.push(card)
      end
      @board_num_of_cards = @board.length
    end

    def add_card
      @board.push(@myDeck.draw)
      @board_num_of_cards = @board.length
    end

    def remove_cards(largest_index, middle_index, smallest_index)
      capture_set(largest_index, middle_index, smallest_index)
      @board.delete_at(largest_index)
      @board.delete_at(middle_index)
      @board.delete_at(smallest_index)
      @board_num_of_cards = @board.length
    end

    def capture_set(largest_index, middle_index, smallest_index)
      card3 = {
        number: @board[largest_index].number,
        color: @board[largest_index].color,
        shape: @board[largest_index].shape,
        shading: @board[largest_index].shading
      }
      card2 = {
        number: @board[middle_index].number,
        color: @board[middle_index].color,
        shape: @board[middle_index].shape,
        shading: @board[middle_index].shading
      }
      card1 = {
        number: @board[smallest_index].number,
        color: @board[smallest_index].color,
        shape: @board[smallest_index].shape,
        shading: @board[smallest_index].shading
      }
      @sets[@score] = [card1, card2, card3]
    end

    def increment_score
      @score += 1
    end

    def set?(card1, card2, card3)
      if(card1.color == card2.color && card2.color == card3.color)
        puts "found a match by the color #{card1.color}"
        return true
      elsif(card1.number == card2.number && card2.number == card3.number)
        puts "found a match by the number #{card1.number}"
        return true
      elsif(card1.shape == card2.shape && card2.shape == card3.shape)
        puts "found a match by the shape #{card1.shape}"
        return true
      elsif(card1.shading == card2.shading && card2.shading == card3.shading)
        puts "found a match by the shading #{card1.shading}"
        return true
      else
        return false
      end
    end

    def find_set
      start_index = 0
      match_found = false

      # check to see if found match by number
      board_by_num = sort_by_num
      ending_index = board_by_num.length - 3
      ending_index.times do
        # call set? method on these 3 cards
        match_found = set?(board_by_num[start_index], board_by_num[start_index + 1], board_by_num[start_index + 2])
        if match_found
          @board = board_by_num
          remove_cards((start_index + 2), (start_index + 1), (start_index))
          increment_score
          return match_found
        else
          start_index += 1
        end
      end

      start_index = 0
      # check to see if found match by color
      board_by_color = sort_by_color
      ending_index = board_by_color.length - 3
      ending_index.times do
        match_found = set?(board_by_color[start_index], board_by_color[start_index + 1], board_by_color[start_index + 2])
        if match_found
          @board = board_by_color
          remove_cards((start_index + 2), (start_index + 1), (start_index))
          increment_score
          return match_found
        else
          start_index += 1
        end
      end

      start_index = 0
      # check to see if found match by shape
      board_by_shape = sort_by_shape
      ending_index = board_by_shape.length - 3
      ending_index.times do
        match_found = set?(board_by_shape[start_index], board_by_shape[start_index + 1], board_by_shape[start_index + 2])
        if match_found
          @board = board_by_shape
          remove_cards((start_index + 2), (start_index + 1), (start_index))
          increment_score
          return match_found
        else
          start_index += 1
        end
      end

      start_index = 0
      # check to see if found match by shading
      board_by_shade = sort_by_shading
      ending_index = board_by_shade.length - 3
      ending_index.times do
        match_found = set?(board_by_shade[start_index], board_by_shade[start_index + 1], board_by_shade[start_index + 2])
        if match_found
          @board = board_by_shade
          remove_cards((start_index + 2), (start_index + 1), (start_index))
          increment_score
          return match_found
        else
          start_index += 1
        end
      end

      # if reached here there aren't matches
      puts "There were no matches on the board."
      return match_found
    end

    def sort_by_num
      # sort by 1, then 2, and then 3
      board_sorted_by_num = []
      board = @board.dup
      board.each do |card|
        if card.number == 1
          board_sorted_by_num.push(card)
          board.delete(card)
        end
      end

      board.each do |card|
        if card.number == 2
          board_sorted_by_num.push(card)
          board.delete(card)
        end
      end
      board_sorted_by_num = board_sorted_by_num + board

      return board_sorted_by_num
    end

    def sort_by_color
      # sort by red, then green and finally purple
      board_sorted_by_color = []
      board = @board.dup
      board.each do |card|
        if card.color == 'red'
          board_sorted_by_color.push(card)
          board.delete(card)
        end
      end

      board.each do |card|
        if card.color == 'green'
          board_sorted_by_color.push(card)
          board.delete(card)
        end
      end
      board_sorted_by_color = board_sorted_by_color + board

      return board_sorted_by_color
    end

    def sort_by_shape
      # sort by oval, diamond then squiggle
      board_sorted_by_shape = []
      board = @board.dup
      board.each do |card|
        if card.shape == "oval"
          board_sorted_by_shape.push(card)
          board.delete(card)
        end
      end

      board.each do |card|
        if card.shape == "diamond"
          board_sorted_by_shape.push(card)
          board.delete(card)
        end
      end
      board_sorted_by_shape = board_sorted_by_shape + board

      return board_sorted_by_shape
    end

    def sort_by_shading
      # sort by solid, empty, striped
      board_sorted_by_shading = []
      board = @board.dup
      board.each do |card|
        if card.shading == "solid"
          board_sorted_by_shading.push(card)
          board.delete(card)
        end
      end

      board.each do |card|
        if card.shading == "empty"
          board_sorted_by_shading.push(card)
          board.delete(card)
        end
      end
      board_sorted_by_shading = board_sorted_by_shading + board

      return board_sorted_by_shading
    end
  end # board class

  def play_game(deck, board)
    # create and populate board with cards from a newed up deck
    print "Dealing.........."
    playable_deck = deck
    my_board = board
    print "Starting a new game of Set."

    # game is done if deck is empty and no sets to be found
    until playable_deck.count_cards.nil? && my_board.find_set == false
      # see if there are set matches
      if my_board.find_set == true
        # if yes, board removes set and increment @score
      else
        # if no, draw 3 more cards onto the board, then search again
          until playable_deck.count_cards.nil?
            3.times do
              my_board.add_card
            end
          end
      end
    end #until
    print "Game over. "
    print "You were able to find #{my_board.score} sets during this session. "
    puts "The sets were:"
    my_board.sets.each do |set|
      puts set
    end
    print "Jolly good show!"
    return my_board.sets
  end


  # will play a set game automatically when run file
  my_deck = Deck.new
  board = Board.new(my_deck)

  play_game(my_deck, board)
