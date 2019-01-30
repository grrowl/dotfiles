type docker &>/dev/null
if [ $? -eq 0 ]; then
  alias dbundle="docker-compose exec api bundle"
  alias drspec="docker-compose exec -e RAILS_ENV=test api rspec"
  alias dredisflush="docker-compose exec redis redis-cli FLUSHALL"

  alias drails="docker-compose exec api rails"
  alias dtestrails="docker-compose exec -e RAILS_ENV=test api rails"

  alias dreset="drails db:create db:setup db:migrate data:migrate"
  alias dtestreset="drailstest db:create db:setup"
  alias dmigrate="drails db:migrate data:migrate"

  alias pryapi="docker attach $(docker ps -q --filter Name=apiactivepipecom_api_1)"
  alias pryprefs="docker attach $(docker ps -q --filter Name=apiactivepipecom_prefs_1)"
  alias prysidekiq="docker attach $(docker ps -q --filter Name=apiactivepipecom_sidekiq_1)"

  alias dall="docker ps -aq"
  alias diall="docker images -q"
fi
