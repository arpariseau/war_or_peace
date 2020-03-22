require './lib/card'

class CardGenerator
  attr_reader :filename, :cards, :cardfile

  def initialize(filename)
    @filename = filename
    @cards = []
    @cardfile = File.open(filename)
  end

  def read_file
    @cardfile.readlines.map do |line| line.chomp end
  end

end
