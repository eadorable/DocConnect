class AddAddressContactEmailBirthGenderMaritalAgeToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :address, :string
    add_column :patients, :contact_number, :string
    add_column :patients, :email, :string
    add_column :patients, :date_of_birth, :datetime
    add_column :patients, :gender, :string
    add_column :patients, :marital_status, :string
    add_column :patients, :age, :integer
  end
end
