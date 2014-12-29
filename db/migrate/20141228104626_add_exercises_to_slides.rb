class AddExercisesToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :question1, :string
    add_column :slides, :question2, :string
    add_column :slides, :question3, :string
  end
end
