require 'spec_helper'

describe Chef::Resource::XmlFile do
  context '#resource' do
    let(:resource) do
      Chef::Resource::XmlFile.new('test', nil)
    end
    it '#partial' do
      resource.partial('//foo/bar', 'test.xml', 10)
      resource.partial('//foo/bar', 'test_second_partial.xml', 10)
      array = []
      array.push(['//foo/bar', 'test.xml', 10])
      array.push(['//foo/bar', 'test_second_partial.xml', 10])
      expect(resource.partials).to match_array(
        [
          ['//foo/bar', 'test.xml', 10],
          ['//foo/bar', 'test_second_partial.xml', 10]
        ])
    end
    it '#text' do
      resource.text('/foo/baz', 'test-content')
      expect(resource.texts['/foo/baz']).to eq('test-content')
    end
    it '#attribute' do
      hash = { name: 'test-attr', value: 'test-value' }
      resource.attribute('/bar/baz', hash[:name], hash[:value])
      expect(resource.attributes['/bar/baz']).to eq([hash])
    end
    it '#remove' do
      resource.remove('//baz')
      expect(resource.removes['//baz']).to eq('//baz')
    end
    it '#decorate' do
      resource.decorate do |doc|
      end
      expect(resource.decorator_block).to_not be_nil
    end
  end
end
