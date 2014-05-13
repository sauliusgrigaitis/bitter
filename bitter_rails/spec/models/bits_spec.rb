require 'spec_helper'

describe "Bit" do
  it "should have text" do
    bit = Bit.new(message: "My very first bit")
    bit.message.should == "My very first bit"
  end

  it "should be able to have different text" do
    bit = Bit.new(message: "My second bit")
    bit.message.should == "My second bit"
  end

  it "should be invalid when longer than 150 symbols" do
     bit = Bit.new(message: 'bit' * 51)
     bit.valid?.should == false
  end

  it "should be invalid when message is blank" do
    bit = Bit.new(message: '')
    bit.valid?.should == false
  end

  it "should allow to edit message" do
    bit = Bit.new(message: "wrong message")
    bit.message = "right message"
    bit.message.should == "right message"
  end

  it "should invalid when setting more than 150 characters after editing message" do
     bit = Bit.new(message: 'bit' * 51)
     bit.message = 'bit' * 500
     bit.valid?.should == false
  end

  it "should not allow to reassign empty message" do
    bit = Bit.new(message: "right message")
    bit.message = ""
    bit.valid?.should == false
  end
end

