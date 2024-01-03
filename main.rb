module Enumerable
    def my_each
        self.is_a?(Array)
        self.size.times do |item|
            yield self[item]
            self
        end
    end

    def my_each_with_index
        self.is_a?(Array)
        self.size.times {|index| yield self[index],index}
        self
    end

    def my_all? value = nil
        all_result = true
        if value != nil
          self.size.times {|index| all_result = false unless value === self[index]}
        elsif block_given?
          self.size.times {|index| all_result = false unless yield self[index]}
        else
          self.size.times {|index| all_result = false if self[index] == false || self [index] == nil}
        end    
        all_result
      end

end

num = [1,2,3,4,5,6,7,8,9,10]
puts "my_each\n"
num.my_each {|i| p i}
puts "\n"
puts "my_each_with_index"
num.my_each_with_index {|i,j| p "#{j} : #{i}"}
puts "\n"
puts "my_all"
num.my_all?(String)
num.my_all?(Numeric)