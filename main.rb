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
end

num = [1,2,3,4,5,6,7,8,9,10]
puts "my_each\n"
num.my_each {|i| p i}
puts "\n"
puts "my_each_with_index"
num.my_each_with_index {|i,j| p "#{j} : #{i}"}