FROM ubuntu:22.04

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user for SSH
RUN useradd -m ajay && \
    echo "ajay:akumawat" | chpasswd

# Create directories and copy SSH configuration
RUN mkdir -p /home/ajay/etc /home/ajay/var/run && \
    cp /etc/ssh/sshd_config /home/ajay/etc/ && \
    chown -R ajay:ajay /home/ajay/etc /home/ajay/var/run

# Create privilege separation directory
RUN mkdir -p /var/run/sshd

# Set up custom SSH configuration
RUN sed -i 's/#Port 22/Port 2022/' /home/ajay/etc/sshd_config && \
    sed -i 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/home\/ajay\/etc\/ssh_host_rsa_key/' /home/ajay/etc/sshd_config && \
    sed -i 's/#UsePrivilegeSeparation yes/UsePrivilegeSeparation no/' /home/ajay/etc/sshd_config && \
    sed -i 's/#PidFile \/var\/run\/sshd.pid/PidFile \/home\/ajay\/var\/run\/sshd.pid/' /home/ajay/etc/sshd_config

# Generate SSH host key
RUN ssh-keygen -t rsa -f /home/ajay/etc/ssh_host_rsa_key -N ''

# Expose custom SSH port
EXPOSE 2022

# Start the SSH server
CMD ["/usr/sbin/sshd", "-f", "/home/ajay/etc/sshd_config", "-D"]
