class RemodelUser < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    remove_column :users, :password_digest, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
  end
end
