 #!/bin/bash
bundle exec rails db:exists &&rails db:migrate && rails db:seed || rails db:create && rails db:migrate && rails db:seed

rm /app/tmp/pids/server.pid

puma -C config/puma.rb