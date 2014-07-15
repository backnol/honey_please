require 'rails_helper'

describe User do
  it 'should have both ' do
    user = create(:user)
    honey = create(:user)
    user.honey = honey
    user.save

    expect(user.inverse_honey).to eq honey
  end
end
