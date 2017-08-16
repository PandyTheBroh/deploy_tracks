default['system']['packages'] = %w{
ruby-dev build-essential ssh
}

default['mysql']['packages'] = %w{
mysql-server libmysqlclient-dev libdbd-mysql-ruby
}

default['nginx']['packages'] = %w{
nginx
}

default['tracks']['gems'] = %w{
bundler god
}
