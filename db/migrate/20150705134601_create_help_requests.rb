class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests do |t|
      t.string :email, null: false
      t.string :message, null: false

      t.timestamps null: false
    end
  end
end
