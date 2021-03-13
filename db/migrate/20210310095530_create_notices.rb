class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string      :title
      t.text        :notice
      t.integer     :user_id
      t.integer     :group_id
      t.timestamps
    end
  end
end
