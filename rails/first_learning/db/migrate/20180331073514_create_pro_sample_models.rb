class CreateProSampleModels < ActiveRecord::Migration[5.1]
  def change
    create_table :pro_sample_models do |t|
      t.text :text

      t.timestamps
    end
  end
end
