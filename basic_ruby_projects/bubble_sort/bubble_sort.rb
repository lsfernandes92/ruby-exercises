# frozen_string_literal: true

class BubbleSort
  class << self
    def sort(numbers)
      raise 'Please only numbers can be sorted' unless numbers.is_a?(Array)

      unsorted = true

      while unsorted
        unsorted = false
        (0..numbers.size - 1).each do |i|
          next if i == numbers.size - 1

          if numbers[i] > numbers[i.succ]
            numbers[i], numbers[i.succ] = numbers[i.succ], numbers[i]
            unsorted = true
          end
        end
      end

      numbers
    end
  end
end
