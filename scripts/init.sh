# All actions based on https://docs.gitlab.com/runner/install/linux-repository.html
# Installs GitLab Runner on Debian
export registration_token=${REGISTRATION_TOKEN}
export gitlab_url=${GITLAB_URL}

# Install Docker (https://docs.docker.com/engine/install/debian/)
apt-get update
apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io

# Add Repository
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

# Install GitLab Runner
apt-get -y install gitlab-runner

# Register
gitlab-runner register \
  --non-interactive \
  --url "$gitlab_url" \
  --registration-token "$registration_token" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner" \
  --tag-list "docker,azure" \
  --run-untagged="true" \
  --locked="false" \
  --access-level="not_protected"