require "test_helper"


class RequestTest < ActionDispatch::IntegrationTest

    test "post with id missing params" do
        post "/users",
        params: {firstName: "Jack",
        lastName: "Rick",
        password: "fids7Y6Ccjnoisd",
        mail: "mail@mail.com",
        file: ""
    }
        assert_response :faillure
    
    end

end 