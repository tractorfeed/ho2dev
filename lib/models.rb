class PermitType
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text

  has n, :permits
end

class PermitStatus
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text

  has n, :permits
end

class PermitActions
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text

  has n, :permits
end

class Neighborhood
  include DataMapper::Resource

  property :id, Serial

  property :name, String
  property :total_population_2010, Integer
  property :total_population_2000, Integer

  property :total_white, Integer
  property :total_black, Integer
  property :total_hispanic, Integer
  property :total_other, Integer
  property :total_kids, Integer
  property :total_kids_percent, Integer

  has n, :permits
end

class Permit
  include DataMapper::Resource

  property :id,                  Serial
  property :date,                Date
  property :number,              String
  property :site_address,        String

  # Geodata, get this separately
  property :latitude,            Float
  property :longitude,           Float

  belongs_to :permit_status
  belongs_to :permit_type
  belongs_to :permit_actions
  belongs_to :neighborhood
end

DataMapper.finalize
DataMapper.auto_upgrade!
