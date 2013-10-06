class DeviseCreateAdministrators < ActiveRecord::Migration
  def self.up
    create_table(:administrators) do |t|
    #  t.database_authenticatable :null => false
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
     # t.recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

    #  t.rememberable
      t.datetime :remember_created_at
    #  t.trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
    
   #   t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
   #   t.token_authenticatable
      t.string :authentication_token
      
      t.string  :first_name,    :limit => 50, :null => false
      t.string  :last_name,     :limit => 50, :null => false
      t.timestamps
    end

    add_index :administrators, :email,                :unique => true
    add_index :administrators, :reset_password_token, :unique => true
    add_index :administrators, :first_name
    add_index :administrators, :last_name   

  end
  
  def self.down
    remove_index  :administrators, "index_administrators_on_last_name"
    remove_index  :administrators, "index_administrators_on_first_name"      
    remove_index  :administrators, "index_administrators_on_reset_password_token"    
    remove_index  :administrators, "index_administrators_on_email"    
    drop_table    :administrators
  end 
end
