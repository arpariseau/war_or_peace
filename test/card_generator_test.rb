require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def setup
    @filename = "cards.txt"
    @card_gen = CardGenerator.new(@filename)
  end

  def test_existence
    assert_instance_of CardGenerator, @card_gen
  end

  def test_filename_access
    assert_equal @filename, @card_gen.filename
  end

  def test_cards_access
    assert_equal [], @card_gen.cards
  end

  def test_file_reading
    read_cards = @card_gen.read_file
    assert_equal ("2, Heart, 2"), read_cards[0]
    assert_equal ("3, Heart, 3"), read_cards[1]
    assert_equal ("4, Heart, 4"), read_cards[2]
  end

  def test_card_conversion
    @card_gen.card_convert
    card1 = Card.new("Heart", "2", 2)
    card2 = Card.new("Spade", "Queen", 12)
    card3 = Card.new("Club", "Ace", 14)
    card4 = Card.new("Diamond", "7", 7)
    assert_equal card1.suit, @card_gen.cards[0].suit
    assert_equal card1.value, @card_gen.cards[0].value
    assert_equal card1.rank, @card_gen.cards[0].rank
    assert_equal card2.suit, @card_gen.cards[23].suit
    assert_equal card2.value, @card_gen.cards[23].value
    assert_equal card3.suit, @card_gen.cards[38].suit
    assert_equal card3.rank, @card_gen.cards[38].rank
    assert_equal card4.suit, @card_gen.cards[44].suit
  end

end
