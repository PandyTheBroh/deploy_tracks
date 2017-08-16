tar_extract 'https://github.com/TracksApp/tracks/archive/v2.3.0.tar.gz' do
  target_dir '/var/lib'
  creates '/var/lib/tracks-2.3.0'
end

execute 'bundle_install' do
  cwd '/var/lib/tracks-2.3.0'
  command 'bundle install --without development test'
  action :nothing
end

template '/var/lib/tracks-2.3.0/Gemfile' do
  source 'gemfile.erb'
  notifies :run, 'execute[bundle_install]', :immediately
end

cookbook_file '/var/lib/tracks-2.3.0/config/database.yml'

cookbook_file '/var/lib/tracks-2.3.0/config/site.yml'

execute 'tracks_owner' do
  cwd '/var/lib'
  command 'sudo chown -R www-data:root /var/lib/tracks-2.3.0'
end

execute 'tracks_permissions' do
  cwd '/var/lib'
  command 'sudo chmod -R 700 /var/lib/tracks-2.3.0'
end

execute 'rake_db' do
  cwd '/var/lib/tracks-2.3.0'
  command 'bundle exec rake db:migrate RAILS_ENV=production'
end

execute 'precompile_assets' do
  cwd '/var/lib/tracks-2.3.0'
  command 'bundle exec rake assets:precompile RAILS_ENV=production'
end

cookbook_file '/var/lib/tracks-2.3.0/tracks.god'

execute 'god -c /var/lib/tracks-2.3.0/tracks.god'
