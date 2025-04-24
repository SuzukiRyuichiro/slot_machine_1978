class SlotMachine
  SYMBOLS = %w[🍒 7️⃣ 🔔 ⭐️ 🤩].freeze

  def initialize(reels) # Reels is an array of emoji's (string[])
    @reels = reels
  end

  def score
    # TODO: implement the scoring logic based on the reels
    # If the reel is three of the same
    # Check if all of the elements are the same
    if three_of_the_same?
      # Score for the three of the same
      # Get the index of the symbol that was three of the same
      index = SYMBOLS.index(@reels[0])
      # Add one to the index
      # Multiply by 10
      (index + 1) * 10
    elsif two_jokers?
      # If the reel is two jokers and something else
      25
    elsif two_of_the_same_and_joker?
      # If the reel is two of the same and a joker
      other_than_joker = @reels.reject { |reel| reel == '🤩' }.first
      (SYMBOLS.index(other_than_joker) + 1) * 5
    else
      # If the reel is none of the above
      0
    end
  end

  def play
    @reels = []
    3.times do
      @reels << SYMBOLS.sample
    end

    @reels
  end

  private

  def three_of_the_same?
    @reels.uniq.length == 1
  end

  def two_jokers?
    @reels.count('🤩') == 2
  end

  def two_of_the_same_and_joker?
    @reels.uniq.length == 2 && @reels.include?('🤩')
  end
end
