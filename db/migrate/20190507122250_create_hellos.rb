class CreateHellos < ActiveRecord::Migration[5.2]
  def change
    create_table :hellos do |t|
      t.string :username
      t.date :dateOfBirth

      t.timestamps
    end
    add_index :hellos, :username
  end
end
