FROM ganyao114/winemu-rootfs:latest

# Fix locale to avoid warnings:
ENV LANG en_US.UTF-8
# Setup needed packages
RUN apt-get update && \
	apt-get -yq upgrade && \
	apt-get install -yq sudo cmake git build-essential

# Switch User
RUN useradd -u 1001 -U -m -s /bin/bash builder && \
	echo "builder ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/builder && \
	chmod 0440 /etc/sudoers.d/builder

# Removed unused parts to make a smaller Docker image:
RUN apt-get remove -yq --autoremove lsb-release software-properties-common && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

USER builder:builder

# We expect this to be mounted with '-v $PWD:/home/builder/termux-packages':
WORKDIR /home/builder/winemu-build