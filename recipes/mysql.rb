execute 'create_db' do
  command 'mysql < /tmp/script.sql'
  action :nothing
end

template '/tmp/script.sql' do
  source 'script.sql.erb'
  not_if { File.exist?('/var/lib/mysql/tracks/db.opt' )}
  notifies :run, 'execute[create_db]', :immediately
end
