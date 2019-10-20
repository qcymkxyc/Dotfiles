#! /usr/bin/expect

set host 47.94.80.98
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
