class CreateFeedables < ActiveRecord::Migration[5.2]
  def change
    create_table :feedables do |t|
      t.belongs_to :pet, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
