require 'bundler/gem_tasks'
require 'rake/testtask'

task :upgrade do
  `git add .`
  `git commit -m "auto upgrade"`
  `git push origin master`
end

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test
