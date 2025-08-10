FROM quay.io/fedora/fedora-minimal:latest
RUN dnf -y install 'dnf5-command(copr)' && \
    dnf -y copr enable jdxcode/mise && \
    dnf -y install \
    @development-tools \
    iptables \
    tar \
    file \
    sudo \
    fish \
    mise && \
    dnf clean all
ARG USERNAME
RUN useradd -m $USERNAME -s /usr/bin/fish \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
LABEL org.opencontainers.image.source = "https://github.com/lauritskarl/devcontainer"
