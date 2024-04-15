$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "blorgh/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "blorgh"
  spec.version     = Blorgh::VERSION
  spec.authors     = ["SuperLazyDog"]
  spec.email       = ["jyoitatsu@gmail.com"]
  spec.homepage    = "https://github.com/SuperLazyDog/Learning-Ruby"
  spec.summary     = "Summary of Blorgh."
  spec.description = "Description of Blorgh."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.6"

  spec.add_development_dependency "sqlite3"
  # fix Psych::BadAlias: Unknown alias: default
  # https://qiita.com/Bjp8kHYYPFq8MrI/items/90a9db03160f8d6f7e5c
  spec.add_development_dependency 'psych', '~> 3.1'
  # spec.add_development_dependency 'mutex_m'
  
  spec.add_development_dependency 'sidekiq', '~> 6.2', '>= 6.2.2'
  spec.add_development_dependency 'sidekiq-cron', '~> 1.4'



  spec.add_development_dependency 'redis', '~> 4.2', '>= 4.2.2'
  spec.add_development_dependency 'redis-namespace', '~> 1.7', '>= 1.7.0'
  # no needed
  # https://github.com/redis-store/redis-rails
  # spec.add_development_dependency 'redis-rails', '~> 5.0', '>= 5.0.2'
end
