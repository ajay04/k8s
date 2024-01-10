FROM redhat/ubi8

# Install OpenSSH server
RUN dnf install -y openssh-server && \
    dnf clean all

# Create a non-root user for SSH
RUN useradd -m ajay && \
    echo "ajay:akumawat" | chpasswd

# USER ajay

COPY --chown=ajay id_rsa.pub /home/ajay/.ssh/authorized_keys
RUN ssh-keygen -A
# Expose custom SSH port
EXPOSE 2022

# Start the SSH server
# CMD ["/usr/sbin/sshd", "-f", "/home/ajay/etc/sshd_config", "-D"]
CMD ["/usr/sbin/sshd", "-D"]
