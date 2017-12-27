# Installation auf ESP-01
In der Datei `zeigermessgeraet.lua` muss in Zeile 26 die IP-Adresse des "Servers" angepasst werden.

Der ESP-01 muss mit der Nodemcu-Firmware geflasht sein. (Kann z.B. hier gebaut und heruntergeladen werden: https://nodemcu-build.com/ .) Aufgrund der Berechnungen benötigt man die Floatingpoint-Variante. (Todo: insert einzukompilierende LUA-Module hier...).Dies geht z.B. mit dem `nodemcu-flasher` (https://github.com/nodemcu/nodemcu-flasher).
Danach kann mit `ESPlorer` die Datei zeigermessgeraet.lua und init.lua auf den ESP-01 übertragen werden.
