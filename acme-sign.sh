#!/bin/bash
acme.sh --issue  -d fb.jokeme.top --nginx
cp fb.jokeme.top.cer /etc/nginx/ssl/
cp fb.jokeme.top.key /etc/nginx/ssl/
systemctl restart nginx