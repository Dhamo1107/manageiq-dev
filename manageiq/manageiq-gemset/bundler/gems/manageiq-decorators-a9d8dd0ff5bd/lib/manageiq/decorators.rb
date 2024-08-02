require "manageiq/decorators/engine"
require "manageiq/decorators/version"

module ManageIQ
  module Decorators
    def self.root
      Engine.root
    end
  end
end
