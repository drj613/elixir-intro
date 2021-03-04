filename = IO.gets("Which file are we looking at? ") |> String.trim()

words = File.read!(filename)
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)

words |> Enum.count() |> IO.puts()


# Use IO.gets to ask user the name of a file to open
# Use String.trim to get rid of trailing enter they press
# Split the string into words with String.split and a regular expression
# Filter out non words with Enum.filter
# Count the words with Enum.count

# Challenge:
# See if you can extend the script build in this lesson so that the user
# can optionally count the number of lines or characters a file instead of
# the number of words.
