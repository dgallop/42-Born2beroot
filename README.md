# Born2beroot

For this project I used Debian with VM virtualbox
I have to configure SSH service with specifics configurations

## SSH

To install SSH
```
sudo apt install openssh-server
```
To check STATUS, START or STOP the service it needs to be run:
```
sudo systemctl status/start/stop ssh
```
To modify the port and the root login of the protocol just edit this file and its lines
```
/etc/ssh/sshd_config
  Port 4242
  PermitRootLogin no
```
 ## UFW
 
 ```
 sudo apt install ufw
 ```
 ```
 sudo ufw enable
 ```
 ```
 sudo ufw allow 4242
 ```
 To delete a rule, check the status numbered and delete the ones you want
 ```
 sudo ufw status numbered
 ```
 ```
 sudo ufw delete Number
 ```
## PASSWORD

Edit this file to change the expiration of the password, the minimun days til change and days for warnning
```
/etc/login.defs
```
```
PASS_MAX_DAYS Number
PASS_MIN_DAYS Number
PASS_WARN_AGE Number
```
To maintain the strenght of the user's password.
```
sudo apt install libpam-pwquality
```
```
/etc/pam.d/common-password
  password requisite pam_cracklib.so retry=3 minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username enforce_for_root difok=7
```

## CRONTAB

Executes [monitoring.sh](https://github.com/dgallop/Born2beroot/blob/46a02b1c28db847f110c9abaab875910e3aa216a/monitoring.sh)
```
sudo crontab -u root -e
*/min * * * * bash file.sh
```

My final score:

<img src="https://badge42.herokuapp.com/api/project/dgallo-p/Born2beroot">
