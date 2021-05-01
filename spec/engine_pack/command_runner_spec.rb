RSpec.describe EnginePack::CommandRunner do
  let(:io_mock) { class_double('Open3') }
  let(:subject) { EnginePack::CommandRunner.new(io: io_mock) }

  describe '#run' do
    let(:cmd) { 'echo hello' }
    let(:env_vars) { { 'FOO' => 'bar' } }

    it 'should call popen3 on io object' do
      expect(io_mock).to receive(:popen3).with(
        env_vars,
        "#{cmd} 2>&1"
      )

      subject.run(
        cmd,
        env_vars
      )
    end
  end
end
