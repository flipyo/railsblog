class AddAutorToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :autor, :string
  end
end
