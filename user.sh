#!/bin/bash
read -p "Type Your Username [lowercase] : " username

while true; do
  read  -p "Type Your Password: " pass                       echo
  read  -p "Retype Password : " rpass
  echo
  [ "${pass}" = "${rpass}" ] && break ||
  echo "Password doesnt match.Try Again"
  echo ""
done
echo "__-Please remember your non-root username:password-__"
echo
echo "Username: ${username}"
echo
echo "Password:  ${pass}"
echo
echo "From the next time you can log in to your user using :- dname ${username}"
echo
echo "If you want to create another user then run:- sudo bash /etc/user.sh"
echo
useradd -m -s $(which zsh)  ${username}
echo "${username}:${pass}" | chpasswd

echo "${username} ALL=(ALL:ALL) ALL" >> /etc/sudoers

chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

mv user.sh /etc
