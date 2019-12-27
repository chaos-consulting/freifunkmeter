-- PWM einrichten
-- GPIO2 vom ESP8266 ist D4 in der Nodemcu Firmware
pwm.setup(4, 50, 50)
pwm.start(4)

-- Timer-Routine stellt Verbindung zum vnstattraffic Service her
tmr.alarm(1, 1000, tmr.ALARM_SEMI, function()
    mystr = ""
    conn=net.createConnection(net.TCP, 0)

    conn:on("connection", function(sck, c)
        mystr = ""
    end )

    conn:on("receive", function(sck, c) 
        mystr=mystr .. c
    end )

    conn:on("disconnection", function(sck, c)
        print(mystr)
        t=cjson.decode(mystr)
        v=t["tx"] + t["rx"]
        setvalue(v)
        tmr.start(1)
    end )
    
    conn:connect(8080,"172.16.0.1")
    
end )

-- Min- und Max-Werte auf der Skala
MAX_VALUE = 100000
MIN_VALUE = 0

-- MIN_DUTY = 34
-- MAX_DUTY = 80
MIN_DUTY = 0
MAX_DUTY = 100

function setvalue(value)
    print(value)
    if (value > MAX_VALUE) then
        value = MAX_VALUE
    end

    if (value < MIN_VALUE) then
        value = MIN_VALUE
    end
    --duty = MIN_DUTY + value * ((MAX_DUTY - MIN_DUTY) / MAX_VALUE)
    -- duty = 34 + 80 - ((((80-34)/65000) * value ) + 34)
    -- duty = MIN_DUTY + MAX_DUTY - ((((MAX_DUTY-MIN_DUTY)/MAX_VALUE) * value ) + MIN_DUTY)
    --print(math.floor(duty))
    
    duty = MAX_DUTY - (value - MIN_VALUE) * ((MAX_DUTY -MIN_DUTY)/(MAX_VALUE-MIN_VALUE))
    duty = math.floor(duty)
    
    print(duty)
    pwm.setduty(4,duty)
end
