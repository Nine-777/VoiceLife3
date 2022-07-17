class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :user, null: false
      t.references :post, null: false

      t.timestamps
    end
  end
end