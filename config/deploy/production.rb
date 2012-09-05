set :application, "eyeplus"
set :domain, "li406-49.members.linode.com"
set :repository,  "git@github.com:SummersAdvertising/eyeplus.git"
set :deploy_to, "/var/spool/RoR-Projects/eyeplus"

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
set :user, "apps"
set :password, "1qaz2wsx"
set :group, "webs"

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

namespace :deploy do
	desc "restart"
	task :restart do
		run "ln -s  #{shared_path}/uploads #{current_path}/public/systems"
		
		run "cd #{current_path}; RAILS_ENV=production bundle exec rake cache:clear"
	end
end
