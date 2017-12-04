Passphrase = Struct.new(:text) do
  def word_counts
    counts = Hash.new(0)
    text.split(" ").each do |word|
      # For Part 1 solution
      # counts[word] += 1
      counts[order_word(word)] += 1
    end
    counts
  end

  def valid?
    word_counts.values.all? { |count| count == 1 }
  end
  
  def order_word(word)
    word.split("").sort.join("")
  end
end

valid_count = 0

File.open("day_04/input").each_line do |line|
  passphrase = Passphrase.new(line)
  valid_count += 1 if passphrase.valid?
end

puts valid_count