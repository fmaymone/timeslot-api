require 'spec_helper'
require 'rake'

# TODO: maybe write a spec
describe 'foo namespace rake task' do
  before :all do
    Rake.application.rake_require "tasks/user_tasks"
    Rake::Task.define_task(:environment)
  end

  describe 'foo:bar' do
    before do
      # BarOutput.stub(:banner)
      # BarOutput.stub(:puts)
    end

    let :run_rake_task do
      # Rake::Task["foo:bake_a_bar"].reenable
      # Rake.application.invoke_task "foo:bake_a_bar"
    end

    it "should bake a bar" do
      # Bar.any_instance.should_receive :bake
      # run_rake_task
    end
  end
end
