require File.join(File.dirname(__FILE__), *%w[abstract_spec])

describe "Ordered scope" do

  before do
    uses_fixture(:article)
  end

  it "should default to created_at DESC" do
    Article.ordered.proxy_options.should == {:order => 'created_at DESC'}
    Article.default_ordering.should == 'created_at DESC'
  end
  
  it "should allow the order to be specified at runtime" do
    Article.ordered('created_at ASC').proxy_options.should == {:order => 'created_at ASC'}
  end
  
  it "should allow the default to be overidden by using ordered_by" do
    Article.ordered_by 'published_at DESC'
    Article.default_ordering.should == 'published_at DESC'
    Article.ordered.proxy_options.should == {:order => 'published_at DESC'}
  end
  
  it "should use the runtime sort value over the ordered_by value" do
    Article.ordered_by 'published_at DESC'
    Article.ordered('popularity ASC').proxy_options.should == {:order => 'popularity ASC'}
  end
end