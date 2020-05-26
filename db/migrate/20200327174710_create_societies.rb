class CreateSocieties < ActiveRecord::Migration[6.0]
  def change
    create_table :societies do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :telp

      t.timestamps
    end
  end
end
