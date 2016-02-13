require 'rake/testtask'
require './genicon'

task :g do
  Genicon::IconGenerator.new.generate(colors: ['#CCC', '#EEE'], rotate: 45)
end

task :simple do
  Genicon::IconGenerator.new.generate(color: 'lightblue')
end

task :two_toned do
  Genicon::IconGenerator.new.generate(colors: ['lightblue', 'blue'])
end

task :rotate do
  Genicon::IconGenerator.new.generate(colors: ['lightyellow', 'gray'], rotate: 45)
end

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end
