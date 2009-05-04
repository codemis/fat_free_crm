require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tasks/new.html.haml" do
  include TasksHelper

  before(:each) do
    login_and_assign
    assigns[:task] = Factory.build(:task)
    assigns[:users] = [ @current_user ]
    assigns[:bucket] = Setting.task_bucket[1..-1] << [ "On Specific Date...", :specific_time ]
    assigns[:category] = Setting.invert(:task_category)
  end

  it "create: should hide :tasks_flash div if it exists" do
    render "tasks/new.js.rjs"

    response.should include_text('$("tasks_flash").hide();')
  end

  it "create: should render [new.html.haml] template into :create_task div" do
    params[:cancel] = nil
    render "tasks/new.js.rjs"
    
    response.should have_rjs("create_task") do |rjs|
      with_tag("form[class=new_task]")
    end
    response.should include_text('crm.flip_form("create_task");')
  end

  it "cancel: should render [new.html.haml] template into :create_task div" do
    params[:cancel] = "true"
    render "tasks/new.js.rjs"

    response.should_not have_rjs("create_task")
    response.should include_text('crm.flip_form("create_task");')
  end

end

