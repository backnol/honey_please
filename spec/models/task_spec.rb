describe Task do

  let(:task) { build(:task) }

  it "should only allow status to advance" do
    task.status = :completed
    expect(task).to be_valid

    task.save

    task.status = :pending
    expect(task).to_not be_valid

    expect(task.errors.full_messages).to include('Status change is invalid')
  end

end
