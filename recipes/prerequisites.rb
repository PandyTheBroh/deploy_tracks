node['system']['packages'].each do |pkg|
  package pkg
end

node['mysql']['packages'].each do |pkg|
  package pkg
end

node['tracks']['gems'].each do |gem|
  gem_package gem
end

node['nginx']['packages'].each do |pkg|
  package pkg
end

