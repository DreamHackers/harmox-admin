set :stage, :production
set :rails_env, 'production'
set :migration_role, 'db'
set :bundle_env_variables, { 'NOKOGIRI_USE_SYSTEM_LIBRARIES' => 1 }
server 'production.example.com', user: 'ec2-user', roles: %w{web app db}
