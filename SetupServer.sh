sudo apt update
sudo apt upgrade
sudo apt install git
sudo apt install htop rsync ufw
# now you the stuff that sucre your meachin

read -p "Enter yor PGP to enter fast and securly  (copy and past it ) :" PGP

sudo echo "$PGP" >> ~/.ssh/authorized_keys
#some if statment ;
securty(){
        if grep '^#PermitRootLogin ' /etc/ssh/sshd_config ; then
        echo "PermitRootLogin yes " >> /etc/ssh/sshd_config

        else
                echo "PermitRootLogin yes " >> /etc/ssh/sshd_config

        fi


        if grep '^#PasswordAuthentication yes' /etc/ssh/sshd_config ; then
                echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

        else
                echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

        fi



}

# sitting ssh main configeration for color other things 

ssh_conf(){

echo " export LS_OPTIONS='--color=auto'
 eval "$(dircolors)"
 alias ls='ls $LS_OPTIONS'
 alias ll='ls $LS_OPTIONS -l'
 alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
 alias rm='rm -i'
 alias cp='cp -i'
 alias mv='mv -i'
 PS1='${debian_chroot:+($debian_chroot)}\h:\w\$' "  >> ~/.bashrc



}

systemctl reload sshd
securty
ssh_conf
