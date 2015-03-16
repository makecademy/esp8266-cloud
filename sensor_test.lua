-- Read data
tmr.alarm(0, 1000, 1, function() 

  -- Temperature
  reading = adc.read(0)*1200/1024
  t = (reading - 500) / 10

  print(tostring(t):sub(0, 4))
 
end)