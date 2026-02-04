module Enumerable
  # Your code goes here
  def my_select
    return to_enum(:my_select) unless block_given?
    new_arr = []
    self.my_each do |elem|
      new_arr.push elem if yield(elem)  
    end
    new_arr
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    return true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?
    self.my_each do |elem|
      return true if yield elem
    end
    return false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?
    self.my_each do |elem|
      return false if yield elem
    end
    return true
  end

  def my_count
    return self.length unless block_given?
    count=0
    self.my_each do |elem|
      count =  count + 1 if yield elem
    end
    count
  end

  def my_map
    return to_enum(:my_map)  unless block_given?
    new_arr = []
    self.my_each do|elem|
     new_arr.push yield elem
    end
    new_arr
  end

  def my_inject(initial = :not_given)
     new_arr = (initial.eql? :not_given)? self : [initial] + self 
     accumulator = new_arr[0] 
     new_arr[1..].my_each do |elem|
       accumulator =yield accumulator,elem
     end
     accumulator
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    self.each do|elem|
      yield elem
    end
    self
  end
end
