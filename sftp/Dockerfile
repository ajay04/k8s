FROM redhat/ubi8

# Install OpenSSH server
RUN dnf install -y openssh-server && \
    dnf clean all

# Create a non-root user for SSH
RUN useradd -m ajay && \
    echo "ajay:akumawat" | chpasswd

# Create directories and copy SSH configuration
RUN mkdir -p /home/ajay/etc /home/ajay/var/run
    # cp /etc/ssh/sshd_config /home/ajay/etc/ && \


# Create privilege separation directory
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ""
RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ""



COPY sshd_config /home/ajay/etc/
RUN chown -R ajay:ajay /home/ajay/etc /home/ajay/var/run
USER ajay
# Set up custom SSH configuration
# RUN sed -i 's/#Port 22/Port 2022/' /home/ajay/etc/sshd_config && \
#     sed -i 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/home\/ajay\/etc\/ssh_host_rsa_key/' /home/ajay/etc/sshd_config && \
#     sed -i 's/#UsePrivilegeSeparation yes/UsePrivilegeSeparation no/' /home/ajay/etc/sshd_config && \
#     sed -i 's/#PidFile \/var\/run\/sshd.pid/PidFile \/home\/ajay\/var\/run\/sshd.pid/' /home/ajay/etc/sshd_config

# Generate SSH host keys (within USER ajay context)
RUN ssh-keygen -t rsa -f /home/ajay/etc/ssh_host_rsa_key -N '' && \
    ssh-keygen -t ecdsa -f /home/ajay/etc/ssh_host_ecdsa_key -N '' && \
    ssh-keygen -t ed25519 -f /home/ajay/etc/ssh_host_ed25519_key -N ''

# Expose custom SSH port
EXPOSE 2022

# Start the SSH server
CMD ["/usr/sbin/sshd", "-f", "/home/ajay/etc/sshd_config", "-D"]
