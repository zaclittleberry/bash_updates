# bash_updates
A script that will run semantically versioned bash files since the previous
current version. Meant for version controlling and automating version specific
post deployment commands.

Put semantically versioned files in the scripts directory in the format x.y.z.sh
(xx.yy.zz.sh, x.yy.zzz.sh, etc should work as well).

When run_update.sh is executed, it will then check the current_version from
current_update.sh and run all scripts after the current version.

Stores the most recent file run back into the current_version variable.
