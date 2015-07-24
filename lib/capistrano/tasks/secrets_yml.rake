require 'securerandom'

remote_file 'config/secrets.yml' => '/tmp/secrets.yml', :roles => :app

file '/tmp/secrets.yml' do |t|
  secrets = {
    "production" => {
      "secret_key_base" => SecureRandom.hex(64)
    }
  }
  IO.write(t.name, secrets.to_yaml)
end

desc 'Generate secrets.yml'
task :create_secrets => 'config/secrets.yml'

before :deploy, 'create_secrets'
