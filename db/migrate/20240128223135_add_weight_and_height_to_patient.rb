class AddWeightAndHeightToPatient < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :weight, :float
    add_column :patients, :height, :float
  end
end
