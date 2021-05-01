RSpec.describe EnginePack::PackageManagerFactory do
  describe '.build' do
    it 'should return PackageManagers::Npm if name is :npm' do
      expect(described_class.build(:npm)).to be_a(EnginePack::PackageManagers::Npm)
    end

    it 'should return PackageManagers::Yarn if name is :yarn' do
      expect(described_class.build(:yarn)).to be_a(EnginePack::PackageManagers::Yarn)
    end
  end
end
