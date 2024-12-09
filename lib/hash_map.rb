class HashMap 
  PRIME_NUMBER = 31
  DEFAULT_CAPACITY = 16
  DEFAULT_LOAD_FACTOR = 0.75
  
  attr_reader :total_entries

  #TODO: DELETE THIS
  attr_reader :buckets

  class Node
    attr_reader :key, :value
    attr_accessor :next_node

    def initialize (key, value)
      @key = key
      @value = value
      @next_node = nil
    end

    #returns true if the key is new (so the HasMap must increment the total entries by 1)
    def append(new_node)
      if new_node.key == @key
        #replace value
        @value = new_node.value
        false
      elsif @next_node.nil?
        @next_node=new_node
        true
      else
        @next_node.append(new_node)
      end
    end

  end # of class Node

  def initialize (cap = DEFAULT_CAPACITY, lf = DEFAULT_LOAD_FACTOR)
    @capacity = cap
    @load_factor = lf
    @buckets = Array.new(cap, nil)
    @total_entries = 0
  end

  def hash(key)
    hash_code = 0
    key.each_char {|char| hash_code = hash_code * PRIME_NUMBER + char.ord}
    hash_code
  end

  def set(key, value)
    new_node = Node.new(key, value)
    index = hash(key) % @capacity
    if @buckets[index].nil?
      @total_entries += 1
      @buckets[index] = new_node
      change_capacity if time_to_change_capacity?
    else
      #Collision
      if @buckets[index].append(new_node)
        @total_entries += 1
        change_capacity if time_to_change_capacity?
      end
    end
  end

  private

  def time_to_change_capacity?
    #Implement
    return false
  end

  def change_capacity
    # Empty for the moment
  end

end
