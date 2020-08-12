class ChangeCommenterToTitle < ActiveRecord::Migration[6.0]
  def change
    change_table :comments do |t|
      t.remove :commenter
      t.string :title
    end
  end
end
