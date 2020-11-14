defmodule GuessingGame do
  def guess (a,b) when a > b, do: guess(b, a)

  def guess(low, high) do
    answer = IO.gets "Are you thinking of #{mid(low, high)}?\n"
    case String.trim(answer) do
      "higher" ->
        higher(low, high)
      "lower" ->
        lower(low, high)
      "yes" ->
        "Aha! Got it."
      _ ->
        IO.puts ~s(Type "higher", "lower", or "yes")
        guess(low, high)
    end
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def higher(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def lower(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
