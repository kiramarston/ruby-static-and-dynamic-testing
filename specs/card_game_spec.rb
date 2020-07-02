require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../card_game.rb')
require_relative('../card.rb')

class CardGameTest < Minitest::Test

  def setup()
    @card1 = Card.new("Hearts", 5)
    @card2 = Card.new("Diamonds", 9)
    @cards = [@card1, @card2]

    @game = CardGame.new()
  end

  def test_card_has_suit()
    assert_equal("Hearts", @card1.suit())
  end

  def test_card_has_value()
    assert_equal(9, @card2.value())
  end

  def test_check_for_ace()
    result = @game.check_for_ace(@card1)
    assert_equal(false, result)
  end

  def test_highest_card()
    result = @game.highest_card(@card1, @card2)
    assert_equal(@card2, result)
  end

  def test_cards_total()
    result = CardGame.cards_total(@cards)
    assert_equal("You have a total of 14", result)
  end

end
