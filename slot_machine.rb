class SlotMachine
  SYMBOLS = %w[🍒 7️⃣ 🔔 ⭐️ 🤩].freeze

  def initialize(reels) # Reels is an array of emoji's (string[])
    @reels = reels
    # ['⭐️', '⭐️', '⭐️']
    # ['⭐️', '⭐️', '🛎']


    # ['🤩', '🤩', '🛎']
    # ['🤩', '🤩', '⭐️']
    # ['🤩', '⭐️', '🤩']

    # ['🤩', '⭐️', '⭐️']
    # ['🤩', '🍒', '🍒']
    # ['🍒', '🤩', '🍒']

    # ['🍒', '⭐️', '🍒']
    # ['🍒', '⭐️', '🍒']
  end

  def score
    # TODO: implement the scoring logic based on the reels
    # If the reel is three of the same
    # Check if all of the elements are the same
    if @reels.uniq.length == 1
      # Score for the three of the same
      # Get the index of the symbol that was three of the same
      index = SYMBOLS.index(@reels[0])
      # Add one to the index
      # Multiply by 10
      (index + 1) * 10
    elsif @reels.count('🤩') == 2
      # If the reel is two jokers and something else
      25
    elsif @reels.uniq.length == 2 && @reels.include?('🤩')
      # If the reel is two of the same and a joker
      other_than_joker = @reels.reject { |reel| reel == '🤩' }.first
      (SYMBOLS.index(other_than_joker) + 1) * 5
    else
      # If the reel is none of the above
      0
    end
  end
end
