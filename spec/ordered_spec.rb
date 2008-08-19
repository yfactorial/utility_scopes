require File.join(File.dirname(__FILE__), *%w[abstract_spec])

describe "Ordered scope" do

  before do
    uses_fixture(:simple_article)
  end

  it "should default to a limit of 10" do
    SimpleArticle.limit.proxy_options.should == {:limit => 10}
  end
  
  it "should allow the limit to be specified at runtime" do
    SimpleArticle.limit(20).proxy_options.should == {:limit => 20}
  end
  
  it "should find the per_page value from will_paginate" do
    ActiveRecord::Base.instance_eval { def per_page; 50; end }
    SimpleArticle.limit.proxy_options.should == {:limit => 50}
  end
  
  it "should use the runtime limit value over the per_page value from will_paginate" do
    ActiveRecord::Base.instance_eval { def per_page; 50; end }
    SimpleArticle.limit(5).proxy_options.should == {:limit => 5}
  end
end