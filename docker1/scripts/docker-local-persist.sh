#!/usr/bin/env bash

set -eu

echo "Install Docker volume plugin local-persist"

curl -fsSL https://github.com/MatchbookLab/local-persist/releases/download/v1.3.0/local-persist-linux-amd64 -o /usr/local/bin/docker-volume-local-persist
chmod a+x /usr/local/bin/docker-volume-local-persist

cat > /etc/systemd/system/docker-volume-local-persist.service <<EOF
[Unit]
Description=docker-volume-local-persist
Before=docker.service
Wants=docker.service

[Service]
TimeoutStartSec=0
ExecStart=/usr/local/bin/docker-volume-local-persist

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable docker-volume-local-persist
systemctl start docker-volume-local-persist
