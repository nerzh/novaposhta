require 'json'
require 'active_support'
require 'novaposhta/version'
require 'novaposhta/base'
require 'novaposhta/address'

module Novaposhta
  def self.configure
    yield base_class
  end

  def self.base_class
    Base
  end
end
