set :application, "eyeplus"
set :domain, "linode.summers.com.tw"
set :repository,  "git@github.com:SummersAdvertising/eyeplus.git"
set :deploy_to, "/home/deploy/eyeplus"

role :app, domain
role :web, domain
role :db, domain, :primary => true

set :deploy_via, :remote_cache
set :deploy_env, "production"
set :rails_env, "production"
set :scm, :git
set :branch, "master"
set :scm_verbose, true
set :use_sudo, false

set :user, "deploy"
set :password, "1qaz2wsx"
# set :group, "webs"
set :group, "deploy"

default_environment["PATH"] = "/opt/ree/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"

namespace :deploy do
  desc "restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
    run "ln -nsf #{shared_path}/ckeditor_assets #{current_path}/public/ckeditor_assets"
  end
end

desc "Create database.yml and asset packages for production"
after("deploy:finalize_update") do
  db_config = "#{shared_path}/config/database.yml.production"
  run "cp #{db_config} #{release_path}/config/database.yml"
end 