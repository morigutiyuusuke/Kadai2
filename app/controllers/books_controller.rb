  class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
   def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:alert] =' Book was successfully created.'
    else
       @books = Book.all
      render :index
    end
   end
   
   def edit
    @book = Book.find(params[:id])
   end 
     
    
    def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
    flash[:alert] =' Book was successfully created.'
    redirect_to book_path(@book)
    else
      @books=Book.all
      render :edit
    end
    end
  

  def show
     @books = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  end