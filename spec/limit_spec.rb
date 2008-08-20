require File.join(File.dirname(__FILE__), *%w[abstract_spec])

describe "Limit scope" do

  before do
    uses_fixture(:article)
  end

  it "should default to a limit of 10" do
    Article.limit.proxy_options.should == {:limit => 10}
  end
  
  it "should allow the limit to be specified at runtime" do
    Article.limit(20).proxy_options.should == {:limit => 20}
  end
  
  it "should find the per_page value from will_paginate" do
    ActiveRecord::Base.instance_eval { def per_page; 50; end }
    Article.limit.proxy_options.should == {:limit => 50}
  end
  
  it "should use the runtime limit value over the per_page value from will_paginate" do
    ActiveRecord::Base.instance_eval { def per_page; 50; end }
    Article.limit(5).proxy_options.should == {:limit => 5}
  end
  
  it "should allow override the default limit value with 'default_limit'" do
    Article.default_limit 13
    Article.limit.proxy_options.should == {:limit => 13}
  end
  
  it "should use the runtime value over the default limit value set with 'default_limit'" do
    Article.default_limit 13
    Article.limit(25).proxy_options.should == {:limit => 25}
  end
end