class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :type, null: false, default: 'User'
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.index :type

      t.timestamps
    end
  end
end
