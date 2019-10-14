class Diamond
  def build(letter)
    raise 'Invalid letter' unless letter.is_a?(String) && ('A'..'Z').include?(letter)

    @letter = letter
    @previous = (letter.ord - 1).chr
    @line_size = 2 * (letter.ord - 65) + 1

    diamond + "\n"
  end

  private

  def diamond
    return 'A' if @letter == 'A'

    letters = ('A'..@previous).to_a
    letters += [@letter] + letters.reverse

    letters.map { |letter| diamond_line(letter) }.join("\n")
  end

  def diamond_line(letter)
    return ('_' * (@line_size / 2) + 'A' + '_' * (@line_size / 2)) if letter == 'A'

    spaces_beyond(letter) + letter + spaces_between(letter) + letter + spaces_beyond(letter)
  end

  def spaces_beyond(letter)
    '_' * ((@line_size - spaces_between(letter).length - 2) / 2)
  end

  def spaces_between(letter)
    '_' * ((2 * letter_position(letter)) - 1)
  end

  def letter_position(letter)
    letter.ord - 65
  end
end
