RSpec.describe EnginePack::PackageManagers::Yarn do
  describe '#install_command' do
    it 'should return npm install command with the path' do
      expect(subject.install_command('/foo')).to eq('yarn add file:/foo')
    end
  end
end
