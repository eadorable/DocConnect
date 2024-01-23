class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :address
      t.string :contact_number
      t.string :email
      t.string :specialty

      t.timestamps
    end
  end
end
