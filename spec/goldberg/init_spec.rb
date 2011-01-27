require "spec_helper"

module Goldberg
  describe Init do
    it "adds a new project" do
      Environment.stub!(:argv).and_return(['add', 'url', 'name'])
      Project.should_receive(:add).with(:url => 'url', :name => 'name')
      Init.new.run
    end

    it "removes the specifies project" do
      Environment.stub!(:argv).and_return(['remove', 'name'])
      Project.should_receive(:remove).with('name')
      Init.new.run
    end

    it "lists all projects" do
      Environment.stub!(:argv).and_return(['list'])
      project = mock(Project, :name => 'name')
      Project.should_receive(:all).and_return([project])
      Environment.should_receive(:puts).with('name')
      Init.new.run
    end
  end
end
