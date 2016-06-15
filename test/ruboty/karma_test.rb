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
end
