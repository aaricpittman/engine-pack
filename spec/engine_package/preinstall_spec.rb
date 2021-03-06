# frozen_string_literal: true

RSpec.describe EnginePack::Preinstall do
  let(:command_runner) { double('Open3') }
  let(:gem_spec_set) do
    [
      OpenStruct.new(name: 'package_a', full_gem_path: '/gems/package_a'),
      OpenStruct.new(name: 'package_b', full_gem_path: '/gems/package_b')
    ]
  end
  let(:subject) { EnginePack::Preinstall.new(command_runner: command_runner, gem_spec_set: gem_spec_set) }

  describe '#call' do
    before do
      EnginePack.reset_config

      EnginePack.configure do |config|
        config.package_manager = :yarn
        config.engines = %w[
          package_a
          package_b
          package_c
        ]
      end
    end

    it 'should install each registered engine using the configured package manager' do
      expect(command_runner).to receive(:popen3).with(
        { EnginePack::Preinstall::ENV_VARIABLE_NAME => '1' },
        'yarn add file:/gems/package_a'
      )
      expect(command_runner).to receive(:popen3).with(
        { EnginePack::Preinstall::ENV_VARIABLE_NAME => '1' },
        'yarn add file:/gems/package_b'
      )
      expect(command_runner).not_to receive(:popen3).with(
        { EnginePack::Preinstall::ENV_VARIABLE_NAME => '1' },
        'yarn add file:/gems/package_b'
      )

      subject.call
    end
  end
end
