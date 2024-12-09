class HashMap 
  PRIME_NUMBER = 31
  INITIAL_CAPACITY = 16
  DEFAULT_LOAD_FACTOR = 0.75

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

    def find(key)
      if @key == key
        @value
      elsif @next_node.nil?
        nil
      else
        @next_node.find(key)
      end
    end

    def collect_keys(response)
      response << @key
      @next_node.collect_keys(response) if !@next_node.nil?
      response
    end

    def collect_values(response)
      response << @value
      @next_node.collect_values(response) if !@next_node.nil?
      response
    end

    def collect_entries(response)
      response << [@key,@value]
      @next_node.collect_entries(response) if !@next_node.nil?
      response
    end

  end # of class Node

  def initialize (cap = INITIAL_CAPACITY, lf = DEFAULT_LOAD_FACTOR)
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

  def get(key)
    index = hash(key) % @capacity
    if @buckets[index].nil?
      nil
    else
      @buckets[index].find(key)
    end
  end

  def has?(key)
    return !get(key).nil?
  end

  def length
    @total_entries
  end

  def clear
    @total_entries = 0
    @buckets.each_with_index {|x,i| @buckets[i]=nil}
    change_capacity if time_to_change_capacity?
    #And call to the garbage collector, please!
  end

  def keys
    response=[]
    @buckets.each do |bucket| 
      if !bucket.nil?
        bucket.collect_keys(response)
      end
    end
    response
  end

  def values
    response=[]
    @buckets.each do |bucket| 
      if !bucket.nil?
        bucket.collect_values(response)
      end
    end
    response
  end

  def entries
    response=[]
    @buckets.each do |bucket| 
      if !bucket.nil?
        bucket.collect_entries(response)
      end
    end
    response
  end

  private

  def time_to_change_capacity?
    @total_entries > @load_factor * @capacity
  end

  def change_capacity
    puts "Hora de crecer"
  end

end
