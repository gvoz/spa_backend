# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server '35.157.80.187', user: 'deploy', roles: %w{web app db}

set :ssh_options, {
  forward_agent: true,
  auth_methods: ["publickey"],
  keys: ["/home/osboxes/Rails projects/spa_backend/config/provision/keys/DevAWS.pem"]
}
