#!/bin/bash

# Get the repository name
repository_name=$(basename `git rev-parse --show-toplevel`)

# Get the current branch name
branch_name=$(git rev-parse --abbrev-ref HEAD)

# Get the current timestamp
timestamp=$(date +"%Y_%m_%d_%H_%M")

#archive filename
archive_filename="${repository_name}_${branch_name}_${timestamp}.tar.gz"

#patch filename
tracked_patch_filename="${repository_name}_${branch_name}_${timestamp}_tracked_patch.patch"

# diff tracked files
diff_tracked=$(git diff -p)

# git status info
gitstatus=$(git status)
echo "$diff_tracked" > "$tracked_patch_filename"
echo "$gitstatus" > info.log

#Archive all files, including the patch file, the status info, and the timestamped archive filename
git ls-files -z --cached --others --exclude-standard | xargs -0 tar -cvf "$archive_filename" > /dev/null

tar -rvf "$archive_filename" "$tracked_patch_filename" info.log > /dev/null

#rm patch file and status info
rm "$tracked_patch_filename" info.log

#mv the files to a ~/project_backups_directory
mkdir -p ~/project_backups/

mv $archive_filename ~/project_backups/

git stash > /dev/null

echo -e "\n\033[1;32mStashed and Backup Completed Successfully!\033[0m\n"
echo "Backup Details:"
echo "----------------"
echo "Repository:     $repository_name"
echo "Branch:         $branch_name"
echo "Timestamp:      $timestamp"
echo "Archive File:   $archive_filename"
echo -e "\nYour backup has been created and stored securely in the ~/project_backups/ directory."