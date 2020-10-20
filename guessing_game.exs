defmodule GuessingGame do
  # guess between low and high number -> guess middle number
  # tell user our guess
  # "yes" -> game over
  # "higher" -> higher(low, high)
  # "lower" -> lower(low, high)
  # anything else -> prompt user for valid response

  def mid(low, high) do
    div(low + high, 2)
  end
end
