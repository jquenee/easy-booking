# easy-booking
Simple booking solution with Ruby on Rails.
This calendar principle is to organize online booking for a place managed by a group of contact.
Those contacts access to this website by a single password. A contact can book for his friend or himself a room.
Contacts list is pre-fixed by setting. When a booking is recorded an email a sent to all contacts.

# INSTALLATION GUIDE

## From scratch installation
* Install ruby on rails: http://rubyonrails.org/download/
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
iptables -L -v -n
iptables-save
```
* Update website setting: config/initializers/agenda.rb
* Update contacts list: db/seeds.rb
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
rails s -b 192.168.0.66 -e production
```

## Update contact list (after installation)
* Update contacts list: db/seeds.rb
* Run database update
```
rake db:seed
```
