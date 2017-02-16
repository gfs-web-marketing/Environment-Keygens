# Environment SSH Key Generators

This set of scripts will allow you to setup your deployment keys for both staging and production environments. It does the following:

- Properly configure ~/.ssh/config for remote Github deployment.
- Names and sets up SSH keys, the only thing you provide is the repository name.
- Creates deployment keys for staging and prod environments.
- In staging, creates both a maintenance and deploy key.
- Provides further instructions in staging for maintenance user setup.

See [GFS Confluence Documentation](https://confluence.gfs.com/confluence/display/CORPISMARTECH/Connecting+to+source+control) for the full process.

## Usage

Use the `helpers/staging-keygen.sh` file on the staging environment to generate an appropriate key for the maintenance and deployment tasks. Example: `./staging-keygen.sh My-Repo-Name`

Use the `helpers/prod-keygen.sh` file on the production environment to generate an appropriate key for the deployment task. Example: `./prod-keygen.sh My-Repo-Name`

## Resources

Pairs well with the [Automatic Drupal Updater](https://github.com/gfs-web-marketing/Automatic-Drupal-Updater), which includes a copy of this script for staging.