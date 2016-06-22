require "byebug"

class Array

  def my_uniq
    uniques = []
    self.each do |el|
      uniques << el unless uniques.include?(el)
    end
    uniques
  end

  def two_sum
    pairs = []
    self.each_with_index do |el, i|
      self.each_with_index do |el2, j|
        next if i >= j
        pairs << [i, j] if (el + el2) == 0
      end
    end
    pairs
  end

  def my_transpose
    return [] if self.length == 0
    length = self[0].length
    new_matrix = Array.new(length){[]}
    self.each_with_index do |row, i|
      row.each_with_index do |el, j|
        new_matrix[j][i] = el
      end
    end
    new_matrix
  end

end



def stock_picker(prices)
  best = 0
  current = nil
  buy_sell = []
  prices.each_with_index do |buy, i|
    prices.each_with_index do |sell, j|
      next if i >= j
      current = sell - buy
      if current > best
        buy_sell = [i,j]
        best = current
      end
    end
  end
  buy_sell
end
