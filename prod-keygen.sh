# Use this script to generate a set of keys for production, on production.

# Example: ./prod-keygen.sh Annual-Meeting-Drupal

# Runs a ssh-keygen command in the following format:
# ssh-keygen -t rsa -b 4096 -N '' -C "repo-name+purpose_github-com" -f repo-name+purpose_github-com.key
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please supply the repository name to generate the correct key(s)."
  else
    ssh-keygen -t rsa -b 4096 -N '' -C "$1+prod_github-com" -f ~/.ssh/$1+prod_github-com.key

# Add authentication to normal Github via the PROD key
cat <<EOT >> ~/.ssh/config
Host github.com
  Hostname github.com
  IdentityFile ~/.ssh/$1+prod_github-com.key
  IdentitiesOnly yes
EOT
chmod 600 ~/.ssh/config

# Add the token for gfs-maintenance to the .bash_profile
# This is necessary for private submodules to also be able to be cloned.
cat <<EOT >> ~/.bash_profile
export GITHUB_TOKEN=<FIND IN LASTPASS>
EOT

    echo ""
    echo "------------------------------------------"
    echo "PROD KEY - FURTHER INSTRUCTIONS:"
    echo "------------------------------------------"
    echo "1. As a privileged GFS user, navigate to https://github.com/gfs-web-marketing/$1/settings/collaboration"
    echo "2. Under 'Collaborators', add the gfs-maintenance user READ ONLY if not already."
    echo "3. Re-login as gfs-maintenance. Navigate to https://github.com/settings/keys and enter the following key as '$1 PROD':"
    echo ""
    cat ~/.ssh/$1+prod_github-com.key.pub
    echo ""
    echo "4. Click 'Add SSH key'"
    echo "5. The public key is now added to gfs-maintenance"
    echo "------------------------------------------"
    echo "SET UP GITHUB TOKEN:"
    echo "------------------------------------------"
    echo "Fill out the GITHUB_TOKEN in ~/.bash_profile for user gfs-maintenance from Lastpass."
    echo ""

fi
