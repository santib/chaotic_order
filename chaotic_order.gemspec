# frozen_string_literal: true

require_relative "lib/chaotic_order/version"

Gem::Specification.new do |spec|
  spec.name          = "chaotic_order"
  spec.version       = ChaoticOrder::VERSION
  spec.authors       = ["Santiago Bartesaghi", "Martin Jaime"]
  spec.email         = ["santib@hey.com", "martinmoron7@gmail.com"]

  spec.summary       = "Add random order to queries that do not have a specific order"
  spec.homepage      = "https://github.com/santib/chaotic_order"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/santib/chaotic_order"
  spec.metadata["bug_tracker_uri"] = "https://github.com/santib/chaotic_order/issues"
  spec.metadata["changelog_uri"] = "https://github.com/santib/chaotic_order/releases"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files         = Dir["LICENSE.txt", "README.md", "lib/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 5.0"
end
