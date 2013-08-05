class ArStore < ActiveRecord::Base

  def self.read(key)
    get(key).try(:value)
  end

  def self.write(key, value = nil, &blk)
    raise ArgumentError, "Pass value or a block, not both" if value && block_given?

    (value || yield).tap do |val|
      (get(key) || new).tap do |obj|
        obj.key   = key
        obj.value = val
        obj.save!
      end
    end
  end

  def self.fetch(key, value = nil, &blk)
    raise ArgumentError, "Pass value or a block, not both" if value && block_given?
    read(key) || write(key, value, &blk)
  end

  def self.clean
    where(["updated_at < ?", EXPIRATION.ago]).delete_all
  end

private

  def self.get(key)
    where(key: key).first
  end
end

