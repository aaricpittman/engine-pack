RSpec.describe EnginePack::EnginePackage do
  describe '#with_path' do
    let(:io_mock) { instance_double('EnginePack::Adapters::IO') }
    let(:subject) { EnginePack::EnginePackage.new(engine_name, io: io_mock, package_config: package_config) }

    context 'engine does specify specific files' do
      let(:engine_name) { 'package_a' }
      let(:package_config) { instance_double('EnginePack::PackageConfig') }
      let(:expected_tmp_path) { "/tmp/enginepack/#{engine_name}" }

      before do
        allow(io_mock).to receive(:tmpdir).and_return('/tmp')
        allow(package_config).to receive(:package_files_paths).and_return(
          [
            'src',
            'package.json'
          ]
        )
      end

      it 'should yield at temp path with only the specified files in it' do
        expect(io_mock).to receive(:mkdir).with(path: expected_tmp_path)
        expect(io_mock).to receive(:copy_files).with(files: ['src', 'package.json'], to: expected_tmp_path)
        expect { |b| subject.with_path(&b) }.to yield_with_args(expected_tmp_path)
      end
    end
  end
end
