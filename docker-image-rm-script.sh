#!/bin/bash

# Read the repository names from a file (one repository per line)
repositories_file="/usr/local/bin/repositories.txt"
repositories=()
while IFS= read -r line; do
    repositories+=("$line")
done < "$repositories_file"

# Function to remove all images except the latest one for a given repository
remove_images_except_latest() {
  repository=$1

  # Get a list of images for the repository
  images=$(docker image ls --format "{{.ID}} {{.CreatedAt}}" --filter "reference=${repository}")

  # Sort the images by creation date in descending order
  sorted_images=$(echo "$images" | sort -rk 2)

  # Keep the latest image
  latest_image=$(echo "$sorted_images" | head -n 1 | awk '{print $1}')

  # Loop through the images (excluding the latest) and remove them
  for image in $sorted_images
  do
    image_id=$(echo "$image" | awk '{print $1}')
    if [[ $image_id != $latest_image ]]; then
        docker image rm "$image_id"
    fi
  done
}

# Iterate over the repositories and call the removal function
for repository in "${repositories[@]}"
do
  remove_images_except_latest "$repository"
done
