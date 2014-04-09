require 'spec_helper'

describe Task do

  before :each do
    @task = Task.new
  end

  it { should belong_to :event }

  it 'defaults to uncompleted' do
    expect(@task.completed).to eq(false)
  end

  it 'is invalid without a name' do
    expect(@task).to be_invalid
    expect(@task).to have(1).error_on(:name)
  end

  it 'is valid with a name' do
    @task.name = "not empty"
    expect(@task).to be_valid
  end

end