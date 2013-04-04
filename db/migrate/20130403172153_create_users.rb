class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :name , :email , :password
      user.timestamps 
    end
  end
end
