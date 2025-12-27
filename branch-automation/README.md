# Git Branch Automation Script

A simple **Bash script** to automate creating new Git branches.  
This script is perfect for beginners who want to manage branches quickly without typing multiple Git commands.

---

## Features

- Checks if Git is installed before running.  
- Prompts the user for a branch name and validates input.  
- Initializes a Git repository if it doesn’t exist.  
- Supports both `main` and `master` default branches.  
- Checks if the branch already exists before creating it.  
- Switches to the newly created branch automatically.  
- Displays all branches and the repository status after creation.  

---

## Folder Structure
branch-automate/

├── create_branch.sh

└── README.md

Code Explanation

This Bash script automates Git branch creation, including repository initialization, branch validation, and switching to the new branch.
1. Check if Git is Installed

        git --version || {
            echo "Git is not installed. Please install Git first.";
            exit 1;
        }


# Explanation:

Checks if Git is installed on the system.

git --version prints the installed Git version.

|| means “or”: if Git is not installed, the script prints an error message and exits.

# 2. Prompt User for Branch Name
    read -p "Enter the new branch name: " branchname

    if [ -z "$branchname" ]; then
        echo "Error: Branch name cannot be empty."
        exit 1
    fi

# Explanation:

read -p asks the user to enter a branch name.

[ -z "$branchname" ] checks if the input is empty.

Exits the script if the branch name is empty.

# 3. Initialize Git Repository if Needed
    if [ ! -d ".git" ]; then
        echo "Initializing a new Git repository..."
        git init
        touch README.md
        git add README.md
        git commit -m "Initial commit"
    fi

# Explanation:

Checks if the .git folder exists.

If not, initializes a new Git repository.

Creates a README.md, adds it to Git, and commits it as the initial commit.

4. Switch to Default Branch (main or master)
   
        if git show-ref --verify --quiet refs/heads/main; then
            git checkout main
        elif git show-ref --verify --quiet refs/heads/master; then
            git checkout master
        else
            git checkout -b main
        fi
# Explanation:

Tries to switch to the main branch first.

If main doesn’t exist, tries master.

If neither exists, creates a new branch called main.

# 5. Check if Branch Already Exists
    listbranch=$(git branch)
    
    for b in $listbranch ; do
        if [ "$b" == "$branchname" ]; then
            echo "Branch '$branchname' already exists!!"
            branch_exists=1
            break
        fi
    done
# Explanation:

Retrieves a list of all existing branches.

Loops through each branch to see if the entered branch name already exists.

Prints a warning and sets a flag if the branch exists.

# 6. Create the Branch if It Does Not Exist
    if [ -z "$branch_exists" ]; then
        git branch "$branchname"
    fi

# Explanation:

Checks the flag branch_exists.

Creates the branch only if it does not already exist.

# 7. Switch to the New Branch
    git checkout "$branchname"
  
    echo -e "\n✅ Successfully switched to branch '$branchname'\n"
        

# Explanation:

Switches to the newly created branch.

Prints a confirmation message.

# 8. Display All Branches and Repository Status
    git branch
    echo -e "\nRepository status:"
    git status

# Explanation:

git branch lists all branches in the repository.

git status shows the current state of the working directory and staging area.
---
# Sample Output
# 1. Git is not installed
    $ ./create_branch.sh
    Git is not installed. Please install Git first.


# 2. When the user enters an empty branch name
    $ ./create_branch.sh
    Enter the new branch name: 
    Error: Branch name cannot be empty.
# Explanation:

The script checks if the input is empty.

If the branch name is empty, it prints an error and exits.


# 3. When the user enters a valid branch name
    $ ./create_branch.sh
    Enter the new branch name: feature-login

    ✅ Successfully switched to branch 'feature-login'
    
    * main
      feature-login
    
    Repository status:
    On branch feature-login
    nothing to commit, working tree clean

# Explanation:

The script creates the new branch if it does not exist.

Automatically switches to the new branch.

Shows all branches and the current repository status.

