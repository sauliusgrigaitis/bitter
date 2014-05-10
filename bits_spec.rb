require './bit.rb'

describe "Bit" do
  it "should have text" do
    bit = Bit.new("My very first bit") 
    bit.message.should == "My very first bit"
  end

  it "should be able to have different text" do
    bit = Bit.new("My second bit")
    bit.message.should == "My second bit"
  end
  
  it "should cut longer than 150 characters message" do
     bit = Bit.new('bit' * 51)
     bit.message.length.should == 150
  end

  it "should throw exception if message is blank" do
    lambda {
      bit = Bit.new('')
    }.should raise_error
  end

  it "should allow to edit message" do
    bit = Bit.new("wrong message")
    bit.message = "right message"
    bit.message.should == "right message"
  end

  it "should cut longer than 150 characters after editing message" do
     bit = Bit.new('bit' * 51)
     bit.message = 'bit' * 500
     bit.message.length.should == 150
  end

  it "should not allow to reassign empty message" do
    bit = Bit.new("right message")
    lambda {
      bit.message = ""
    }.should raise_error
  end
end
    
