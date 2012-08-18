require 'kunkakunka/version'
require 'kunkakunka/text'

module Kunkakunka
  def self.do(params = nil)
    self.create(params).to_s
  end

  def self.create(params = nil)
    Kunkakunka::Text.new(params)
  end
end
