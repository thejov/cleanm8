class CreateCleanings < ActiveRecord::Migration[5.0]
  def change
    create_table :cleanings do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
