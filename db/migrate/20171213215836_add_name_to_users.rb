class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :firstname, null: false, default: ""
      t.string :lastname, null: false, default: ""
    end
  end
end
