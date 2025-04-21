class AddConfirmableToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :unconfirmed_email, :string
    # Use add_index safely
    unless index_exists?(:users, :confirmation_token)
      add_index :users, :confirmation_token, unique: true
    end
  end

  def down
    # Use remove_index safely
    if index_exists?(:users, :confirmation_token)
      remove_index :users, :confirmation_token
    end
    remove_column :users, :unconfirmed_email, :string
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_token, :string
  end
end
