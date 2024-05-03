#!/bin/bash

# Change to the repository directory
# cd "$repo_dir"

# Check if the directory is a git repository
if [ ! -d .git ]; then
    echo "This is not a Git repository."
    exit 1
fi

echo "Name of the remote repo:\n>"
read remote_repo

# Set the URL of your remote GitHub repository
remote_url="https://github.com/ree-see/$remote_repo.git"

# Check if the remote is set, if not, add it
if ! git remote | grep -q "origin"; then
	gh repo create remote_repo
else
    echo "Remote 'origin' already exists."
	# Add all files to the staging area
	git add .

	# Commit the changes
	echo "Enter commit message:\n>"
	read commit_message
	git commit -m "$commit_message"
fi

# Push the changes to the GitHub repository
git push -u origin main # Change 'master' to your branch name if different

echo "Git push completed."

