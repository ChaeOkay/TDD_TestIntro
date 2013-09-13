class MenuItem < ActiveRecord::Base
  validates_presence_of :name, :description, :price, :menu
  belongs_to :menu
end
