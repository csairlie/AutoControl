# AutoControl - Automation support for SelfControl on MacOS

## Installation
- Download autocontrol.applescript from the GitHub repository
  
- Create a Keychain password entry for SelfControl
  - Open `Keychain` -> `Create Password` -> Set `Keychain Item Name` and `Account Name` to `SelfControl`
  - Set `Password` to your user admin password
> Why? SelfControl requires your user admin password to start a block. The script uses this new Keychain entry to enter the user admin password automatically

- To start a block, run `osascript PATH/TO/autocontrol.scpt 120` where `120` represents the duration of your desired block in minutes. By default, if no duration is specified, the block duration will be set to 1 hour. This can be changed inside the script.

## How to Automate
I recommend using `cron` for scheduling your blocking.

To start, open your terminal and enter `crontab -e` to edit your cron entries

For documentation on how to format cronjob times, visit [crontab.guru](https://crontab.guru/)

**Some example entries:** 

_Everyday at 9AM, start a 3 hour block_
```
00 9 * * * osascript ~/scripts/autocontrol.scpt 180
```
_Every weekday at 10PM, start a 2 hour block_
```
00 22 * * 1,2,3,4,5 osascript ~/scripts/autocontrol.scpt 120
```

### Notes:
- `cron` may not work if it does not have `Full Disk Access`.
  - To enable, go to `System Preferences` -> `Privacy & Security` -> `Full Disk Access` -> Click `+` -> Press `command+shift+G` -> Type `/usr/sbin/cron` -> Press `Enter` -> Select the `cron` file -> Click `Open`

- Support for multiple blocklists in currently unavailible, however, coming soon.
