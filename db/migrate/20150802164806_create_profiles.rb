class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :cid
      t.date :birthday
      t.string :sex
      t.string :tel
      t.string :address
    end
  end
end
