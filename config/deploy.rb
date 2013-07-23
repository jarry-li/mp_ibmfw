# -*- encoding : utf-8 -*-

# for delayed_job
require "delayed/recipes"

# for bundle install
require "bundler/capistrano"

set :application, "mp_staging"
set :repository,  "git@uzhe.com:/dyne/repos/mp.git"
set :scm, :git

set :user, 'git'
set :admin_runner, "root"
# set :scm_username, "git" #your svn username
# set :scm_password, "xxx" #your svn password
set :use_sudo, false
# set :group_writable, false

# deployt_via: remote_cache, chechout, export or copy
set :deploy_via, :copy
#set :copy_exclude, [".git"]

# server "103.6.220.133", :app, :web, :db, :primary => true
# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


task :production do
  server "114.80.204.69", :app, :web, :db, :primary => true

  set :deploy_to, "/dyne/apps/#{application}"
  set :branch, "production"
  # set :rails_env, 'production'
  # set :port, 8126
  set :deploy_env, 'production'

  # set :delayed_job_args, "-n 10 -p production"
  #
  # set :whenever_command, "bundle exec whenever"
  # set :whenever_environment, defer { deploy_env }
  # set :whenever_identifier, defer { "#{application}_#{deploy_env}" }
  # require "whenever/capistrano"
end

task :staging do
  server "114.80.204.69", :app, :web, :db, :primary => true

  set :deploy_to, "/dyne/apps/mp_staging"
  # set :migrate_env, 'staging'
  set :rails_env, 'staging'
  set :deploy_env, 'staging'

  # set :delayed_job_args, "-p staging"

  # set :whenever_command, "bundle exec whenever"
  # set :whenever_environment, defer { deploy_env }
  # set :whenever_identifier, defer { "#{application}_#{deploy_env}" }
  # require "whenever/capistrano"
end

# set :keep_releases, 10

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

after "deploy:update", "deploy:migrate"
after "deploy:finalize_update", "deploy:custom_symlinks"

# after "deploy:stop",    "delayed_job:stop"
# after "deploy:start",   "delayed_job:start"
# after "deploy:restart", "delayed_job:restart"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"

    if deploy_env == 'production'
      run "curl -s -o /dev/null http://www.uzhe.com:250"
    elsif deploy_env == 'staging'
      run "curl -s -o /dev/null http://www.uzhe.com:250"
    end
  end

  task :custom_symlinks, :roles => :app do
    if deploy_env == 'production'
      run "ln -nfs /dyne/shared/mp/config/database.yml #{release_path}/config/database.yml"
      run "ln -nfs /dyne/shared/mp/uploads #{release_path}/public/uploads"
      run "ln -nfs /dyne/shared/mp/logs #{release_path}/public/logs"
    else
      run "ln -nfs /dyne/shared/mp_staging/config/database.yml #{release_path}/config/database.yml"
      run "ln -nfs /dyne/shared/mp_staging/uploads #{release_path}/public/uploads"
      run "ln -nfs /dyne/shared/mp_staging/logs #{release_path}/public/logs"
    end
  end
end
