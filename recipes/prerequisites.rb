node['system']['packages'].each do |pkg|
  package pkg
end

node['mysql']['packages'].each do |pkg|
  package pkg
end
