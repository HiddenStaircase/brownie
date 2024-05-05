class CreateFamilies < ActiveRecord::Migration[7.1]
  def change
    create_table :families do |t|
      t.text :name

      t.timestamps
    end
  end
end
