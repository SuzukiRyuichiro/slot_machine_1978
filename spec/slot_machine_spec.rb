# spec/slot_machine_spec.rb
require_relative '../slot_machine'

def test_scenario(reels, expected_score)
  it "returns #{expected_score} for #{reels[0]}/#{reels[1]}/#{reels[2]}" do
    slot_machine = SlotMachine.new(reels)
    score = slot_machine.score
    expect(score).to eq(expected_score)
  end
end

describe SlotMachine do
  describe "#score" do
    # Three of the same
    test_scenario(%w[🤩 🤩 🤩], 50)
    test_scenario(%w[⭐️ ⭐️ ⭐️], 40)
    test_scenario(%w[🛎 🛎 🛎], 30)
    test_scenario(%w[7️⃣ 7️⃣ 7️⃣], 20)
    test_scenario(%w[🍒 🍒 🍒], 10)

    # Two jokers + something else
    test_scenario(%w[🤩 🤩 ⭐️], 25)
    test_scenario(%w[🤩 🤩 7️⃣], 25)
    test_scenario(%w[🤩 🤩 🍒], 25)

    # Two of the same + joker
    test_scenario(%w[⭐️ ⭐️ 🤩], 20)
    test_scenario(%w[🔔 🔔 🤩], 15)
    test_scenario(%w[7️⃣ 7️⃣ 🤩], 10)
    test_scenario(%w[🍒 🍒 🤩], 5)

    # fails
    test_scenario(%w[7️⃣ 🍒 🤩], 0)
    test_scenario(%w[🍒 🔔 ⭐️], 0)
  end
end
