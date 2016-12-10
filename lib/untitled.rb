=begin
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
=end




def smallest_multiple(number)
  divisors = (11..20).to_a + [9]
  divisors.each do |divisor|
    return false if number % divisor != 0
  end
  return true
end

def answer
  number = 2520
  until smallest_multiple(number) do
    number += 1
  end
  return number
end

answer
---------

def smallest_multiple(number)
  divisors = [1, 2, 3]
  divisors.each do |divisor|
    return false if number % divisor != 0
  end
  return true
end

def answer
  number = 1
  until smallest_multiple(number) do
    number += 1
  end
  return number
end

answer


--------

def answer
  divisors = [1,2,3]
  primes = [2,3]
  # divisors = (11..20).to_a + [9]
  # primes = [2, 3, 5, 7, 11, 13, 17, 19]
  prime_hash = {}
  primes.each do |p|
    prime_hash[p] = 0
  end
  divisors.each do |d|
    prime_hash.each do |p, freq|
      new_freq = 1
      while d % (p**new_freq) == 0
        new_freq += 1
      end
      puts d, new_freq
      prime_hash[p] = new_freq if new_freq > freq
    end
  end
  puts prime_hash
  prime_hash.map { |k,v| k**v }.inject(:*)
end

answer


1..5
1, 2, 3, 4, 5

2 => 2,
3 => 1,
5 => 1

2^2*3^1*5^1