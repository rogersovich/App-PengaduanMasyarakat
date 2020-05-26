class CreateComplaints < ActiveRecord::Migration[6.0]
  def change
    create_table :complaints do |t|
      t.references :society, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.text :isi_laporan
      t.string :foto
      t.date :tanggal
      t.integer :status

      t.timestamps
    end
  end
end
