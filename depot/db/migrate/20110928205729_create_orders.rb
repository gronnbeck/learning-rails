class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :emai
      t.string :pay_type

      t.timestamps
    end
  end
end
