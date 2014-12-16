def is_prime?(num)

end

def primes(count)

end

def factorials_rec(count)

end

def factorials_iter(count)

end


def fibonacci_rec(count)

end

def fibonacci_iter(count)

end

def factors(num)

end

def my_transpose(array)
  #matrix columns to rows, vice versa
end

class String
  def symmetric_substrings

  end
end

def subsets(array)
  #recursion
end

def sum_recur(array)

end

def includes?(array, target)
end

def num_occur(array, target)

end

def add_to_twelve(array)

end


class Array
  def my_uniq
    
  end

  def two_sum(sum = 0)
    #return the position in an array when they are equal to 0
  end

  def dups

  end

  def merge_sort(&prc)

  end

  def self.merge(left, right, &prc)

    end

    merged_array + left + right
  end

  def quick_sort(&prc)
    # prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    #
    # return self if self.length < 2
    # left, right = [], []
    # pivot = self.pop
    #
    #
    # self.each do |i|
    #   case prc.call(i, pivot)
    #   when 1
    #     left << i if i < pivot
    #     right << i if i > pivot
    #   else
    #     left << i if i > pivot
    #     right << i if i < pivot
    #   end
    # end
    #
    # left.quick_sort(&prc) + [pivot] + right.quick_sort(&prc)
  end

  def bubble_sort(&prc)

  end

  def bsearch(target)

  end

  def subsets
    return [self] if empty?
    subs = take(count - 1).subsets
    subs + subs.map { |sub| sub + [last] }
  end
end

def sorted?(array)

end

def sorted_proc?(array, &prc)

end

def reverse(number)

end
