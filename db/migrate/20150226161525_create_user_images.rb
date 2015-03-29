class CreateUserImages < ActiveRecord::Migration
  def change
    create_table :user_images do |t|
      t.string :image
      t.references :user, index: true, :unique => true

      t.timestamps
    end
  end
end
