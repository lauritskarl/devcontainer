label org.opencontainers.image.source = "https://github.com/lauritskarl/devcontainer"
from quay.io/fedora/fedora-minimal:latest
run dnf -y install 'dnf5-command(copr)' && \
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
arg USERNAME
run useradd -m $USERNAME -s /usr/bin/fish \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
