class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.boolean :global_admin, default: false
      t.string :timezone
      t.boolean :receive_marketing, default: false
      t.string :external_identifier

      t.timestamps
    end
  end
end
