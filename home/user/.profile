#
# ~/.profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -e /home/shdzzl/.nix-profile/etc/profile.d/nix.sh ]; then . /home/shdzzl/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# start emacs servers
emacs-daemons