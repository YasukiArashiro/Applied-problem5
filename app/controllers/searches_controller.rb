class SearchesController < ApplicationController

	def search_user
		@users = User.all.search(params[:search])
	end

	def search_book
		@books = Book.all.search(params[:search])
	end

end