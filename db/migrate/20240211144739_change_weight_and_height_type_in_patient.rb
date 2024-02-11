class ChangeWeightAndHeightTypeInPatient < ActiveRecord::Migration[7.0]
  def change
    change_column :patients, :weight, :string
    change_column :patients, :height, :string
  end
end
