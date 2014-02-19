class ClientDevice < ActiveRecord::Base
  alias_attribute :client_device_identifier, :id

  validates_presence_of :id
  validates_uniqueness_of :id

end


