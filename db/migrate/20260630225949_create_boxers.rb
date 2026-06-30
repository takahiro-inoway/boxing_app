class CreateBoxers < ActiveRecord::Migration[8.1]
  def change
    create_table :boxers do |t|
      t.string :name
      t.string :weight_class
      t.string :record
      t.string :style

      t.timestamps
    end
  end
end
