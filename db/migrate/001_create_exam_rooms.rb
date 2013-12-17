class CreateExamRooms < ActiveRecord::Migration
  def self.up
    create_table :exam_rooms do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :code
      t.string :school
      t.string :room
      t.string :room_display
      t.string :seat
      t.integer :seq
      t.string :level
      t.timestamps
    end
  end

  def self.down
    drop_table :exam_rooms
  end
end
