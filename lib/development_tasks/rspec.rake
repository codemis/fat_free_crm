if defined?(RSpec)
  require 'rspec/core/rake_task'
  
  namespace :spec do
    desc "Preparing test env"
    task :prepare do
      tmp_env = Rails.env
      Rails.env = "test"
      Rake::Task["ffcrm:config:copy_database_yml"].invoke
      puts "Preparing test database..."
      Rake::Task["db:schema:load"].invoke
      Rails.env = tmp_env
    end
  end

  Rake::Task["spec"].prerequisites.clear
  Rake::Task["spec"].prerequisites.push("spec:prepare")

  desc 'Run the acceptance specs in ./acceptance'
  RSpec::Core::RakeTask.new(:acceptance => 'spec:prepare') do |t|
    t.pattern = 'acceptance/**/*_spec.rb'
  end
end
