type docker &>/dev/null
if [ $? -eq 0 ]; then
  alias dredisflush="docker-compose exec redis redis-cli FLUSHALL"
  alias dnewmigration="docker-compose exec web bundle exec rails generate migration"
  alias dmigrate="docker-compose exec web bundle exec rake db:migrate"
  alias drollback="docker-compose exec web bundle exec rake db:rollback"
  alias dtestmigrate="docker-compose exec -e RAILS_ENV=test web bundle exec rake db:migrate"
  alias dbundle="docker-compose exec web bundle"
  alias dbi="docker-compose exec web bundle install"
  alias drspec="docker-compose exec -e RAILS_ENV=test web bundle exec rspec"
  alias dconsole="docker-compose exec web bundle exec rails c"
  alias dsidekiq="docker-compose restart sidekiq"
  alias dreset="docker-compose exec web bundle exec rake db:reset"
  alias dtestreset="docker-compose exec -e RAILS_ENV=test web bundle exec rake db:reset"
  alias dupdate="dbi && dreset && dtestreset && dredisflush && dsidekiq"
  alias dswap="sed -i '' \"s/gem 'ap_shared'.*/gem 'ap_shared', path: '\.\.\/ap_shared'/\" Gemfile && dbi"
  alias pryweb="docker attach $(docker ps -q --filter Name=apiactivepipecom_web_1)"
  alias pryprefs="docker attach $(docker ps -q --filter Name=apiactivepipecom_prefs_1)"
  alias prysidekiq="docker attach $(docker ps -q --filter Name=apiactivepipecom_sidekiq_1)"

  alias dall="docker ps -aq"
  alias diall="docker images -q"
fi
