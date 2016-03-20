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
    @my_board.remove_cards(0, 1, 2)
    expect(@my_board.board_num_of_cards).to eq(12-3)
  end

  it "can sort by number" do
    sorted = @my_board.sort_by_num


  end

  context "when no matches on board" do
  end

  let(:card1) {Card.new(1, 'red', 'diamond', 'empty' )}
  let(:card2) {Card.new(1, 'red', 'diamond', 'empty' )}
  let(:card3) {Card.new(1, 'red', 'diamond', 'empty' )}

  it 'can determine if have a set' do
    puts card1.color
    puts @my_board.board_num_of_cards
    expect(set?(card1, card2, card3)).to eq(true)
  end

end
