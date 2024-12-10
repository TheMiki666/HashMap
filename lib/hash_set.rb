class HashSet
  PRIME_NUMBER = 31
  INITIAL_CAPACITY = 4
  DEFAULT_LOAD_FACTOR = 0.75 #Change between 0.75 - 1.0

  attr_reader :capacity

  class Node
    attr_reader :key
    attr_accessor :next_node

    def initialize (key)
      @key = key
      @next_node = nil
    end

    #returns true if the key is new (so the HasMap must increment the total entries by 1)
    def append(new_node)
      if new_node.key == @key
        #The key exits already: do nothing and return false
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
        @key
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

    # collect_values method deleted

    # collect_entries method deleted

    # If you get in this method, the node must have a children (@next_node)
    # Returns true if the children is deleted
    def try_to_erase_children(key)
      if @next_node.key == key
        @next_node=@next_node.next_node
        true
      else
        if @next_node.next_node.nil?
          # End of searching
          false
        else
          @next_node.try_to_erase_children(key)
        end
      end 
    end

  end # of class Node

  def initialize (cap = INITIAL_CAPACITY, lf = DEFAULT_LOAD_FACTOR)
    @capacity = cap
    @load_factor = lf
    clear_buckets
  end

  def hash(key)
    hash_code = 0
    key.each_char {|char| hash_code = hash_code * PRIME_NUMBER + char.ord}
    hash_code
  end

  # set method is really a wrap of add; is the add method, but when called by user
  def set(key)
    add(key)
  end

  # get method now has no sense; it becomes private, because is used by has? method

  def has?(key)
    return !get(key).nil?
  end

  def length
    @total_entries
  end

  def clear
    @capacity = INITIAL_CAPACITY
    clear_buckets
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

  # values method now is deleted

  # entries method now is deleted

  # Returns true if the node exists and it's removed
  def remove(key)
    deleted = false
    index = hash(key) % @capacity
    if !@buckets[index].nil?
      if @buckets[index].key == key
        #Found
        deleted = true
        @buckets[index] = @buckets[index].next_node
      else
        #Not found
        if !@buckets[index].next_node.nil?
          deleted = @buckets[index].try_to_erase_children(key)
        end #else do nothing (end of searching)
      end
    end
    if deleted
      @total_entries -= 1
      change_capacity if time_to_change_capacity?
    end
    deleted
  end

  private

  def clear_buckets
    @buckets = Array.new(@capacity, nil)
    @total_entries = 0
  end

  def time_to_change_capacity?
    (@total_entries > @load_factor * @capacity || @total_entries < @load_factor * @capacity/2)  
  end

  def change_capacity
    @capacity = 2 ** (Math.log2(@total_entries/@load_factor).floor + 1) if @total_entries > 0
    @capacity = INITIAL_CAPACITY if @capacity < INITIAL_CAPACITY || @total_entries <= @load_factor * INITIAL_CAPACITY 

    # Uncomment the next line to test de growing and shrinking capacity
    #p "New capacity: #{@capacity}"
    
    # Replacing the nodes
    temporal_array = keys
    clear_buckets
    temporal_array.each {|node| add(node, true)}

    # Uncomment the next line to test how the nodes relocate in the map
    #p @buckets
  end

  #This is the true method set
  #I'ts private to avoid an infinite recursive loop when dumping
  def add(key, dumping=false)
    new_node = Node.new(key)
    index = hash(key) % @capacity
    if @buckets[index].nil?
      @total_entries += 1
      @buckets[index] = new_node
      change_capacity if !dumping && time_to_change_capacity?
    else
      #Collision
      if @buckets[index].append(new_node)
        @total_entries += 1
        change_capacity if !dumping && time_to_change_capacity?
      end
    end
  end

  # Get is now a private method
  def get(key)
    index = hash(key) % @capacity
    if @buckets[index].nil?
      nil
    else
      @buckets[index].find(key)
    end
  end

end
