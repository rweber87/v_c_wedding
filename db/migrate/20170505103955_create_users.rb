class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :username
      t.string :password_digest
      t.string :v_or_c

      t.timestamps
    end
  end
end