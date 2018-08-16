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


###############################
###  Documentation
###############################
{

#
#      Installer consist of:
#      1. Setup environment
#      2. Main constants
#      3. CLI control constants
#      4. CLI output functions
#      5. Program stage functions
#      6. Main function
#      7. Invocation of the main function (aka "Start of the script")
#
#

# Special things about this script
#
# 1) Script tries to be fully POSIX compatible,
# code heavy follows that requirement.
#
# 2) Notice, Warning, Error, ErrorRevert level massages have a special
# functions. That is done to be:
#   * uniformal in output
#   * proper color highlihtgting
#   * proper message classification
#   * informative for the user
#   * convinient for use in the code
#   * code readability
#   * less function invocations
#   * to have an extendable and editable output system in a shell script
# all at the same time.
#
# Message body starts from a new line.
# And has 4 spaces from the left. Always.
#
# Code example:
###############################
#
#        notice "
#
#    Install executed for ROOT.
#
#    Doing classic Linux package manager mode.
#    In Nix this mode is called: single-user mode for root.
#
#    Nix can do multi-user mode, and manage package trees for users
#    independently.
#    "
#
###############################
#
# This is the best balance of code simplicity and code readability found so far.
#
# Output of the example (in a green color):
###############################
#
#./install: Notice:
#
#    Install executed for ROOT.
#
#    Doing classic Linux package manager mode.
#    In Nix this mode is called: single-user mode for root.
#
#    Nix can do multi-user mode, and manage package trees for users
#    independently.
#
###############################
#
true # so {...} body has some code, shell will not permit otherwise

}


###############################
###  Setup environment
###############################
{

# Set the character collating sequence to be numeric ASCII/C standard.
readonly LC_COLLATE=C
# Set the character set to be the standard one-byte ASCII.
readonly LANG=C
# Set default umask; to be non-restrictive and friendly to others.
# umask obviously can heavy influence Nix work, and functioning of packages.
umask 022

}


###############################
###  Main constants
###############################
{

# NOTE: If you are changing the destanation from `/nix` to something other -
# please read the link:
# https://nixos.org/nixos/nix-pills/install-on-your-running-system.html#idm140737316619344
# TL;DR: Destination path change - changes the package hashes.
# Nix relies on hashes to determine packages.
# Local hashes & the central binary cache repository hashes not going to match.
# That mean that Nix going to compile packages from sources.
readonly dest='/nix'
readonly self="$(dirname "$(realpath "$0")")"
readonly nix="@nix@"
readonly cacert="@cacert@"
readonly appname="$0"

}
