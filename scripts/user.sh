#!/bin/bash
read -p "Type Your Username [lowercase] : " username

while true; do
  echo
  read  -p "Type Your Password: " pass                      
  echo
  read  -p "Retype Password : " rpass
  echo
  [ "${pass}" = "${rpass}" ] && break ||
  echo "Password doesnt match.Try Again"
  echo ""
done
echo "From next time you can login to this user with:- distro ${username} "
echo
echo "If you want to create another user then run:- sudo  bash /etc/user.sh"
echo
echo "Username: ${username}"
echo
sleep .5
echo "Password:  ${pass}"
echo
sleep .5
useradd -m -s /usr/bin/bash  ${username}
cp /root/.bashrc ~/.bashrc
echo "${username}:${pass}" | chpasswd
touch /home/${username}/.hushlogin

echo "${username} ALL=(ALL:ALL) ALL" >> /etc/sudoers

chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo

mv user.sh /etc
