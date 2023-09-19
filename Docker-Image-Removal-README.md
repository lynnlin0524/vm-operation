# Docker Image Removal Script

This script automates the removal of Docker images, keeping only the latest image for each repository. It reads the repository names from a file and removes all images except the latest one for each repository.

## Prerequisites

- Docker installed on your system
- Bash shell

## Setup

1. Move the `docker-image-rm-script.sh` script and `repositories.txt` file to the `/usr/local/bin` directory.

   ```bash
   cd /usr/local/bin
   vi docker-image-rm-script.sh
   vi repositories.txt
   chmod +x docker-image-rm-script.sh

2. Edit the repositories.txt file and add the names of the repositories you want to process, with each repository on a separate line.

3. Make sure both the script and the repositories file have executable permissions.

## Usage
To manually remove Docker images, execute the script:
./docker-image-rm-script.sh

The script will process the repositories listed in the repositories.txt file, removing all images except the latest one for each repository.

## Automation with Cron
To automate the script to run once a day, you can set up a cron job.
1. Open the crontab editor:
   ```bash
   crontab -e

2.  Add the following line to the crontab file to schedule the script to run at midnight every day:
   12 0 * * * /usr/local/bin/docker-image-rm-script.sh

The cron job will now execute the script once a day, removing all images except the latest one for each repository.

Important Note: Exercise caution when removing Docker images, as they cannot be recovered once deleted. Ensure that the script and repositories are configured correctly before scheduling the cron job.
