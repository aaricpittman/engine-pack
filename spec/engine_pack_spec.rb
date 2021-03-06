# frozen_string_literal: true

RSpec.describe EnginePack do
  it 'has a version number' do
    expect(EnginePack::VERSION).not_to be nil
  end
end
