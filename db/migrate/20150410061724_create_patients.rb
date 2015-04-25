class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :user
      t.belongs_to :user
      t.integer :patient_hospitalNumber
      t.string :patient_name
      t.string :patient_gender
      t.integer :patient_age
      t.integer :patient_height
      t.integer :patient_weight
      t.string :patient_telephone
      t.string :patient_idNumber
      t.string :patient_residence
      t.string :patient_situation
      t.string :patient_url

      t.timestamps null: false
    end
  end
end
