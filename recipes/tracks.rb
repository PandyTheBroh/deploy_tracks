tar_extract 'https://github.com/TracksApp/tracks/archive/v2.3.0.tar.gz' do
  target_dir '/var/lib'
  creates '/var/lib/tracks-2.3.0'
end

template '/var/lib/tracks-2.3.0/config/database.yml' do
  source 'database.yml.erb'
end

template '/var/lib/tracks-2.3.0/config/site.yml' do
  source 'site.yml.erb'
end

template '/var/lib/tracks-2.3.0/Gemfile' do
  source 'gemfile.erb'
end

gem_package 'bundler'

execute 'bundle_install' do
  cwd '/var/lib/tracks-2.3.0'
  command 'bundle install --without development test'
end

execute 'rake_db' do
  cwd '/var/lib/tracks-2.3.0'
  command 'bundle exec rake db:migrate RAILS_ENV=production'
end

execute 'precompile_assets' do
  cwd '/var/lib/tracks-2.3.0'
  command 'bundle exec rake assets:precompile RAILS_ENV=production'
end

execute 'tracks' do
  cwd '/var/lib/tracks-2.3.0'
  command 'bundle exec rails server -e production -d'
end
