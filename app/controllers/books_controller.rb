class BooksController < ApplicationController
	before_action :authenticate_user
	def authenticate_user
		if current_user == nil
			redirect_to "/top"
		end
	end

	before_action :ensure_correct_book, {only:[:edit, :update]}
    def ensure_correct_book
    	if @current_user.id != params[:user_id]
    		redirect_to books_path
    	end
  	end

	def index
		@user = User.find(current_user.id)

		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)

	    @book_new = Book.new
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "You have creatad book successfully."
			redirect_to book_path(@book)
		else
			@user = User.find(current_user.id)
			@books = Book.all
			render("books/index")
		end
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to book_path(@book)
		else
    		render("books/edit")
    	end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
end
