class Field < ApplicationRecord
  
  def field_map
    Field.all.pluck(:id, :name).to_h
  end
end