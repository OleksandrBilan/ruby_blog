class AddAuthorEmailToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :author_email, :string
  end
end
