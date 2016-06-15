require 'minitest/autorun'
require 'minitest-power_assert'
require 'ruboty/karma'

describe Ruboty::Handlers::Karma do
  describe 'INCREMENT_PATTERN' do
    pattern = Ruboty::Handlers::Karma::INCREMENT_PATTERN
    it "should match '@hoge ++' -> hoge" do
      match = pattern.match('@hoge ++')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
    it "should match '@hoge: ++' -> hoge" do
      match = pattern.match('@hoge: ++')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
    it "should match 'hoge ++' -> hoge" do
      match = pattern.match('hoge ++')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
    it "should match 'hoge: ++' -> hoge" do
      match = pattern.match('hoge: ++')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
  end

  describe 'DELETE_PATTERN' do
    pattern = Ruboty::Handlers::Karma::DELETE_PATTERN
    it "should match 'delete karma @hoge' -> hoge" do
      match = pattern.match('delete karma @hoge')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
    it "should match 'delete karma @hoge:' -> hoge" do
      match = pattern.match('delete karma @hoge:')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
    it "should match 'delete karma hoge' -> hoge" do
      match = pattern.match('delete karma hoge')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
    it "should match 'delete karma hoge:' -> hoge" do
      match = pattern.match('delete karma hoge:')
      assert { !match.nil? }
      assert { match['name'] == 'hoge' }
    end
  end

  describe 'LIST_PATTERN' do
    pattern = Ruboty::Handlers::Karma::LIST_PATTERN
    it "should match 'list karma'" do
      match = pattern.match('list karma')
      assert { !match.nil? }
    end

    it "should be able to capture args" do
      match = pattern.match('list karma args')
      assert { !match.nil? }
      assert { match['args'] == 'args' }
    end

    it "should be able to capture two args" do
      match = pattern.match('list karma args1 args2')
      assert { !match.nil? }
      assert { match['args'] == 'args1 args2' }
    end
  end
end
