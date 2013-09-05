class ArStore < ActiveRecord::Base

  def self.expiration=(seconds)
    @expiration ||= sections
  end

  def self.expiration
    @expiration ||= 1.day
  end

  def write!(key, val, expires = false)
    self.key     = key
    self.value   = Marshal.dump(val)
    self.expires = expires
    self.save!
    val
  end

  def self.read(key)
    r = get(key).try(:value)
    r ? Marshal.load(r) : nil
  end

  def self.write(key, value = nil, options = {},  &blk)
    raise ArgumentError, "Pass value or a block, not both" if value && block_given?
    (get(key) || new).write!(key, value, options[:expires] || yield)
  end

  def self.fetch(key, value = nil, options = {}, &blk)
    raise ArgumentError, "Pass value or a block, not both" if value && block_given?
    read(key) || new.write!(key, value, options[:expires] || yield)
  end

  def self.clean
    where(expired_arel).delete_all
  end

  def self.expired_arel
    arel_table[:expires].eq(true).and
    arel_table[:updated_at].lt(expiration.ago)
  end

private

  def self.get(key)
    where(key: key).first
  end
end

