class Articles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
	  t.string :autor

      t.timestamps
  end
  end
end
