#!/usr/bin/env ruby
require 'rubygems'
require 'ffi/aspell'


if ARGV.length < 2
  puts "Usage: guess num abcde..."
  exit
end

speller = FFI::Aspell::Speller.new('en_US')

#letters = %w{ n o d d k j u d d z z l}
#length = 4

args = ARGV.clone
length =  args.shift.to_i
letters = args.shift.split('').to_a

size = letters.length
total = size.downto(size - length + 1).inject(1) { |r,e| r * e }
puts letters.join
puts "size=#{size}"
puts "total = #{total}"
puts "expect time: #{total * 0.007} seconds"
words = []
letters.combination(length).entries.each do |x|
  x.permutation.entries.each do |y|
    word = y.join
    if not words.include?(word) and speller.correct?(word)
      puts word
      words << word 
    end
  end
end

puts "total: #{words.length}/#{total}"
