#!/bin/sh























if [ -z "$_NIX_INSTALLER_TEST" ]; then
    $nix/bin/nix-channel --update nixpkgs
fi

added=
if [ -z "$NIX_INSTALLER_NO_MODIFY_PROFILE" ]; then

    # Make the shell source nix.sh during login.
    p=$HOME/.nix-profile/etc/profile.d/nix.sh

    for i in .bash_profile .bash_login .profile; do
        fn="$HOME/$i"
        if [ -w "$fn" ]; then
            if ! grep -q "$p" "$fn"; then
                echo "modifying $fn..." >&2
                echo "if [ -e $p ]; then . $p; fi # added by Nix installer" >> "$fn"
            fi
            added=1
            break
        fi
    done

fi

if [ -z "$added" ]; then
    cat >&2 <<EOF

Installation finished!  To ensure that the necessary environment
variables are set, please add the line

  . $p

to your shell profile (e.g. ~/.profile).
EOF
else
    cat >&2 <<EOF

Installation finished!  To ensure that the necessary environment
variables are set, either log in again, or type

  . $p

in your shell.
EOF
fi
