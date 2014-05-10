require './author.rb'

describe Author do
  it "should have name" do
    author = Author.new(name: "Jonas", surname: "Jonaitis")
    author.name.should == "Jonas"
  end

  it "should have surname" do
    author = Author.new(name: "Jonas", surname: "Jonaitis")
    author.surname.should == "Jonaitis"
  end

  it "should not have blank name" do
    lambda {
      Author.new(name: '', surname: 'Jonaitis')
    }.should raise_error
  end

  it "should not have blank surname" do
    lambda {
      Author.new(name: "Jonas", surname: '')
    }.should raise_error
  end
 
  describe "authors bits" do 
  
  before do
    @author = Author.new(name: "Jonas", surname: "Jonaitis")
    @bit = @author.create_bit("Authors very first bit")
  end
  
  it "should be able to create his bits" do
    @bit.message.should == "Authors very first bit"
  end

  it "should be able to fetch his own bits" do
    @author.bits.should == [@bit]
  end

  it "should be able to remove his bit" do
    bit = @author.create_bit("Authors second bit")
    @author.remove_bit("Authors very first bit")
    @author.bits.should == [bit]
  end

  it "should be able to remove any of his bits" do
    @author.remove_bit("Authors very first bit")
    @author.bits.should == []
  end


  end
end
