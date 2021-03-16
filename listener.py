# a python program to send an initial packet, then listen for packets from the ESP32

import socket

UDP_IP = "192.168.1.173" # The IP that is printed in the serial monitor from the ESP32
SHARED_UDP_PORT = 4210
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # Internet  # UDP
sock.connect((UDP_IP, SHARED_UDP_PORT))

def loop():
    while True:
        data = sock.recv(2048)
        print(data)
        print(type(data))
        num = float(data) 
        print(num)
        print(type(num))

if __name__ == "__main__":
    sock.send('Hello ESP32'.encode())
    loop()


