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
  before(:all) do
    @my_board = Board.new
  end


  it 'has 12 cards at the beginning' do
    expect(@my_board.board_num_of_cards).to eq(12)

  end

  let(:card1) {Card.new(1, 'red', 'diamond', 'empty' )}
  let(:card2) {Card.new(1, 'red', 'diamond', 'empty' )}
  let(:card3) {Card.new(1, 'red', 'diamond', 'empty' )}

  # it 'can determine if have a set' do
  #   puts card1.color
  #   expect(set?(card1, card2, card3)).to eq(true)
  # end

end
