rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///srv/fridge_app/shared/tmp/puma/fridge_app-puma.sock"
pidfile "/srv/fridge_app/current/tmp/puma/pid"
state_path "/srv/fridge_app/current/tmp/puma/state"

activate_control_app

