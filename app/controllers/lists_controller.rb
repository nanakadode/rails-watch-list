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
    @list = List.new(param_list)
    if @list.save
      redirect_to list_path(@list)
    else
      # look for view folder ,
      render :new
    end


  end

  def param_list
    params.require(:list).permit(:name, :photo)
  end
end
