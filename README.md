# Environment SSH Key Generators
### Connecting to Source Control

This set of scripts will allow you to setup your deployment keys for both staging and production environments. It does the following:

- Properly configure ~/.ssh/config for remote Github deployment.
- Names and sets up SSH keys, the only thing you provide is the repository name.
- Creates deployment keys for staging and prod environments.
- In staging, creates both a maintenance and deploy key.
- Provides further instructions in staging for maintenance user setup.

## Usage

Use the `staging-keygen.sh` file on the staging environment to generate an appropriate key for the maintenance and deployment tasks. Example: `./staging-keygen.sh My-Repo-Name`

Use the `prod-keygen.sh` file on the production environment to generate an appropriate key for the deployment task. Example: `./prod-keygen.sh My-Repo-Name`

## Resources

- Pairs well with the [Automatic Drupal Updater](https://github.com/gfs-web-marketing/Automatic-Drupal-Updater), which includes a copy of this script for staging.
- See [GFS Confluence Documentation for connecting to source control](https://confluence.gfs.com/confluence/display/CORPISMARTECH/Connecting+to+source+control) for the full process.

## Manual Steps

- Adding keys to documentation sources (Lastpass, Drive)
- Adding the public keys to Github, instructions provided when script runs