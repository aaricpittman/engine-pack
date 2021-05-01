RSpec.describe EnginePack::PackageConfig do
  let(:package_path) { 'spec/support/fixtures/with-files' }
  let(:subject) { EnginePack::PackageConfig.new(package_path) }

  describe '#initialize' do
    it 'should raise an exception if the provided path does not have a package.json' do
      expect do
        EnginePack::PackageConfig.new('/tmp')
      end.to raise_error(ArgumentError, '/tmp does not have a package.json file.')
    end
  end

  describe '#package_files_paths' do
    it 'should return the path of the files' do
      expect(subject.package_files_paths).to include('spec/support/fixtures/with-files/lib')
      expect(subject.package_files_paths).to include('spec/support/fixtures/with-files/package.json')
    end
  end
end
