require "bundler/capistrano"

set :user, 'nik'
set :domain, "site.loc"
set :application, 'test_ruby_serv'
set :url, "https://github.com/DrGEF/"

set :rvm_type, :user
set :rvm_ruby_string, 'ruby-2.2.0'
require 'rvm/capistrano'

set :repository,  "#{url}/#{application}.git"
set :deploy_to, "home/#{nik}/srv/ruby/"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db, domain, :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbosem, true
set :use_sudo, false
set :rails_env, :production

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy:update_code", :bundle_install
desc "install"
task :bundle_install, :roles => :app do
	run "cd #{release_path} && bundle install"
end