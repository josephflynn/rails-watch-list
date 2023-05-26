class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params.require(:list).permit(:name, :image))
    raise
    if @list.save
      redirect_to @list, notice: "#{@list.name} Saved."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
