class WeatherReport < ApplicationRecord
  belongs_to :user
  validates_presence_of :temperature, :humidity, :description
end
