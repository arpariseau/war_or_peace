require './lib/card'

class CardGenerator
  attr_reader :filename, :cards

  def initialize(filename)
    @filename = filename
    @cards = []
  end

  def read_file
    cardfile = File.open(@filename)
    cardfile.readlines.map do |line| line.chomp end
  end

  def card_convert
    converting_cards = read_file()
    converting_cards.each do |card|
      card_pieces = card.split (", ")
      converted_card = Card.new(card_pieces[1], card_pieces[0], card_pieces[2].to_i)
      @cards << converted_card
    end
  end

end
