cookbook_file '/etc/nginx/sites-available/tracks.io.conf'

file '/etc/nginx/sites-available/default' do
  action :delete
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
end

link '/etc/nginx/sites-enabled/tracks.io.conf' do
  to '/etc/nginx/sites-available/tracks.io.conf'
end

service "nginx" do
  action :restart
end
