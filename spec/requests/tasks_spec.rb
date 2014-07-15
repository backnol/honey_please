describe 'Tasks Api', type: :request do
  login_user
  let(:relationship) { create(:relationship, user: @current_user) }
  let(:honey) { relationship.honey }
  it 'lists tasks assigned to the current user' do
    task = create(:task, assigned_user: @current_user, user: honey)

    get tasks_path

    expect(response).to be_success

    expect(json.size).to eq 1
    
    task_json = json.first
    expect(task_json[:title]).to eq task.title
    expect(task_json[:due_at]).to eq task.due_at.as_json
    expect(task_json[:status]).to eq task.status
    expect(task_json[:points]).to eq task.points.to_s
  end

  it "lists tasks assigned to the current user's honey" do
    task = create(:task, user: @current_user, assigned_user: honey)

    get tasks_path(honeys: true)

    expect(response).to be_success

    expect(json.size).to eq 1

    task_json = json.first
    expect(task_json[:title]).to eq task.title
    expect(task_json[:due_at]).to eq task.due_at.as_json
    expect(task_json[:status]).to eq task.status
    expect(task_json[:points]).to eq task.points.to_s
  end
end