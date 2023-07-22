class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end  
  
  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  
  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end
  
  
  def edit
    @books = Book.all
    @book = Book.find(params[:id])
  end
  
  def update
    @books = Book.all
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)  
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end