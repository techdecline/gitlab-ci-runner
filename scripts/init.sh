# All actions based on https://docs.gitlab.com/runner/install/linux-repository.html
# Installs GitLab Runner on Debian
export registration_token=${REGISTRATION_TOKEN}
export gitlab_url=${GITLAB_URL}

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