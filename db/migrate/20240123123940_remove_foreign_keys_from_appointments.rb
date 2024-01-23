class RemoveForeignKeysFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :appointments, column: :doctor_id
    remove_foreign_key :appointments, column: :secretary_id
  end
end
