class CreateAll < ActiveRecord::Migration
  #测试时候写的
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.timestamps # 建立created_at 与 updated_at , 类型都是 datetime
    end
    
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end
    create_table :books do |t|
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
  
end
