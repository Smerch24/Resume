class AddNewAttributeToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :page, null: false, foreign_key: true
  end
end
