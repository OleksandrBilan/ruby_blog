class AddAuthorNicknameToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :author_nickname, :string
  end
end
