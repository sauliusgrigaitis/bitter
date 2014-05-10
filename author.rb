class Author
  attr_reader :name, :surname
  attr_reader :bits

  def initialize(params)
    raise if params[:name].empty? || params[:surname].empty?
    @name = params[:name]
    @surname = params[:surname]
    @bits = []
  end

  def create_bit(message)
    @bits << Bit.new(message)
    @bits.last 
  end
 
  def remove_bit(message)
    @bits.delete_if { |b|
      b.message == message
    }
  end
end
