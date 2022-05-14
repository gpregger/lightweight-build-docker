FROM alpine:latest
RUN apk add --no-cache bash git pacman-makepkg curl tar zstd
RUN curl https://archlinux.org/packages/community/x86_64/pacman-contrib/download --output pacman-contrib.pkg.tar.zst \
    && tar --use-compress-program=unzstd -xvf pacman-contrib.pkg.tar.zst --exclude='.*' \
    && mkdir -p /etc/periodic/1min \
    && touch /etc/periodic/1min/test.sh \
    && echo "#!/bin/bash" > /etc/periodic/1min/test.sh \
    && echo "wall << End_Of_Message" >> /etc/periodic/1min/test.sh \
    && echo "Test Broadcast." >> /etc/periodic/1min/test.sh \
    && echo "End_Of_Message" >> /etc/periodic/1min/test.sh \
    && chmod +x /etc/periodic/1min/test.sh

CMD cron