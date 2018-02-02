export CHARSET=UTF-8
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PAGER=less
#export PS1='\u@\h:\w\$ '
export PS1="\[\e[34m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\\$ "
umask 022

for script in /etc/profile.d/*.sh ; do
        if [ -r $script ] ; then
                . $script
        fi
done
