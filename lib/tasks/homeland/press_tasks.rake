namespace :spec do
  namespace :plugin do
    spec_pattern = File.expand_path('../../../../spec/**/*_spec.rb', __FILE__)

    RSpec::Core::RakeTask.new(:press) do |task|
      task.pattern = spec_pattern
    end
  end
end
