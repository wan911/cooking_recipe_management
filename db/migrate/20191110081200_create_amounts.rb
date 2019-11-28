class CreateAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :amounts do |t|
      t.string   :amount,   index: true, unique: true
      t.timestamps
    end
  end
end
