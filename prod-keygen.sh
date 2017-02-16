# Use this script to generate a set of keys for production, on production.

# Example: ./prod-keygen.sh Annual-Meeting-Drupal

# Runs a ssh-keygen command in the following format:
# ssh-keygen -t rsa -b 4096 -N '' -C "repo-name+purpose_github-com" -f repo-name+purpose_github-com.key
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please supply the repository name to generate the correct key(s)."
  else
    ssh-keygen -t rsa -b 4096 -N '' -C "$1+prod_github-com" -f ~/.ssh/$1+prod_github-com.key

cat <<EOT >> ~/.ssh/config
Host github.com
  Hostname github.com
  IdentityFile ~/.ssh/$1+prod-deployment_github-com.key
  IdentitiesOnly yes
EOT

fi
