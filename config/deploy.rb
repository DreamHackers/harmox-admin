# lock '3.4.0'

set :application, 'harmox-admin'
set :repo_url, 'git@bitbucket.org:harmox/harmox-admin.git'
set :deploy_to, '/var/www/harmox/harmox-admin'
set :log_level, :debug
set :scm, :git
set :branch, 'master'
set :repository, "."

set :format, :pretty

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :ssh_options, {
  keys: [File.expand_path('~/workspace/private/key/admin.pem')],
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :keep_releases, 3

namespace :deploy do
  after :publishing, :restart
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
  after :finishing, 'deploy:cleanup'
end
