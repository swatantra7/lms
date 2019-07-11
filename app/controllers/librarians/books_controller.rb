class Librarians::BooksController < LibrariansController

  before_action :find_book, only: [:edit, :show, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      flash[:success] = 'Books Created Successfully'
      redirect_to librarians_books_path
    else
      flash[:notice] = "Books Not Created Due to erros #{@book.errors.full_messages.join('')}"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to librarians_books_path
  end

  def destroy
    if @book.book_sanctions.present?
      redirect_to librarians_books_path, alert: 'Opps Cannot Destroy, Book Is Already Issued to SomeOne!!!'
    else
      if @book.destroy
        flash[:notice] = 'Book deleted Successfully'
        redirect_to librarians_books_path
      else
        redirect_to librarians_books_path, alert: @book.errors.full_messages.join
      end
    end
  end

  private

  def find_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(
      :name,
      :quantity
    )
  end

end
