require 'spec_helper'

describe BitsController do

  describe "#create" do
    it "show allow to create bit" do
      post :create, bit: { message: "Very first message from browser" }
      Bit.last.message.should == "Very first message from browser"
    end
  end


  describe "#index" do
    it 'should show all bits' do
      Bit.create(message: "First bit")
      Bit.create(message: "second bit")
      get :index
      response.success?.should == true
    end
  end

  describe "#new" do
    it 'should render form' do
      get :new
      response.success?.should == true
    end
  end

  describe "#edit" do
    before do
      @bit = Bit.create(message: 'editable')
    end

    it "should render edit form" do
      get :edit, id: @bit.id
      response.success?.should == true
    end

    it 'should allow to edit existig bit' do
      get :edit, id: @bit.id
      assigns[:bit].should == @bit

    end


  end


  describe "#update" do
    it "should allow to change bit message" do
      bit = Bit.create(message: 'first')

      expect {
        put :update, id: bit.id, bit: { message: "change" }
      }.to change { bit.reload.message }.from("first").to("change")
    end
  end

  describe "#destroy" do
    it 'should destroy bit' do
      bit = Bit.create(message: 'msg')
      expect {
        delete :destroy, id: bit.id
      }.to change { Bit.count }.by(-1)
    end
  end
end
