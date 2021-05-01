namespace :engine_pack do
  desc <<-HEREDOC
    Install configured gems as JavaScript packages using configured package manager.
    Example:
      rake engine_pack:preinstall
  HEREDOC
  task preinstall: :environment do
    exit 0 if ENV.fetch(EnginePack::Preinstall::ENV_VARIABLE_NAME, nil) == '1'

    EnginePack::Preinstall.call(engines: EnginePack.config.engines)
  end
end
