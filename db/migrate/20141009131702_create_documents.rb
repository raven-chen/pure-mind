class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :thumbnail_url
      t.string :content_image_url
      t.text :content
      t.string :kind

      t.timestamps
    end
  end
end
