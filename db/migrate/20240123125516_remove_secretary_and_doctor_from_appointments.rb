class RemoveSecretaryAndDoctorFromAppointments < ActiveRecord::Migration[7.0]
  def change
    remove_column :appointments, :secretary_id, :bigint
    remove_column :appointments, :doctor_id, :bigint
  end
end
