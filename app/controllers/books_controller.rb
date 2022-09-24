class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = @book.user
    @books = @user.books
    if @book.save
      redirect_to books_path
    else
      render :'users/show'
    end
  end

  def index
    @books = Book.all
    @books = @user.books
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if  @book.update(book_params)
      redirect_to books_path
      else
        render :edit
      end
  end



  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end





  private

def book_params
  params.require(:book).permit(:title, :body)
end



end

