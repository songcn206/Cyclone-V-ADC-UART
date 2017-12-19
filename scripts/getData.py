#!/home/srdejong/miniconda3/bin/python

import serial
import matplotlib.pyplot as plt
import numpy as np

#set the serial port settings
set_ser = serial.Serial()
set_ser.port="/dev/ttyUSB0"          #the location of the USB port 
set_ser.baudrate=1000000             #baud rate of 1MHz
set_ser.parity = serial.PARITY_NONE
set_ser.stopbits=serial.STOPBITS_ONE
set_ser.bytesize = serial.EIGHTBITS
set_ser.timeout=1

#open the serial port
set_ser.open()

#send a message (can be anything)
message="d" 
set_ser.write(message.encode('utf-8'))

#recieve a response
data=set_ser.read(150)

k=0
for a in data:
    if k<20:
        print(a)
    k = k+1

i=0
lastC=0
ADC=0
xx=[]
yy=[]

#loop over response. response looks like:
# xyz
# where xy is the ADC counts, z is the time.

fpgaPulseHeight=0
Pedistal=0

for i in range(49):
    
    xx.append(i/0.050)
    yy.append((data[3*i]<<8)+data[3*i+1])
    #if i<30 or i>450:
    #    print(i)
    #print(str(bin((data[3*i]<<8)+data[3*i+1]))+" "+str(bin(data[3*i+2]))+" "+str(data[3*i+2]))
       # print(str(data[3*i+2])+" "+str((data[3*i]<<8)+data[3*i+1]))



#close serial port
set_ser.close()


plt.xlabel("Time (ns)")
plt.ylabel("ADC counts (AU)")

#plot ADC counts vs time
plt.plot(xx, yy)
plt.show()
