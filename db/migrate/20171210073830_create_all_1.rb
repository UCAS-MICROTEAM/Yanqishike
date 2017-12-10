class CreateAll1 < ActiveRecord::Migration
  #正式版的
  def change
    # create_table :users do |t|
    #   t.integer :role
    #   t.string :name
    #   t.string :password
    #   t.timestamps
    # end
    create_table :statuses do |t|
      t.references  :user, index: true#references和belongs_to作用相同,后面跟单数
      t.references  :food, index: true
      t.string :content
      t.timestamps
    end
    
    create_table :foods do |t|
      t.string :name
      t.references :user, index: true
      t.references :merchant, index: true
      # t.references :tag, index: true #用food_tags
      t.timestamps
    end
     create_table :tags do |t|
      t.string :name
      # t.references :food #用food_tags
      t.timestamps
    end
    create_table :food_tags do |t|
      t.belongs_to :food, index:true
      t.belongs_to :tag, index:true
      t.timestamps
    end
    #操 food和tag这个关系简直了
    create_table :foodpaper do |t|
      t.references :user, index: true
      t.string :content
      t.timestamps
    end
    create_table :merchants do |t|
      t.string :name
      t.string :address
      t.string :introduce
      t.references :user
      t.timestamps
    end
   
    create_table :comments do |t|
      t.references :user
      t.references :status
      t.string :content
      t.timestamps
    end
    create_table :cards do |t|
      t.references :user
      t.string :content
      t.timestamps
    end
    create_table :banners do |t|
      t.string :content
      t.string :image
      t.string :url
      t.timestamps
    end
  end
  
end
