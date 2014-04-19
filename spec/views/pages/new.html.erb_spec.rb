require 'spec_helper'

describe "pages/new" do
  before(:each) do
    assign(:page, stub_model(Page).as_new_record)
  end

  it "renders new page form" do
    render

    assert_select "form[action=?][method=?]", pages_path, "post" do
    end
  end
end
