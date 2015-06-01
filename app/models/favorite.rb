class Favorite < ActiveRecord::Base

  attr_accessor :new_folder_name
  belongs_to :user
  belongs_to :post
  belongs_to :folder


end
