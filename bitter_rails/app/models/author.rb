class Author < ActiveRecord::Base
  validates_presence_of :name, :surname
  has_many :bits

  def remove_bit(message)
    bits.each do |bit|
      bit.destroy if bit.message == message
    end
  end
end
