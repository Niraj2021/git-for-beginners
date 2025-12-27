# Git Commands Reference

A structured and beginner-friendly reference for commonly used Git commands.

---

```bash
Git Commands & Workflow Guide

A comprehensive guide to Git commands, branching, merging, undoing changes, and pushing to remote repositories. Perfect for beginners and as a quick reference.

Table of Contents

1. [Initialize Repository](#1-initialize-repository)
2. [Check Repository Status](#2-check-repository-status)
3. [Add Files to Staging Area](#3-add-files-to-staging-area)
4. [Commit Changes](#4-commit-changes)
5. [View Commit History](#5-view-commit-history)
6. [Branching & Merging](#6-branching--merging)
7. [Merge vs Rebase](#7-merge-vs-rebase)
8. [Undoing Changes](#8-undoing-changes-important)
9. [Push Changes to Remote Repository](#9-push-changes-to-remote-repository-full-workflow)


1. Initialize Repository
git init


Initializes a new Git repository in the current directory.

2. Check Repository Status
git status


Displays the current state of the working directory and staging area.

3. Add Files to Staging Area
git add filename    # Stages a specific file
git add .           # Stages all modified and new files

4. Commit Changes
git commit -m "commit message"


Saves staged changes to the repository history with a descriptive message.

5. View Commit History
git log             # Full commit history
git log --oneline   # Short, single-line format
git log --graph --all  # Visual graph of all branches


Sample Output of git log --graph --all:

*   f3a1c2 (HEAD -> main) Merge branch 'feature'
|\  
| * e4b5a6 (feature) Add login feature
| * c3d4e5 Update UI
* | b2c3d4 Fix bug in main
|/  
* a1b2c3 Initial commit

6. Branching & Merging
Create a Branch
git branch branch-name


Creates a new branch.

Switch to a Branch
git switch branch-name


Switches to the specified branch.

Merge a Branch
git switch main
git merge feature-branch


Diagram: Merge

main:    A---B---C
feature:      D---E
After merge:
main:    A---B---C---M
feature:      D---E
M = merge commit

7. Merge vs Rebase
Merge

Keeps all commits from both branches, creating a merge commit.

git switch main
git merge feature-branch


Diagram: Merge

A---B---C (main)
     \
      D---E (feature)
Merge -> A---B---C---M
                 \
                  D---E

Rebase

Moves feature branch commits on top of another branch, creating a linear history.

git switch feature-branch
git rebase main


Diagram: Rebase

Before rebase:
A---B---C (main)
     \
      D---E (feature)

After rebase:
A---B---C---D'---E' (feature)


D' and E' are rebased commits.

8. Undoing Changes (Important)
8.1 git revert

Purpose: Creates a new commit that undoes the changes of a previous commit.

Safe for shared branches because history is preserved.

git revert <commit-hash>


Example:

Current history: A --- B --- C (main)
Undo commit B: git revert B
After revert:  A --- B --- C --- D
D = new commit that reverses B

8.2 git reset

Purpose: Moves the branch pointer to a previous commit, optionally modifying staged or working changes.

Can be dangerous on shared branches.

Options:

Option	What happens?
--soft	Undo commit, keep changes staged
--mixed	Undo commit, keep changes unstaged
--hard	Undo commit and discard changes ⚠️

Example:

Current history: A --- B --- C (main)


Undo last commit but keep changes staged:

git reset --soft HEAD~1


Result:

A --- B (main)
Changes from C are staged


Undo last commit and discard changes:

git reset --hard HEAD~1


Result:

A --- B (main)
Changes from C are gone


Diagram Comparison:

Before undoing: A --- B --- C (main)

git revert B (safe):
A --- B --- C --- D  (D = revert of B)

git reset --hard B (rewrites history):
A --- B
C is removed

9. Push Changes to Remote Repository (Full Workflow)

This section shows the complete Git workflow from initialization to pushing changes.

# 1. Initialize a new Git repository
git init

# 2. Check repository status
git status

# 3. Add files to staging area
git add filename      # Add a specific file
git add .             # Add all files

# 4. Commit changes with a message
git commit -m "Initial commit"

# 5. Add remote repository
git remote add origin <remote-repo-URL>

# 6. Push changes to remote repository (first time)
git push -u origin main

# 7. Push subsequent changes
git add .
git commit -m "Commit message"
git push


Notes:

<remote-repo-URL>: Replace this with your GitHub repository URL.

git push -u origin main: Sets the upstream branch so future git push commands are simplified.

✅ This README now provides a professional, beginner-friendly Git guide covering initialization, staging, commits, branching, merging, rebase, undoing changes, and pushing to remote repositories.
