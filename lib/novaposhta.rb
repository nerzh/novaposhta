require 'json'
require 'novaposhta/version'
require 'novaposhta/base'

module Novaposhta
  def self.configure
    yield base_class
  end

  def self.base_class
    Base
  end
end
