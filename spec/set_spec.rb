require 'spec_helper'
require "./lib/set"

describe Card do
    let(:card) {Card.new(1, 'red', 'solid', 'clear' )}
    it 'has a color' do
      expect(card.color).to eq('red')
    end

end #describe Card


describe Deck do

  before(:all) do
    @deck = Deck.new
  end

  it 'can count cards' do
    expect(@deck.count_cards).to eq(81)
  end

  it 'can draw a card and have 1 less card in the deck' do
    @deck.draw
    expect(@deck.count_cards).to eq(80)
  end
end

describe Board do
  before(:each) do
    @demo_deck = Deck.new
    @my_board = Board.new(@demo_deck)
  end


  it 'has 12 cards at the beginning' do
    expect(@my_board.board_num_of_cards).to eq(12)
  end

  it 'can add cards to itself' do
    @my_board.add_card
    expect(@my_board.board_num_of_cards).to eq(13)
    expect(@demo_deck.count_cards).to eq(81-13)
  end

  it 'can remove 3 cards from itself at a time' do
    expect(@my_board.board_num_of_cards).to eq(12)
    @my_board.remove_cards(2, 1, 0)
    expect(@my_board.board_num_of_cards).to eq(12-3)
  end

  it "can store a set of 3 cards" do
    @my_board.capture_set(2,1,0)
    puts @my_board.sets
    expect(@my_board.sets[0].length).to eq(3)
  end

  context "game complete" do
    before(:each) do
      @demo_deck = Deck.new
      @my_board_end = Board.new(@demo_deck)
      play_game(@demo_deck, @my_board_end)
    end
    it 'will have no more cards in deck' do

      expect(@demo_deck.count_cards).to eq(nil)
    end
  end
end
