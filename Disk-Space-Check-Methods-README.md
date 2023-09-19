## Disk Space Check Methods

Here are several commonly used methods and commands to check disk space usage:

1. `df -h`: Displays the overall disk space usage of file systems, including mounted file systems.
```bash
df -h
```

2. `du -h --max-depth=1 <directory_path>`: Recursively displays the size of subdirectories and files within the specified directory.
```bash
du -h --max-depth=1 <directory_path>
```
Replace `<directory_path>` with the directory path you want to check, such as `/`.

## Cleaning Docker Data (Manual)

When you need to clean Docker data, here is a step-by-step guide:

**/var/lib/docker/overlay2 file too big can use**

**Note: Before performing any cleaning operations, make sure you understand the impact and backup important containers and data.**

1. Stop all running containers:
```bash
docker stop $(docker ps -aq)
```

2. Remove all stopped containers:
```bash
docker rm $(docker ps -aq)
```

3. Remove unused images:
```bash
docker image prune -a
```

4. Remove unused volumes:
```bash
docker volume prune
```

5. Remove unused networks:
```bash
docker network prune
```

6. Restart Docker service:
```bash
sudo systemctl restart docker
```

These steps will clean up stopped containers, unused images, volumes, and networks, and restart the Docker service.

Please note that these commands will permanently delete the associated data and cannot be undone. Make sure you understand what you are deleting and ensure that you no longer need the data and configurations.

If you encounter issues with the `docker system prune` command, you can try manually executing the above steps to clean Docker data.

After performing the cleaning operations, make sure to reassess the requirements for containers and images and recreate or download them as necessary.

## Automation with Cron

To automate the cleanup of Docker data, follow these steps:

1. Create a script file named `docker-cleanup.sh`

2. Save the script file in `/usr/local/bin/docker-cleanup.sh`.

3. Give the script file execute permission:
   ```bash
   chmod +x /usr/local/bin/docker-cleanup.sh
   ```

4. Edit the crontab file using the command:
   ```bash
   crontab -e
   ```

5. Add the following line to the crontab file to schedule the script to run every Monday at 1 AM:
   ```
   0 1 * * 1 /usr/local/bin/docker-cleanup.sh
   ```

6. Save and close the crontab file.
