require 'test_helper'

class Elasticsearch::Model::ResultTest < Test::Unit::TestCase
  context "Response result" do

    should "have method access to properties" do
      result = Elasticsearch::Model::Response::Result.new foo: 'bar', bar: { bam: 'baz' }

      assert_respond_to result, :foo
      assert_respond_to result, :bar

      assert_equal 'bar', result.foo
      assert_equal 'baz', result.bar.bam

      assert_raise(NoMethodError) { result.xoxo }
    end

    should "delegate method calls to `_source` when available" do
      result = Elasticsearch::Model::Response::Result.new foo: 'bar', _source: { bar: 'baz' }

      assert_respond_to result, :foo
      assert_respond_to result, :_source
      assert_respond_to result, :bar

      assert_equal 'bar', result.foo
      assert_equal 'baz', result._source.bar
      assert_equal 'baz', result.bar
    end

    should "delegate methods to @result" do
      result = Elasticsearch::Model::Response::Result.new foo: 'bar'

      assert_equal 'bar', result.foo
      assert_equal 'bar', result.fetch('foo')
      assert_equal 'moo', result.fetch('NOT_EXIST', 'moo')

      assert_respond_to result, :to_hash
      assert_equal({'foo' => 'bar'}, result.to_hash)

      assert_raise(NoMethodError) { result.does_not_exist }
    end

  end
end
