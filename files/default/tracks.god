God.watch do |w|
  w.dir = '/var/lib/tracks-2.3.0'
  w.name = "tracks"
  w.start = "bundle exec rails server -e production -d"
  w.keepalive
end
