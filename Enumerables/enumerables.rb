class Array
    def my_each(&prc)
        length.times do |i|
            prc.call(self[i])
        end

        self
    end

    def my_select(&prc)
        selected = []
        length.times do |i|
            el = self[i]
            if prc.call(el)
                selected << el
            end
        end

        selected
    end

    def my_reject(&prc)
        selected = []
        length.times do |i|
            el = self[i]
            if !prc.call(el)
                selected << el
            end
        end

        selected
    end

    def my_any?(&prc) 
        length.times do |i|
            if (prc.call(self[i])) 
                return true;
            end
        end
        false
    end

    def my_all?(&prc) 
        length.times do |i|
            if (!prc.call(self[i])) 
                return false;
            end
        end
        true
    end

    def my_flatten
        result = []

        length.times do |i|
            if self[i].is_a? Array
                result.concat( self[i].my_flatten )
            else 
                result << self[i]
            end
        end

        result
    end

    def my_zip(*others)
        result = []

        length.times do |i|
            sub_arr = Array.new(others.length + 1)
            sub_arr[0] = self[i]
            (others.length).times do |j|
                sub_arr[j + 1] = others[j][i]
            end
            result << sub_arr
        end

        result
    end

    def my_rotate(rotations = 1)
        rotations = rotations % length
        reversed = self.reverse
        first = reversed[0..length - rotations - 1].reverse
        last = reversed[length - rotations..-1].reverse
        first + last
    end

    def my_join(separator = "")
        result = ""
        length.times do |i|
            result += self[i] 
            result += separator unless i == length - 1
        end
        result
    end

    def my_reverse
        result = []
        length.times do |i|
            result.unshift(self[i])
        end

        result
    end
end
