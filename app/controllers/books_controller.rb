class BooksController < ApplicationController

	def index
		@user = User.find(current_user.id)

		@book = Book.new
		@books = Book.all
	end

	def show
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end
end
