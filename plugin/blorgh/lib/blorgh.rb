require "blorgh/engine"

module Blorgh
  # Your code goes here...
  mattr_accessor :author_class
  @@author_class = "User"
  def self.author_class
    @@author_class.constantize
  end
end
