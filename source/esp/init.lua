-- init.lua

-- WLAN Parameter
WIFI_SSID = "Freifunk"
WIFI_PASSWORD = ""
WIFI_SIGNAL_MODE = wifi.PHYMODE_N

-- WLAN konfigurieren: Station-Modus
print("Connecting to wifi...")
wifi.setmode(wifi.STATION)
wifi.setphymode(WIFI_SIGNAL_MODE)
wifi.sta.config(WIFI_SSID, WIFI_PASSWORD) 
wifi.sta.connect()

-- Warten bis mit WLAN verbunden
tmr.alarm(0, 3000, 1, function()
     print(".")
     local ip = wifi.sta.getip()
     
     if ((ip ~= nil) and (ip ~= "0.0.0.0")) then
          tmr.stop(0)
          print("The module MAC address is: " .. wifi.ap.getmac())
          print("Config done, IP is "..wifi.sta.getip())
          dofile("zeigermessgeraet.lua")
     end
end)
