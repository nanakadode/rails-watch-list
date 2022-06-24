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

  def delete
    @list = List.find(params[:id])
    @list.destroy
    redirect_to '/lists'
  end

  private

  def param_list
    params.require(:list).permit(:name, :photo)
  end
end
