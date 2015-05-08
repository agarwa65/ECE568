-- SLAVE


-- Set up WiFi
wifi.setmode(wifi.STATION) 
cfg={}
cfg.ssid="Nikki"
cfg.pwd="Omsairam15"
wifi.sta.config("Nikki","Omsairam15")
wifi.sta.connect()

-- Set up GPIO pins
r=0
g=0
b=0
pin_red=2
pin_green=1
pin_but=3
pin_blue=4
gpio.mode(pin_but, gpio.INPUT, gpio.PULLUP)
pwm.setup(pin_red, 100, 512)
pwm.setup(pin_green,100,512)
pwm.setup(pin_blue,100, 0)
pwm.start(pin_red)
pwm.start(pin_green)
pwm.start(pin_blue)
tmr.delay(200000)
pwm.setduty(pin_red,0)
pwm.setduty(pin_green,0)
pwm.setduty(pin_blue,0)

if s~=nil then
    s:close()
end
s=net.createServer(net.UDP) 
s:listen(8000,function(s)
                print("listening")
                s:on("receive",function(s,c) print("Received: ") print(c) end) 
              end)