#!/bin/bash
chown -R atlbitbucket:atlbitbucket /var/atlassian/application-data
#/etc/init.d/atlbitbucket start --no-search
/opt/atlassian/bitbucket/6.10.5/bin/start-bitbucket.sh --no-search
echo "wait 20s to create log file!"
sleep 20s
/etc/init.d/atlbitbucket status
tail -100f /var/atlassian/application-data/bitbucket/log/atlassian-bitbucket.log
