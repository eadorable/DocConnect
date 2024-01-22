class CreateMedicalHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_histories do |t|
      t.references :patient, null: false, foreign_key: true
      t.text :history_details

      t.timestamps
    end
  end
end
