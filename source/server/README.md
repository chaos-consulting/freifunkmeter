# Installation des "Servers"

Stumpf ist Trumpf. Alles geht besser und eleganter aber so geht's halt auch.

Die Traffic-Daten werden über ein Script geliefert, welches durch xinetd gestartet wird.

Das Script legen wir unter /opt/trafficstat ab:

```
# mkdir /opt/trafficstat
# cp vnstattraffic /opt/trafficstat/
# chmod 755 /opt/trafficstat/vnstattraffic
```

Dann muss noch die xinetd Konfiguraiton angelegt und aktiviert werden:

```
# cp vnstattraffic.xinetd /etc/xinetd.d/
# chmod 644 /etc/xinetd.d/vnstattraffic
# systemctl restart xinetd
```

