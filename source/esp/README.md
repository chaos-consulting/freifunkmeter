# Installation auf ESP-01
In der Datei `zeigermessgeraet.lua` muss in Zeile 26 die IP-Adresse des "Servers" angepasst werden.

Der ESP-01 muss mit der Nodemcu-Firmware geflasht sein. Die kann z.B. hier gebaut und heruntergeladen werden: https://nodemcu-build.com/.

Durch das vorliegende ESP-Modul wird die Version `1.5.4.1-final (frozen, for 512KB modules)` der Nodemcu-Firmware verwendet. Man muss die Module `cjson` und `PWM` einkompilieren. Aufgrund der Berechnungen benötigt man die Floatingpoint-Variante.

Wenn neuere Module mit aktuelleren Versionen der Firmware verwendet werden sollen, muss der Sourcecode angepasst werden.

Flashen geht z.B. mit dem `nodemcu-flasher` (https://github.com/nodemcu/nodemcu-flasher).
Danach kann mit `ESPlorer` die Datei zeigermessgeraet.lua und init.lua auf den ESP-01 übertragen werden.
