import socket
import struct
import binascii
import requests
import curses
import time
import asyncio
import tracemalloc
from pynput import keyboard

tracemalloc.start()

total = 0
receivedPackets = 0
errors = 0
sendtime = 0

receiveMSG = ""
curModeHold = ["TCP", "UDP"]
curMode = curModeHold[0]
responseTime = None
response = requests.get("http://www.randomnumberapi.com/api/v1.0/randomstring?min=8&max=16&count=1").json()
val = str(response)
formResp = "#" + val[2:-2]

curMode = curModeHold[0]
state = True
port = 5232



def computeErrorRate():
    global total
    global errors
    errors = float(((total - 1)/total) * 100)



def on_press(key):
    global curMode
    global curModeHold
    global state
    if key == keyboard.Key.enter:
        state = False
        

    elif key == keyboard.Key.f3:
        switchedVal = None
        if curMode == curModeHold[0]:
            switchedVal = curModeHold[1]
        else:
            switchedVal = curModeHold[0]
        curMode = switchedVal
   

async def listenRec(sock):
    global receivedPackets
    global receiveMSG
    global sendtime
    global responseTime
    data, addr = sock.recvfrom(4096)
    if data:

        receiveMSG = str(data)
        receiveMSG = receiveMSG[5:-1]
        responseTime = (time.time() - sendtime)
        receivedPackets += 1
    else:
        computeErrorRate()
    sock.close()


async def updateValues(message, total):
    UDP_IP = "192.168.1.152"
    UDP_PORT = 5000
    global port
    global sendtime
    try:
        sock = socket.socket(socket.AF_INET, # Internet
                        socket.SOCK_DGRAM) # UDP
        sock.bind(("", port))

        sock.sendto(message, (UDP_IP, UDP_PORT))
        sendtime = time.time()
        total += 1
        return total, sock
    except:
        computeErrorRate()
        sendtime = time.time()
        total += 1
        return total, sock





async def main(stdscr):

    curses.curs_set(0)

	# get height and width of screen
    h, w =  stdscr.getmaxyx()
    global total
	# create a new color scheme
    curses.init_pair(1, curses.COLOR_CYAN, curses.COLOR_BLACK)
    curses.init_pair(2, curses.COLOR_RED, curses.COLOR_BLACK)
    curses.init_pair(3, curses.COLOR_GREEN, curses.COLOR_BLACK)
    listener =  keyboard.Listener(on_press=on_press)
    listener.start()  # start to listen on a separate thread



	# text to be written in center
    text = "Polling Statistics"

	# find coordinates for centered text

	# set color scheme


	# update the screen
    while state:
        message = bytes(formResp.upper(), encoding = 'utf-8')
        task1 = asyncio.create_task(updateValues(message, total))
        total, s = await task1
        task2 = asyncio.create_task(listenRec(s))
        total0 = await task2
        
        x0 = w//2 - len(text)//2
        y0 = h//20
        stdscr.attron(curses.color_pair(1))
        stdscr.addstr(y0, x0, text)
        stdscr.attroff(curses.color_pair(1))

        txtpack = f"Packets Sent: {total}"
        txtRec = f"Packets Received {receivedPackets}"

        stdscr.attron(curses.color_pair(2))
        txtErr = f"Error Rate: {errors}%"
        stdscr.attroff(curses.color_pair(2))

        txtmessage = f"Message Sent: :<{formResp.upper()}>"
        txtRecMsg =  f"Message Rec : :[{receiveMSG}]"
        txtRespTime = f"Response Time: {int(responseTime * 100)} ms"

        stdscr.attron(curses.color_pair(3))
        txtMode = f"Mode: {curMode}"
        stdscr.attroff(curses.color_pair(3))

        txtDef = "Press Enter to stop pinging and F3 to change mode"
        x = w//30
        y = 2
        


        stdscr.addstr(y+1, x, txtRec)
        stdscr.addstr(y+2, x, txtErr)
        stdscr.addstr(y+3, x, txtmessage)
        stdscr.addstr(y+4, x, txtRecMsg)
        stdscr.addstr(y+5, x, txtRespTime)
        stdscr.addstr(y+6, x, txtpack)
        stdscr.addstr(y+7, x, txtMode)
        stdscr.addstr(y+10, x, txtDef)
        stdscr.refresh()
        time.sleep(1)

    exit("Exiting")
        



        
       


asyncio.run(curses.wrapper(main))
