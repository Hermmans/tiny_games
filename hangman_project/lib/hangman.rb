class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word 
    DICTIONARY.sample
  end
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
        @remaining_incorrect_guesses = 5
  end 
  def already_attempted?(chars)
    @attempted_chars.any?{|ele| chars.include?(ele)}
  end
  def get_matching_indices(single_char)
    new_array = []
      @secret_word.each_char.with_index { |ele, index| new_array << index if single_char.include?(ele)}
      new_array
  end
  def fill_indices(char, indices)
    indices.each {|ele| @guess_word[ele] = char}
  end
#part 2 starts here
def try_guess(char)
  if get_matching_indices(char).empty?
    @remaining_incorrect_guesses -= 1
  else 
    fill_indices(char,get_matching_indices(char))
  end
 if  already_attempted?(char)
  puts 'already attempted'
  return false
 else 
  @attempted_chars << char
  return true
 end
end
def ask_user_for_guess
  print "Enter a char:"
  char = gets.chomp
    try_guess(char)
end
def win?
  if @guess_word.join("") == @secret_word
    puts 'WIN'
    return true
  end  
  false
end
def lose?
  if @remaining_incorrect_guesses <= 0 
    puts 'LOSE'
    return true
  end
  false
end
 def game_over?
   if self.win? == true || self.lose? == true
     puts "The word was #{@secret_word}"
      return true
   else   
    return false
   end
 end
end
