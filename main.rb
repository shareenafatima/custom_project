module Enumerable
    def my_each
        self.is_a?(Array)
        self.size.times do |item|
            yield self[item]
            self
        end
    end
end

num = [1,2,3,4,5,6,7,8,9,10]
num.my_each {|i| p i}