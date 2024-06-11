class MyBooksController < ApplicationController
    def new
        @my_book=MyBook.new
    end
    def show
        @user=User.find(params[:id])
        @my_books=@user.my_books
        @my_books_read=@user.my_books.where(read: 1).order(id: :asc)
        @my_books_unread=@user.my_books.where(read: 0).order(id: :asc)
    end
    def create
        @my_book =current_user.my_books.new(my_book_params)
        @my_book.read||=0
        if @my_book.save
            redirect_to my_book_path(@current_user)
        else
            render 'new',status: :unprocessable_entity
        end
    end

    def destroy
        @my_book=MyBook.find(params[:id])
        if @my_book
            @my_book.destroy
            redirect_to my_book_path(current_user)
        else
            redirect_to new_my_book_path,status: :unprocessable_entity
        end
    end

    def finish
        @book=MyBook.find(params[:id])
        if @book
            @book.update(read:1)
            redirect_to my_book_path(current_user)
        else
            render 'show',status: :unprocessable_entity
        end
    end

    
    private
    def my_book_params
        params.require(:my_book).permit(:title,:author,:read)
    end
end
