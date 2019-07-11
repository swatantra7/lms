class Librarians::BookSanctionsController < LibrariansController

  def index
    @book_sanctions = current_user.book_sanctions.includes(:book)
  end

  def new
    @book_sanction = current_user.book_sanctions.new
  end

  def create
    @book_sanction = current_user.book_sanctions.new(book_sanctions_params)
    if @book_sanction.save
      redirect_to librarians_book_sanctions_path
    else
      render 'new'
    end
  end

  def cancel

  end

  private

  def book_sanctions_params
    params.require(:book_sanction).permit(
      :book_id,
      :user_name,
      :quantity,
      :status,
      :start_date,
      :end_date 
    )
  end

end
