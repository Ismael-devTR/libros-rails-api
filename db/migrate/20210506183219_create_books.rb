class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :nname
      t.integer :pages
      t.date :release_date

      t.timestamps
    end
  end
end
