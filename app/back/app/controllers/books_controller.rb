class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @book = Book.where(user_id: current_user.id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(
      title: book_params[:title], 
      author: book_params[:author], 
      label: book_params[:label],
      user_id: current_user.id
    )
    if @book.save
      redirect_to('/books')
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :label)
    end
end
