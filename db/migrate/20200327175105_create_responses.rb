class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.references :complaint, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :tanggapan
      t.date :tanggal

      t.timestamps
    end
  end
end
