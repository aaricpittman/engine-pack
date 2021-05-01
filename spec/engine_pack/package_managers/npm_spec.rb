RSpec.describe EnginePack::PackageManagers::Npm do
  describe '#install_command' do
    it 'should return npm install command with the path' do
      expect(subject.install_command('/foo')).to eq('npm install /foo')
    end
  end
end
