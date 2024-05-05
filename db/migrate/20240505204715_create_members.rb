class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.text :given_name
      t.text :family_name
      t.references :family, null: false, foreign_key: true

      t.timestamps
    end
  end
end
