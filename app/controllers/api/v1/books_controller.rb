class Api::V1::BooksController < ApplicationController
    before_action :load_book, only:[:update, :destroy, :show]
    #index 
    def index
        @Books = Book.all
        json_response("sadasd", true, {books: @Books}, :ok)
    end

    def show
      json_response "Book found!", true, {book: @book}, :ok
    end

    def create
        book = Book.new require_params
        if book.save
            json_response('Review has been created!', true, {book: book}, :created)
        else
            json_response('Failed to create review', false, {book: book}, :unprocessable_entity)
        end
    end

    def update
        if @book.update require_params
            json_response "Book updated!", true, {book: @book}, :ok
        else
            json_response "Failed to update!", false, {}, :unprocessable_entity
        end
    end

    def destroy
        if @book.destroy
            json_response "Book deleted!", true, {}, :ok
        else
            json_response "Failed to delete!", false, {}, :unprocessable_entity
        end
    end

    private

    def load_book
        @book = Book.find_by(id: params[:id])
        json_response('Book not found', false, {}, :not_found) unless @book.present? 
    end

    def require_params
        params.require(:book).permit(:nname, :pages, :release_date)
    end

end
