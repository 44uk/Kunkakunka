require 'kunkakunka/version'
require 'kunkakunka/text'

module Kunkakunka
  def self.do(params = nil)
    text = Kunkakunka::Text.new(params = nil)
    text.to_s
  end
end
