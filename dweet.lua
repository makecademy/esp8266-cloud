-- Read data & send to Dweet.io every 10 seconds
tmr.alarm(0, 10000, 1, function() 

  -- Read data
  reading = adc.read(0)*1200/1024
  t = (reading - 500) / 10
  temperature = tostring(t):sub(0, 4)

  -- Send data to Dweet.io 
  conn = net.createConnection(net.TCP, 0)
  conn:connect(80, "54.84.241.136")
  conn:on("receive", function(conn, payload) print(payload) end)
  conn:send("GET /dweet/for/myesp8266?temperature=" .. temperature .. " HTTP/1.1\r\n\r\n")
  
end)