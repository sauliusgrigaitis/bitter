require 'spec_helper'

describe Author do
  it "should have name" do
    author = Author.create(name: "Jonas", surname: "Jonaitis")
    author.name.should == "Jonas"
  end

  it "should have surname" do
    author = Author.new(name: "Jonas", surname: "Jonaitis")
    author.surname.should == "Jonaitis"
  end

  it "should not have blank name" do
     author= Author.new(name: '', surname: 'Jonaitis')
     author.valid?.should == false
  end


  it "should not have blank surname" do
      author = Author.new(name: "Jonas", surname: '')
      author.valid?.should == false
  end

  describe "authors bits" do

  before do
    @author = Author.create(name: "Jonas", surname: "Jonaitis")
    @bit = @author.bits.create(message: "Authors very first bit")
  end

  it "should be able to create his bits" do
    @bit.message.should == "Authors very first bit"
  end

  it "should be able to fetch his own bits" do
    @author.bits.should == [@bit]
  end

  it "should be able to remove his bit" do
    bit = @author.bits.create(message: "Authors second bit")
    @author.remove_bit("Authors very first bit")
    @author.reload.bits.should == [bit]
  end

  it "should be able to remove any of his bits" do
    @author.remove_bit("Authors very first bit")
    @author.reload.bits.should == []
  end


  end
end
