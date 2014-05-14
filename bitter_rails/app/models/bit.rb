class Bit < ActiveRecord::Base
  validates_length_of :message, maximum: 150
  validates_presence_of :message

end
