# Website settings
Myapp::Application.config.x.website_url = "0.0.0.0:3000/"
Myapp::Application.config.x.name = "Change Me"
Myapp::Application.config.x.password = "password"
Myapp::Application.config.x.maxroom = 15
Myapp::Application.config.x.full_price = 12
Myapp::Application.config.x.reduced_price = 5

# Email settings
Myapp::Application.config.x.email_smtp_domain = "gmail.com"
Myapp::Application.config.x.email_smtp_ip = "smtp.gmail.com"
Myapp::Application.config.x.email_smtp_port = 587
Myapp::Application.config.x.email_smtp_ttls = true
# value :login, :plain or :cram_md5
Myapp::Application.config.x.email_authtype = :login
Myapp::Application.config.x.email_smtp_login = ""
Myapp::Application.config.x.email_smtp_password = ""
Myapp::Application.config.x.email_debug = false
