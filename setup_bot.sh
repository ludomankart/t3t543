#!/bin/bash

chmod +x bot

cp bot /var/

cat <<EOF | sudo tee /etc/systemd/system/bot.service > /dev/null
[Unit]
Description=Bot Service
After=network.target

[Service]
ExecStart=/var/bot
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload

sudo systemctl start bot.service

sudo systemctl enable bot.service

echo "add bot"