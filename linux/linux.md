## managing crontabs
```shell script
crontab -e
```
Use `#` to comment out

## cron job scheduling
```shell script
*     *     *     *     *  Befehl der ausgeführt werden soll
-     -     -     -     -
|     |     |     |     |
|     |     |     |     +----- Wochentag (0 - 7) (Sonntag ist 0 und 7)
|     |     |     +------- Monat (1 - 12)
|     |     +--------- Tag (1 - 31)
|     +----------- Stunde (0 - 23)
+------------- Minute (0 - 59)
```

## checking list of cronjobs
```shell script
crontab -l
crontab -u <user> -l
sudo -u <user> crontab -l
```
