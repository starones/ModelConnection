class Favorite < ApplicationRecord
  
  belongs_to :actor
  belongs_to :clients
  
end
