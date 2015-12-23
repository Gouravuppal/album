class Album < ActiveRecord::Base
  has_many :pictures, dependent: :destroy
  
  validates :name, presence: true,
              length: { minimum: 5 }
  belongs_to :author
    
 
end
