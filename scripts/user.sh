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
echo "Choose Shell" ch-sh
echo
echo '1. Bash (default)'
echo '2. Zsh'
echo
read -p 'Choose Option: ' ch-sh
if [[ ${ch-sh} == '1' ]];then
  sleep .5
  useradd -m -s /usr/bin/bash  ${username}
  #cp /root/.bashrc ~/.bashrc
  echo "${username}:${pass}" | chpasswd
  touch /home/${username}/.hushlogin
  echo "${username} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
  chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo
  #echo "if [[ $(cat /etc/sudoers | grep ${username}) = '' ]];then echo '${username} ALL=(ALL:ALL) ALL' >> /etc/sudoers;fi" >> /home/$username/.bashrc
  mv user.sh /etc
elif [[ ${ch-sh} == '2' ]];then
  sleep .5
  useradd -m -s /usr/bin/zsh  ${username}
  #cp /root/.bashrc ~/.bashrc
  echo "${username}:${pass}" | chpasswd
  touch /home/${username}/.hushlogin
  echo "${username} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
  chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo
  #echo "if [[ $(cat /etc/sudoers | grep ${username}) = '' ]];then echo '${username} ALL=(ALL:ALL) ALL' >> /etc/sudoers;fi" >> /home/$username/.bashrc
  mv user.sh /etc
else 
  sleep .5
  useradd -m -s /usr/bin/bash  ${username}
  #cp /root/.bashrc ~/.bashrc
  echo "${username}:${pass}" | chpasswd
  touch /home/${username}/.hushlogin
  echo "${username} ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
  chown root:root /usr/bin/sudo && chmod 4755 /usr/bin/sudo
  #echo "if [[ $(cat /etc/sudoers | grep ${username}) = '' ]];then echo '${username} ALL=(ALL:ALL) ALL' >> /etc/sudoers;fi" >> /home/$username/.bashrc
  mv user.sh /etc
fi
