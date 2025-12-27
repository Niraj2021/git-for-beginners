#!/bin/bash

# Git Branch Automation Script
# This script automates creating a new branch in a Git repository.

# ---------------------------------------
# Check if Git is installed
# ---------------------------------------
git --version || {
    echo "Git is not installed. Please install Git first.";
    exit 1;
}

# ---------------------------------------
# Ask the user for the new branch name
# ---------------------------------------
read -p "Enter the new branch name: " branchname

# Validate branch name
if [ -z "$branchname" ]; then
    echo "Error: Branch name cannot be empty."
    exit 1
fi

# ---------------------------------------
# Initialize Git repo if it doesn't exist
# ---------------------------------------
if [ ! -d ".git" ]; then
    echo "Initializing a new Git repository..."
    git init
    touch README.md
    git add README.md
    git commit -m "Initial commit"
fi

# ---------------------------------------
# Switch to main or master branch
# ---------------------------------------
if git show-ref --verify --quiet refs/heads/main; then
    git checkout main
elif git show-ref --verify --quiet refs/heads/master; then
    git checkout master
else
    git checkout -b main
fi

# ---------------------------------------
# Check if branch already exists
# ---------------------------------------
listbranch=$(git branch)

for  b in listbranch ; do

        if [ "$b" == "$branchname" ]; then
                echo "Branch '$branchname' already exists!!"
                branch_exists=1
                break
        fi

done

# Create the branch if it does not exist
if [ -z "$branch_exists" ]; then
    git branch "$branchname"
fi


# ---------------------------------------
# Switch to the new branch
# ---------------------------------------
git checkout "$branchname"

echo -e "\n✅ Successfully switched to branch '$branchname'\n"

# Display branches and status
git branch
echo -e "\nRepository status:"
git status
