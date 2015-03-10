class AddRegistrationDeadlineToYear < ActiveRecord::Migration
  def change
    add_column :years, :registration_deadline, :date
  end
end
