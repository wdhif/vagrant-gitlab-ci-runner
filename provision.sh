#!/usr/bin/env bash
#
# Provision file for gitlabci-runner
#
# Do not modify, your custom provisioning must go in custom.sh

echo "Gitlab CI Runner configuration..."

echo "Creating gitlab-runner working directory..."
mkdir -p /gitlab-runner

echo "Getting gitlab-ci-multi-runner..."
curl -o /usr/local/bin/gitlab-runner -L http://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/$1/binaries/gitlab-ci-multi-runner-linux-amd64
chmod +x /usr/local/bin/gitlab-runner

echo "Registering the runner with the Vagrantfile data..."
/usr/local/bin/gitlab-runner install --user=root --working-directory=/gitlab-runner
/usr/local/bin/gitlab-runner register --non-interactive --name $2 --url $3 --registration-token $4 --executor shell --tag-list $5
systemctl start gitlab-runner.service
