class Diamond
  def build(letter)
    raise 'Invalid letter' unless letter.is_a?(String) && ('A'..'Z').include?(letter)

    @letter = letter
    @previous_letter = letter.ord.pred.chr
    @letter_position = letter_position(letter)

    diamond + "\n"
  end

  private

  def diamond
    return 'A' if @letter == 'A'

    lines = ('A'..@previous_letter).map { |letter| diamond_line(letter) }
    (lines + [diamond_line(@letter)] + lines.reverse).join("\n")
  end

  def diamond_line(letter)
    return "#{'_' * @letter_position}A#{'_' * @letter_position}" if letter == 'A'

    spaces_beyond(letter) + letter + spaces_between(letter) + letter + spaces_beyond(letter)
  end

  def spaces_beyond(letter)
    '_' * (@letter_position - letter_position(letter))
  end

  def spaces_between(letter)
    '_' * ((2 * letter_position(letter)) - 1)
  end

  def letter_position(letter)
    letter.ord - 65
  end
end
