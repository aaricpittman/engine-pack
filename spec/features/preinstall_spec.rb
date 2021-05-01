RSpec.describe 'preinstalling engine', :acceptance do
  before do
    @original_dir = Dir.pwd
    Dir.chdir('spec/dummy_app')
  end

  after do
    `rm -r node_modules`
    Dir.chdir(@original_dir)
  end

  it 'should install the configure engine', :focus do
    expect(Pathname.new('node_modules/dummy_engine')).not_to exist

    `yarn install`

    expect(Pathname.new('node_modules/dummy_engine')).to exist
    expect(Pathname.new('node_modules/dummy_engine/lib')).to exist
    expect(Pathname.new('node_modules/dummy_engine/package.json')).to exist

    expect(Pathname.new('node_modules/dummy_engine/Gemfile')).not_to exist
    expect(Pathname.new('node_modules/dummy_engine/dummy_engine.gemspec')).not_to exist
    expect(Pathname.new('node_modules/dummy_engine/test')).not_to exist
  end
end
