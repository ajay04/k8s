FROM redhat/ubi8

RUN dnf -y update && dnf -y install openssh-server sudo
 
COPY sshd_config /etc/ssh/sshd_config
 
# Set environment variables
ENV USR_HOME=/home
 
RUN ssh-keygen -A && \
    mkdir -p /ajaybin/ajay/data/ajay \
&& chmod -R 755 /ajaybin \
&& groupadd -g 1122 sftpuser \
&& for user in sftpuser user1 user2 user3; do \
           useradd -g sftpuser -d "$USR_HOME/$user" "$user" \
            && usermod -p '*' $user \
            && mkdir -p "$USR_HOME/$user/.ssh" \
            && chown -R "$user:sftpuser" "$USR_HOME/$user" \
            && chmod 700 "$USR_HOME/$user/.ssh"; \
    done \
&& chown -R root:sftpuser /ajaybin/ajay/data \
&& chown -R sftpuser:sftpuser /ajaybin/ajay/data/ajay \
&& chmod 770 /ajaybin/ajay/data/ajay

#COPY user1.pub /home/user1/.ssh/authorized_keys
 
# RUN chown user1:sftpuser /home/user1/.ssh/authorized_keys \
# && chmod 600 /home/user1/.ssh/authorized_keys
 
ENTRYPOINT /usr/sbin/sshd -D -e -f /etc/ssh/sshd_config \
           -h /etc/ssh/ssh_host_ed25519_key \
           -h /etc/ssh/ssh_host_rsa_key