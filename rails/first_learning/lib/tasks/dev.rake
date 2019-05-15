require_relative '../../dev.rb'

namespace :dev do

  task :tasks do
    Dev.new.print_task
  end

  task :note do
    Dev.new.print_note
  end

  task :shift do
    Dev.new.print_shift
  end
end
