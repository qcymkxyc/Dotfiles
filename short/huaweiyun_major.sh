#! /usr/bin/expect

set host 114.116.75.214
set user qcymkxyc
set pw 68415843g

spawn ssh $user@$host
expect {
        "*yes/no" {
                send "yes\r";
                expect "*assword:"
                send "123456\r"
        }
        "*assword:" {send "$pw\r"}
}
expect "*#"
interact
