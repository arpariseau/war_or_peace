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

  def test_file_access
    assert_instance_of File, @card_gen.cardfile
  end

  def test_file_reading
    read_cards = @card_gen.read_file
    assert_equal ("2, Heart, 2"), read_cards[0]
    assert_equal ("3, Heart, 3"), read_cards[1]
    assert_equal ("4, Heart, 4"), read_cards[2]
  end

end
