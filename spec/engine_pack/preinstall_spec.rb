# frozen_string_literal: true

RSpec.describe EnginePack::Preinstall do
  let(:command_runner) { double('Open3') }
  let(:gem_specs) do
    [
      OpenStruct.new(name: 'package_a', full_gem_path: './spec/dummy_engine'),
      OpenStruct.new(name: 'package_b', full_gem_path: './spec/dummy_engine')
    ]
  end
  let(:subject) { EnginePack::Preinstall.new(command_runner: command_runner) }
  let(:engines) do
    %w[
      package_a
      package_b
    ]
  end

  describe '#call' do
    before do
      EnginePack.reset_config

      EnginePack.configure do |config|
        config.package_manager = :yarn
      end

      allow(EnginePack).to receive(:gem_specs).and_return(gem_specs)
    end

    it 'should install each registered engine using the configured package manager' do
      expect(command_runner).to receive(:run).with(
        'yarn add file:/tmp/enginepack/package_a',
        { EnginePack::Preinstall::ENV_VARIABLE_NAME => '1' }
      )
      expect(command_runner).to receive(:run).with(
        'yarn add file:/tmp/enginepack/package_b',
        { EnginePack::Preinstall::ENV_VARIABLE_NAME => '1' }
      )

      subject.call(engines: engines)
    end
  end
end
