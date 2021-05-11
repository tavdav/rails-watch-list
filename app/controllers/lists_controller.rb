class ListsController < ApplicationController
  before_action :set_list, only: [ :show ]

  # INDEX
  def index
    @lists = List.all
  end

  # SHOW
  def show; end

  # NEW
  def new
    @list = List.new
  end

  # CREATE
  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to list_path(@list)
    else
      # expects a new html.erb to exist
      render :new
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
