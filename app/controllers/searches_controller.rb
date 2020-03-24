class SearchesController < ApplicationController

	def search
		if params[:range] == 'user'
			match = params[:match]
			search = params[:search]
			if match == 'perfect'
				@users = User.where(name: params[:search])
			elsif match == 'start'
				@users = User.all.search_start(params[:search])
			elsif match == 'back'
				@users = User.all.search_back(params[:search])
			elsif match == 'part'
				@users = User.all.search_part(params[:search])
			end
			render :search_user
		else
			search_book
		end
	end

	def search_user

	end

	def search_book
		@books = Book.all.search(params[:search])
		render :search_book
	end

end