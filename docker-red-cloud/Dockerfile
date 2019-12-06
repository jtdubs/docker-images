FROM red:latest
USER root

# Update sshd
RUN sed -ri 's/^#PubkeyAuthentication.*$/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#PermitRootLogin.*$/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -ri 's/^ChallengeResponseAuthentication.*$/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config && \
    sed -ri 's/^UsePAM yes.*$/#UsePam yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#PasswordAuthentication.*$/PasswordAuthentication no/' /etc/ssh/sshd_config

# Create necessary sshd dirs
RUN mkdir /run/sshd

# Update ~/.ssh
USER user
RUN mkdir /home/user/.ssh
COPY ssh/* /home/user/.ssh/

# Start sshd
USER root
CMD ["/usr/sbin/sshd", "-D", "-E", "/var/log/sshd.log"]
