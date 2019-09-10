class BooksController < ApplicationController
    def index
      @books = Book.all
      @book = Book.new
      @book_post = Book.new
    end

    def show
      @book = Book.find(params[:id])
    end

    def new
      @book = Book.new
    end

    def create
      @book_post = Book.new(book_params)
      if @book_post.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book_post.id)
      else
        @books = Book.all
        @book = Book.new
        render 'index'
      end
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
      book = Book.find(params[:id])
      book.update(book_params)
      flash[:notice] = "Book was successfully update."
      redirect_to book_path(book.id)
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end




end
