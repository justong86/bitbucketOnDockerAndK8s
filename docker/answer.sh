#!/usr/bin/expect
# create by zang.
# bitbucket安装时的自动应答文件
spawn /tmp/atlassian-bitbucket-6.10.5-x64.bin
expect {
	"Are you sure you want to continue" {send "y\r";exp_continue}
	"Install a new instance"          {send "1\r";exp_continue}
	"Install a Server instance"       {send "1\r";exp_continue}
	"Select the folder where you would like Bitbucket"     {send "\r";exp_continue}
	"Ensure that this location is"    {send "\r";exp_continue}
	"HTTP Port Number"                {send "\r";exp_continue}
	"Install as a service"            {send "i\r";exp_continue}
	"Install Bitbucket as a service"  {send "y\r";exp_continue}
	"HTTP Port Number"                {send "\r"}
	#"Launch Bitbucket 6.10.5 in browser"    {send "n\r"}
	#"Finishing installation"                {send "\r"}
}
expect "Would you like to launch Bitbucket"    {send "n\r"}
expect EOF
