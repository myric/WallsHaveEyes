# a python program to send an initial packet, then listen for packets from the ESP32

import socket

import time
# from OSC import OSCClient, OSCMessage
# import argparse
# from pythonosc import udp_client
from pythonosc.udp_client import SimpleUDPClient

UDP_IP = "192.168.1.173" # The IP that is printed in the serial monitor from the ESP32
SHARED_UDP_PORT = 4210
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # Internet  # UDP
sock.connect((UDP_IP, SHARED_UDP_PORT))

pro_ip = "127.0.0.1"
pro_port = 12000
client = SimpleUDPClient(pro_ip, pro_port)
# client.connect(("localhose",12000))

def loop():
    while True:
        data = sock.recv(2048)
        print(data)
        print(type(data))
        num = float(data) 
        print(num)
        print(type(num))
        client.send_message("/distance",num)

if __name__ == "__main__":
    sock.send('Hello ESP32'.encode())
    loop()


