# frozen_string_literal: true

require_relative "lib/chaotic_order/version"

Gem::Specification.new do |spec|
  spec.name          = "chaotic_order"
  spec.version       = ChaoticOrder::VERSION
  spec.authors       = ["Santiago Bartesaghi"]
  spec.email         = ["santib@hey.com"]

  spec.summary       = "Add random order to queries that do not have a specific order"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/santib/chaotic_order"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/santib/chaotic_order/issues"
  spec.metadata["changelog_uri"] = "https://github.com/santib/chaotic_order/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 5.0"
end
