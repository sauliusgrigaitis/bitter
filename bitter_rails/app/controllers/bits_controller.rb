class BitsController < ApplicationController
  def index

  end

  def new

  end

  def edit
    @bit = Bit.find(params[:id])
  end


  def update
    bit = Bit.find(params[:id])
    bit.update(params.require(:bit).permit(:message))
    redirect_to bits_path
  end

  def create
    Bit.create(params.require(:bit).permit(:message))
    redirect_to bits_path
  end

  def destroy
    Bit.destroy(params[:id])
    redirect_to bits_path
  end
end
