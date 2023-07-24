class Constructor
  attr_reader :constructor_id,
              :name,
              :nationality

  def initialize(data)
    @constructor_id = data[:constructorId]
    @name = data[:name]
    @nationality = data[:nationality]
  end
end