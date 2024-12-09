class HashMap 
  PRIME_NUMBER = 31
  DEFAULT_CAPACITY = 16
  DEFAULT_LOAD_FACTOR = 0.75

  def initialize (cap = DEFAULT_CAPACITY, lf = DEFAULT_LOAD_FACTOR)
    @capacity = cap
    @load_factor = lf
  end

  def hash(key)
    hash_code = 0
    key.each_char {|char| hash_code = hash_code * PRIME_NUMBER + char.ord}
    hash_code
  end
end
