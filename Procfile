release: bundle exec rails db:migrate
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -t 25 -q default -q mailers -q ahoy