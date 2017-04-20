#
# Gitlab CI Runner
#
# Gitlab Runner in a vagrant box for the docker-builder project
# Server logs are in /var/log/messages
#
# Maintainer: Wassim DHIF <wassimdhif@gmail.com>

Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.3"
  runner_version = "RUNNER_VERSION"
  name = "RUNNER_NAME"
  runner_url = "RUNNER_URL"
  runner_tags = "RUNNER_TAG_2,RUNNER_TAG_1"
  runner_token = "RUNNER_TOKEN"
  # Custom config files
  config.vm.provision :shell, path: "custom.sh"
  # Gitlab CI Runner configuration
  config.vm.provision :shell, path: "provision.sh", args: [runner_version, name, runner_url, runner_token, runner_tags]
end
