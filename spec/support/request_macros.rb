module RequestMacros
  module SessionHelpers
    def login_user
      before(:each) do
        @current_user = create(:user)
        login_as @current_user, scope: :user
      end
    end
  end

  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body, symbolize_names: true)
    end
  end
end