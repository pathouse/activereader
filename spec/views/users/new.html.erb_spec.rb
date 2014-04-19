require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User).as_new_record)
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
    end
  end
end
