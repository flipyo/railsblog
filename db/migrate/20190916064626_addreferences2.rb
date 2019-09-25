class Addreferences2 < ActiveRecord::Migration[6.0]
  def change
     add_reference :articles, :user, foreign_key: true
  end
end
