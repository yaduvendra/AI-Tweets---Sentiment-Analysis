set :application, "Twitter AI sentiment analysis"
set :repository,  "git@github.com:joeycarmello/AI-Tweets---Sentiment-Analysis.git"
set :scm, :git

set :deploy_to, "/home/www/live/tweets"

default_run_options[:pty] = true
set :user, "www"

role :web, "tweets.joeycarmello.com"                          # Your HTTP server, Apache/etc
role :app, "tweets.joeycarmello.com"                          # This may be the same as your `Web` server
role :db,  "tweets.joeycarmello.com", :primary => true


require 'bundler/capistrano'

before 'deploy:cold',
       'deploy:install_bundler'


task :install_bundle, :roles => :app do 
  run 'type -P bundle &>/dev/null || { gem install bundler --no-rdoc --no-ri; }'
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
