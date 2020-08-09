# api_exemplo
Criação de uma api para um bloq pessoal

# modelo da base de dados
https://dbdiagram.io/d/5f2fecc008c7880b65c59975

# ficheiro de connexao com banco de dados POSTGRESQL

/config/database.yml

default: &default
  adapter: postgresql
  encoding: unicode
  username: usuario da tua base de dados
  password: password da tua base de dados
  # For details on connection pooling, see Rails configuration guide
  # https://guides.rubyonrails.org/configuring.html#database-pooling
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: api_exemplo_development

test:
  <<: *default
  database: api_exemplo_test

production:
  <<: *default
  database: api_exemplo_production
  username: api_exemplo
  password: <%= ENV['API_EXEMPLO_DATABASE_PASSWORD'] %>
