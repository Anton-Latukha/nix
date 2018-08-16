#!/bin/sh
## NOTE: If you would decide to change shebang to `/usr/bin/env sh`
## - investigate the question more to be really sure,
## as `/usr/bin/env sh` usage is less portable then `/bin/sh`,
## at least - using env is much less secure.

###############################
###  Main information
###############################
{

#
# Nix installation script
# Shell script for POSIX-comapible environments
#
###############################
#
# Upstream URL:
# https://github.com/NixOS/nix/blob/master/scripts/install-nix-from-closure.sh
#
# Currently script follows POSIX.1-2017 (POSIX is simultaneously the
# IEEE Std 1003.1™-2017 and the
# The Open Group Technical Standard Base Specifications, Issue 7)
# POSIX standard is accessible at:
# http://pubs.opengroup.org/onlinepubs/9699919799
#
# Script strives to be fully transactional, as much as shell script can be.
# That means that only after all required checks script starts to do changes.
# And if script not succeeds in some action - it catches the error and
# rolls back, if that is possible with a shell script.
#
# If you foud a way to improve the script - let us know.
#
#
# Additional notes:
# `/bin/sh -u` is not possible to do, because many Docker environments
# have unset USER variable.
#
true # so {...} body has some code, shell will not permit otherwise

}
