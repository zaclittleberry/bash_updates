# bash_updates
A script that will run semantically versioned bash files since the previous
current version. Meant for version controlling and automating version specific
post deployment commands.



When run_update.sh is executed, it will then check the current_version from
current_update.sh and run all scripts after the current version.

Stores the most recent file run back into the current_version variable.

## Setup
- Place the bash_updates directory in your main repo. You may want to remove the .git directory from it and just integrate it as a part of your primary repo. Make sure to replicate the .gitignore rules.
- cp current_update.example.sh current_update.sh
- cp history.example.txt history.txt
- Add semantically versioned files in the scripts directory in the format x.y.z.sh. (xx.yy.zz.sh, x.yy.zzz.sh, etc should work as well).
- Add run_updates.sh to your deployment process and it will kick off your versioned script files.
