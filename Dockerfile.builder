FROM ganyao114/winemu-rootfs:latest

# Fix locale to avoid warnings:
ENV LANG en_US.UTF-8
# Switch User
USER builder:builder

# We expect this to be mounted with '-v $PWD:/home/builder/termux-packages':
WORKDIR /home/builder/winemu-build