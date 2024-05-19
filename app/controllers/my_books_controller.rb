class MyBooksController < ApplicationController
    def new
        @book=Book.new
    end
    def show
        @user=User.find(params[:id])
        @books=@user.books

    end
    def create
        @book =current_user.books.new(book_params)
        if @book.save
            redirect_to my_book_path(@current_user)
        else
            render 'new',status: :unprocessable_entity
        end
    end

    def destroy
        @book=Book.find(params[:id])
        if @book
            @book.destroy
            redirect_to my_books_path(@current_user)
        else
            render 'new',status:unprocessable_enitiy
        end
    end

    private
    def book_params
        params.require(:book).permit(:title,:author)
    end
end
