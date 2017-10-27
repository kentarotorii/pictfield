class RenameCaptionColumnToPictures < ActiveRecord::Migration[5.1]
  def change
    rename_column :pictures, :caption, :comment
  end
end
