module TextValidations
  
  def self.included(object)
    col_names = object.column_names
    col_names.each do |col_name|
      object.validates col_name, :format => {:without => /kitten/}
    end
  end
  
end