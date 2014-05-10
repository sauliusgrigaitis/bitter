class Bit
  attr_accessor :message

  def initialize(message)
    self.message = message
  end
  
  def message=(message)
    raise if message.empty?
    @message = message[0,150]
  end
end
