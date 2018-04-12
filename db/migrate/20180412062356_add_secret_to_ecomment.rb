class AddSecretToEcomment < ActiveRecord::Migration[5.1]
  def change
    add_column :ecomments, :secret, :boolean
  end
end
