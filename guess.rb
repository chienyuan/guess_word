#!/usr/bin/env ruby
require 'rubygems'
require 'ffi/aspell'


if ARGV.length < 2
  puts "Usage: guess.rb pattern ABCDE... (ex. guess.rb ****Y GERMARY) "
  exit
end

speller = FFI::Aspell::Speller.new('en_US')

#letters = %w{ n o d d k j u d d z z l}
#length = 4

args = ARGV.clone
pattern  =  args.shift.upcase.split('').to_a
length = 0
pattern_flag = false
pattern.each do |x|
  if x == '.'
    length = length + 1
  else
    pattern_flag = true
  end
end
letters = args.shift.upcase.split('').to_a
size = letters.length
total = size.downto(size - length + 1).inject(1) { |r,e| r * e }

puts "Input:"
puts "Pattern = #{pattern}"
puts "Length  = #{length}"
puts "Letters = #{letters.join}"
puts "Size    = #{size}"
puts "Total   = #{total}"
puts "Expect time: #{total * 0.007} seconds"

puts
puts "Output:"
words = []
letters.permutation(length).entries.each do |y|
    if pattern_flag
      aword = []
      pattern.each do |x|
        if x == '.'
          aword.push y.shift
        else
          aword.push x
        end
      end
      word = aword.join
    else
      word = y.join
    end
    if not words.include?(word) and speller.correct?(word)
      puts word
      words << word 
    end
end

puts "Total: #{words.length}/#{total}"
