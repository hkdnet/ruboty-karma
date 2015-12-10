require 'minitest/autorun'
require 'minitest-power_assert'
require 'ruboty/karma'

describe Ruboty::Handlers::Karma do
  class Ruboty::Handlers::Karma
    def self.increment_pattern
      INCREMENT_PATTERN
    end

    def self.delete_pattern
      DELETE_PATTERN
    end
  end

  describe 'INCREMENT_PATTERN' do
    pattern = Ruboty::Handlers::Karma.increment_pattern
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
    pattern = Ruboty::Handlers::Karma.delete_pattern
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
