# frozen_string_literal: true

Dir.glob(File.join(File.dirname(__FILE__), '{xccdf,ds,}', '*.rb'), &method(:require))
