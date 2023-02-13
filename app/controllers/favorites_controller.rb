class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    @books_find = Book.includes(:favorite_users).where(created_at: Time.current.all_week).sort{|a,b| b.favorite_users.size <=> a.favorite_users.size}
    @user_books = @book.user.books.includes(:favorite_users).where(created_at: Time.current.all_week).sort{|a,b| b.favorite_users.size <=> a.favorite_users.size}
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    @books_find = Book.includes(:favorite_users).where(created_at: Time.current.all_week).sort{|a,b| b.favorite_users.size <=> a.favorite_users.size}
  end
end
