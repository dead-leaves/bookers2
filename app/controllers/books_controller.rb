class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    @books = Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :'users/show'
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = @book.user
    @user = current_user
  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
      if  @book.update(book_params)
          flash[:notice] = "You have update book successfully."
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

