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

      def my_select
        self.is_a?(Array)
        result = []
        self.size.times{|index| result << self[index] if yield self[index]}
        result
      end

      def my_count value = nil
        count = 0
        self.size.times{|index| count += 1 if value == self[index]}
        self.count
      end

      def my_none value = nil
        none = true
        if  value != nil 
          self.size.times{|index| none = false if value === self[index]}
        elsif block_given?
          self.size.times{|index| none = false if yield self[index]}
        else
          self.size.times{|index| none = false if self[index]}
        end
        none
      end

      def my_any value = nil
        any = false 
        if value != nil
          self.size.times{|index| any = true if value === self[index]}
        elsif block_given?
          self.size.times{|index| any = true if yield self[index]}
        else 
          self.size.times{|index| any = true unless self[index] == false || self[index] == nil}
        end
        any
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
p num.my_all?(String)
p num.my_all?(Numeric)
puts "\n"
puts "my_select"
p num.my_select{|value| value %3 == 0}
puts "\n"
puts "my_count"
p num.my_count
puts "\n"
puts "my_none"
p num.my_none{|value| value %11 == 0}
puts "\n"
puts"my_any"
p num.my_any{|value| value %2 == 0}