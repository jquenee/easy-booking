# easy-booking
Simple booking solution with Ruby on Rails.
This calendar principle is to organize online booking managed by a group of contacts.
Those contacts access to this website by a single password. A contact can book for his friend or himself a room.
Contacts list is pre-fixed by setting. When a booking is recorded, an email is sent to all contacts.

# INSTALLATION GUIDE

## From scratch installation
* Install ruby on rails: http://rubyonrails.org/ and dep
```
sudo apt-get install ruby ruby-dev zlib1g-dev libsqlite3-dev g++
```
* Install nodejs
```
sudo apt-get install nodejs
```
* Install basic gem
```
gem install bundler
```
* Download solution
```
git clone https://github.com/jquenee/easy-booking.git
```
* Redirect incoming request from 80 to 3000 (example)
```
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000
sudo iptables -t nat -I OUTPUT -p tcp -d 192.168.0.66 --dport 80 -j REDIRECT --to-ports 3000
iptables -t nat -L -n
iptables-save
```
* Update website setting: config/initializers/agenda.rb
* Update contacts list: db/seeds.rb
* Update "mode d'emploi": public/mode-emploi.pdf
* Download gems dependencies
```
bundle install --path vendor/bundle
```
* Set secret key
```
rake secret
```
config/secrets.yml
```
production:
  secret_key_base: 17134...6a01a8d
```
* Setup database (Warning this command will reset all data)
```
rake db:setup RAILS_ENV=production
```
* Run server (example)
```
bundle exec rails s -d -b 192.168.0.66 -e production
```

## Upgrade procedure
* Backup settings and database
```
db/production.sqlite3
config/initializers/agenda.rb
public/mode-emploi.pdf
```
* Dump database in SQL file
```
$ sqlite3 db/production.sqlite3
.output production.sql
.dump
.exit
```
* Refactore manually SQL file according db change
```
vim production.sql
```
* Stop the server
```
kill -9 `cat tmp/pids/server.pid`
```
* Remove the existing database
```
rm db/production.sqlite3
```
* Reinit from scratch the db with the seeds.rb according the change
```
rake db:setup RAILS_ENV=production
```
* Import SQL file
```
sqlite3 db/production.sqlite3 < db/production.sql
```
* Start the server
```
bundle exec rails s -d -b 192.168.0.66 -e production
```
