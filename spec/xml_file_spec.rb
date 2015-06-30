require 'spec_helper'

describe Chef::Resource::XmlFile do
  context '#resource' do
    let(:resource) do
      Chef::Resource::XmlFile.new('test', nil)
    end
    it '#partial' do
      resource.partial('//foo/bar', 'test.xml', 10)
      hash = { file: 'test.xml', position: 10 }
      expect(resource.partials['//foo/bar']).to eq(hash)
    end
    it '#text' do
      resource.text('/foo/baz', 'test-content')
      expect(resource.texts['/foo/baz']).to eq('test-content')
    end
    it '#attribute' do
      hash = {name: 'test-attr', value: 'test-value'}
      resource.attribute('/bar/baz', hash[:name], hash[:value])
      expect(resource.attributes['/bar/baz']).to eq([hash])
    end
    it '#decorate' do
      resource.decorate do |doc|
      end
      expect(resource.decorator_block).to_not be_nil
    end
  end
end
