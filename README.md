# Introduction

I mean, the walls have eyes. It's in the name.

# Materials

- ESP32
- Ultrasonic ranging module
- Breadboard
- Male to female jumper wire
- Anker battery pack & micro-USB cord

# Design

This is a very simple and delicate implementation of this concept: The ESP32 connects to local wifi and operates in station mode. Once the python script makes contact, the microcontroller begins sending packets with the current estimated distance from the ultrasonic ranger to whatever is in front of it. Concurrently, the Processing sketch sets up its own listening port and draws the beating heart / circle at its default values. The python script makes contact with the microcontroller, receives its packets as bytes, and casts them to float before sending them to the Processing script as OSCMessages.

The main catch in this system, besides having three things that need to be run in a certain order, is that the ESP32 has a tendancy to hang when trying to connect to wifi or even to have failures in the loading process that prevent the program from running. When running the microcontroller headlessly, one just has to restart it several times, testing with the python script each time, in order to get the system running. Altogether this would need a more robust design for a full scale installation.

Thanks to:
- <a href="https://pypi.org/project/python-osc/">Python Open Sound Control</a> server & client for Python 3.
- <a href="https://python-osc.readthedocs.io/en/latest/client.html#client-module-documentation">The Python-OSC Docs</a>
- <a href="https://stackoverflow.com/questions/39719193/how-to-pass-output-from-a-python-program-into-a-processing-program">George Profenza on StackOverflow</a>
- FreeNove Tutorials for Wifi & Ultrasonic Ranging
- <a href="https://gist.github.com/santolucito/4016405f54850f7a216e9e453fe81803">Mark Santolucito's WiFi code for ESP32</a>
- And for reference: <a href="https://github.com/espressif/arduino-esp32/issues/102">ESP32 Conflict Between Wifi and analogRead()</a>
