#include <8051.h>
#include <stdbool.h>

#define W5500_SCS P1_0
#define W5500_SCLK P1_1
#define W5500_MISO P1_2
#define W5500_MOSI P1_3



#define bufferSize 25


// Additional global variables
unsigned char RTU = 3;
unsigned char ip[4] = {192, 168, 1, 152};
unsigned char mac[6] = {0xDE, 0x4F, 0x3D, 0x4F, 0x5E, 0x2D};
unsigned char subnet[4] = {255, 255, 255, 0};
unsigned char gateway[4] = {192, 168, 1, 111};
unsigned char port[2] = {0x13, 0x88};
unsigned char peer_ip[4];
unsigned char peer_port[2];
unsigned char get_size[2];
unsigned char message[24];
unsigned char tmpgateway[4] = {192, 168, 1, 111};
unsigned char tmpip[4] = {192, 168, 1, 152};
unsigned char tmpmac[6] = {0xDE, 0x4F, 0x3D, 0x4F, 0x5E, 0x2D};
unsigned char tmpsubnet[4] = {255, 255, 255, 0};
volatile char bufferM[bufferSize];
volatile unsigned char bufIndex = 0;
volatile unsigned char strreceived = 0;
volatile bool sendFlag = false;
unsigned int timeout = 0;
volatile bool polling = false;
volatile bool udp = true;

volatile bool dataReceived = false;


void ByteToHex(unsigned char byte, char* str) {
    unsigned char highNibble = (byte >> 4) & 0x0F;  // Extract the high nibble
    unsigned char lowNibble = byte & 0x0F;          // Extract the low nibble

    // Convert high nibble to hexadecimal character
    str[0] = (highNibble <= 9) ? ('0' + highNibble) : ('A' + highNibble - 10);

    // Convert low nibble to hexadecimal character
    str[1] = (lowNibble <= 9) ? ('0' + lowNibble) : ('A' + lowNibble - 10);

    str[2] = '\0';  // Null-terminate the string
}



void IntToStr(unsigned int num, unsigned char *str)
{
	char temp[6];
	int i = 0;
	if (num == 0)
	{
		str[i++] == '0';
	}
	else
	{
		while (num > 0)
		{
			temp[i++] = (num % 10) + '0';
			num /= 10;
		}
	}
	int j = 0;
	while (i > 0)
	{
		str[j++] = temp[--i];
	}
	str[j] = '\0';
}

void delay()
{
	return;
}

/*void timerms(unsigned char ms)
{
	unsigned char i;

	while (ms--)
	{
		for (i = 0; i < 120; i++)
			;
	}
}*/

void initPhase(unsigned int addr, unsigned char bsb)
{
	W5500_SCS = 1;
	delay();
	W5500_SCLK = 0;
	delay();
	W5500_SCS = 0;
	delay();
	unsigned int mask0 = 0x8000;
	for (int pos = 0; pos < 16; pos++)
	{
		delay();
		W5500_SCLK = 0;
		delay();
		if (addr & mask0)
		{
			W5500_MOSI = 1;
		}
		else
		{
			W5500_MOSI = 0;
		}
		mask0 >>= 1;
		delay();
		W5500_SCLK = 1;
	}
	unsigned char mask1 = 0x80;
	for (int pos0 = 0; pos0 < 8; pos0++)
	{
		if (pos0 >= 3)
		{
			delay();
			W5500_SCLK = 0;
			delay();
			if (bsb & mask1)
			{
				W5500_MOSI = 1;
			}
			else
			{
				W5500_MOSI = 0;
			}

			delay();
			W5500_SCLK = 1;
			mask1 >>= 1;
		}
		else
		{
			mask1 >>= 1;
		}
		// mask1 >>= 1;
	}
	delay();
	delay();
}
void setRead()
{
	W5500_SCLK = 0;
	delay();
	W5500_MOSI = 0;
	delay();
	W5500_SCLK = 1;
	delay();
}
void setWrite()
{
	W5500_SCLK = 0;
	delay();
	W5500_MOSI = 1;
	delay();
	W5500_SCLK = 1;
	delay();
}
void setOM()
{
	for (int pos2 = 0; pos2 < 2; pos2++)
	{
		W5500_SCLK = 0;
		delay();
		W5500_MOSI = 0;
		delay();
		W5500_SCLK = 1;
		delay();
	}
}

void writeToW5500(unsigned char *data, unsigned int len){
	for (int i = 0; i < len; i++)
	{
		unsigned int mask = 0x80;
		for (int x = 0; x < 8; x++)
		{
			delay();
			W5500_SCLK = 0;
			delay();
			if (data[i] & mask)
			{
				W5500_MOSI = 1;
			}
			else
			{
				W5500_MOSI = 0;
			}
			mask >>= 1;
			delay();
			W5500_SCLK = 1;
		}
	}
}




void sendByte(unsigned int addr, unsigned char bsb, unsigned char *data, unsigned int len)
{
	initPhase(addr, bsb);
	delay();
	setWrite();
	delay();
	setOM();
	delay();
	// unsigned int mask = 0x80;
	writeToW5500(data, len);
	delay();
	W5500_SCLK = 0;
	W5500_SCS = 1;
}



void openSocket(unsigned int addr, unsigned char bsb, unsigned char data)
{
	initPhase(addr, bsb);
	delay();
	setWrite();
	delay();
	setOM();
	delay();
	// unsigned int mask = 0x80;
	unsigned char temp2[1] = {data};
	writeToW5500(temp2, 1);
	delay();
	W5500_SCLK = 0;
	W5500_SCS = 1;
}
unsigned char sockReceive0(unsigned int addr, unsigned char bsb)
{
	initPhase(addr, bsb);
	setRead();
	setOM();
	unsigned int data = 0;
	unsigned int mask = 0x80;

		unsigned char i;
		// unsigned char data = 0;
		for (i = 0; i < 8; i++)
		{
			W5500_SCLK = 0;
			delay();
			// delayClock(1);
			if (W5500_MISO)
			{
				data |= mask;
			}

				mask >>= 1;
			
			W5500_SCLK = 1;
			delay();
		}

	// data = 0;
	delay();
	W5500_SCLK = 0;
	W5500_SCS = 1;
	return data;
}

/*unsigned int sockReceive(unsigned int addr, unsigned char bsb) {
    initPhase(addr, bsb);
    setRead();
    setOM();
    unsigned int data = 0;  // This will store the final 16-bit value.

    // Read the first byte.
    for (int i = 0; i < 8; i++) {
        W5500_SCLK = 0;
        delay();
        if (W5500_MISO) {
            data |= 0x01;  // Set LSB if MISO is high.
        }
        if (i < 7) {
            data <<= 1;  // Shift to prepare for the next bit, but not after the last bit.
        }
        W5500_SCLK = 1;
        delay();
    }

    data <<= 8;  // Shift the first byte left to make room for the second byte.

    // Read the second byte and combine it with the first.
    for (int i = 0; i < 8; i++) {
        W5500_SCLK = 0;
        delay();
        if (W5500_MISO) {
            data |= 0x01;  // Set LSB if MISO is high.
        }
        if (i < 7) {
            data <<= 1;  // Shift to prepare for the next bit, but not after the last bit.
        }
        W5500_SCLK = 1;
        delay();
    }

    delay();
    W5500_SCLK = 0;
    W5500_SCS = 1;
    return data;
}*/

/*char sockStatus(unsigned int addr, unsigned char bsb)
{
	initPhase(addr, bsb);
	setRead();
	setOM();
	// unsigned int mask = 0x80;

	unsigned char i, data = 0;
	for (i = 0; i < 8; i++)
	{
		W5500_SCLK = 0;
		delay();
		// delayClock(1);
		if (W5500_MISO)
		{
			data |= 1;
		}
		if (i < 7)
		{
			data <<= 1;
		}
		W5500_SCLK = 1;
		delay();
	}

	// data = 0;
	delay();
	W5500_SCLK = 0;
	W5500_SCS = 1;
	return data;
}*/

void readByte(unsigned int addr, unsigned char bsb, unsigned int len)
{
	initPhase(addr, bsb);
	setRead();
	setOM();
	// unsigned int mask = 0x80;

	for (int j = 0; j < len; j++)
	{
		unsigned char i, data = 0;
		for (i = 0; i < 8; i++)
		{
			W5500_SCLK = 0;
			delay();
			// delayClock(1);
			if (W5500_MISO)
			{
				data |= 1;
			}
			if (i < 7)
			{
				data <<= 1;
			}
			W5500_SCLK = 1;
			delay();
		}
		if (addr == 0x000F)
		{
			tmpip[j] = data;
		}
		else if (addr == 0x0009)
		{
			tmpmac[j] = data;
		}
		else if (addr == 0x0005)
		{
			tmpsubnet[j] = data;
		}
		else if(addr == 0x0001){
			tmpgateway[j] = data;
		}
			
	}

	delay();
	W5500_SCLK = 0;
	W5500_SCS = 1;
}

unsigned char readInt(unsigned int addr, unsigned char bsb)
{
	initPhase(addr, bsb);
	setRead();
	setOM();
	// unsigned int mask = 0x80;

		unsigned char i, data = 0;
		for (i = 0; i < 8; i++)
		{
			W5500_SCLK = 0;
			delay();
			// delayClock(1);
			if (W5500_MISO)
			{
				data |= 1;
			}
			data <<= 1;
			W5500_SCLK = 1;
			delay();
		}
	unsigned char data01 = 0;
	unsigned char data1 = (data >> 1);
	data01 = (data01 << 4) | data1; 
	delay();
	W5500_SCLK = 0;
	W5500_SCS = 1;
	return data01;
}




void resetArrays(unsigned char *peer_ip, unsigned char *peer_port, unsigned char *get_size, unsigned char *message){
	for (int i = 0; i < 2; i++){
		peer_ip[i] = 0;
	}
	for (int i = 0; i < 2; i++){
		peer_port[i] = 0;
	}
	for (int i = 0; i <= 2; i++){
		get_size[i] = 0;
	}
	for (int i = 0; i < 24; i++){
		message[i] = '\0';
	}
}

void readW55000(unsigned int addr, unsigned char bsb, unsigned int len) {
    initPhase(addr, bsb);
    setRead();
    setOM();
    int dataIndex = 0;
	resetArrays(peer_ip, peer_port, get_size, message);
    for (int j = 0; j < len; j++) {
		delay();
        unsigned char dataByte = 0;
        for (int i = 0; i < 8; i++) {
			delay();
            W5500_SCLK = 0;
            if (W5500_MISO) {
                dataByte |= 1;
            }
            if (i < 7) {
                dataByte <<= 1;
            }
			delay();
            W5500_SCLK = 1;
        }

        // Assign the read byte to the correct part of the packet info.
        if (j < 4) {
            peer_ip[j] = dataByte;
        } else if (j >= 4 && j <= 5) {
            peer_port[j - 4] = dataByte;
        } else if (j >= 6 && j <= 7) {
            get_size[j - 6] = dataByte;
        }
		else{
			message[j-8] = dataByte;
		}
    }

    W5500_SCLK = 0;
    W5500_SCS = 1;
}

void configNetwork(){
	sendByte(0x000F, 0, ip, 4);//set ip
	delay();
	// readByte(0x0005, 0, 4);
	sendByte(0x0005, 0, subnet, 4); //
	delay();
	// readByte(0x0009, 0, 6);
	sendByte(0x0009, 0, mac, 6);
	delay();
	sendByte(0x0001, 0, gateway, 4);
}

void UART_Init()
{
	TMOD = 0x20; /* Timer 1, 8-bit auto reload mode */
	TH1 = 0xFD;	 /* Load value for 9600 baud rate */
	SCON = 0x50; /* Mode 1, reception enable */
	TR1 = 1;	 /* Start timer 1 */
}

void Transmit_data(char tx_data)
{
	SBUF = tx_data;
	while (TI == 0);
	TI = 0; 
}

void String(char *str)
{
	int i;
	for (i = 0; str[i] != 0; i++) 
	{
		Transmit_data(str[i]); 
	}
}

void TransmitByte(unsigned char data)
{
	SBUF = data;
	while (!TI)
		;
	TI = 0;
}

void transmitString(char *string)
{
	
	while (*string)
	{
		TransmitByte(*string++);
	}


}

void PrintNetworkInfo()
{
	char buffer[6];
	readByte(0x000F, 0, 4);
	delay();
	readByte(0x0005, 0, 4);
	delay();
	readByte(0x0009, 0, 6);
	delay();
	readByte(0x0001, 0, 4);
	// timerms(1000);
	transmitString("CURRENT CONFIG:");
	transmitString("          CHANGE CMD:\r\n");
	transmitString("RTU Addr (0-9): ");
	IntToStr(RTU, buffer);
	transmitString(buffer);
	transmitString("          RTU=#\r\n");

	transmitString("IP Addr: ");
	for (int i = 0; i < 4; i++)
	{
		IntToStr(tmpip[i], buffer);
		transmitString(buffer);
		if (i < 3)
			transmitString(".");
	}
	transmitString("   IP=###.###.###.###\r\n");
	transmitString("Subnet Mask: ");
	for (int i = 0; i < 4; i++)
	{
		IntToStr(tmpsubnet[i], buffer);
		transmitString(buffer);
		if (i < 3)
			transmitString(".");
	}
	transmitString("   SUB=###.###.###.###\r\n");
	transmitString("Gateway: ");
	for (int i = 0; i < 4; i++)
	{
		IntToStr(tmpgateway[i], buffer);
		transmitString(buffer);
		if (i < 3)
			transmitString(".");
	}
	transmitString("    GATE=###.###.###.###\r\n");
	transmitString("MAC Addr: ");
	for (int i = 0; i < 6; i++)
	{
		IntToStr(tmpmac[i], buffer);
		transmitString(buffer);
		if (i < 5)
			transmitString(" ");
	}
	transmitString("    MAC=FF FF FF FF FF FF\r\n");





}
void printpacketadd() {
    char buffer[6];
    transmitString("Peer IP: ");
    for (int i = 0; i < 4; i++) {
        IntToStr(peer_ip[i], buffer);
        transmitString(buffer);
        if (i < 3) transmitString(".");
    }
    transmitString("\r\nPeer Port: ");
    unsigned int portValue = (peer_port[0] << 8) | peer_port[1];
    IntToStr(portValue, buffer);
    transmitString(buffer);
    transmitString("\r\nData Packet Size: ");
    unsigned int sizeValue = (get_size[0] << 8) | get_size[1];
    IntToStr(sizeValue, buffer);
    transmitString(buffer);
    transmitString("\r\nPeer Message: ");
    for (int i = 0; i < 24; i++) {
        if (message[i] != 0){
            char msgChar[2] = {message[i], '\0'};  // Convert each byte to a character string
            transmitString(msgChar);
        }
    }
}




void updateSn_RX_RD(unsigned int newPtr) {
    unsigned char ptrHighByte = (newPtr >> 8) & 0xFF;
    unsigned char ptrLowByte = newPtr & 0xFF;
    unsigned char test[2] = {ptrHighByte, ptrLowByte};
    sendByte(0x0028, 0b00000001, test, 2); // Update the Sn_RX_RD pointer.
}
void updateSn_RX_WR(unsigned int newPtr) {
    unsigned char ptrHighByte = (newPtr >> 8) & 0xFF;
    unsigned char ptrLowByte = newPtr & 0xFF;
    unsigned char test[2] = {ptrHighByte, ptrLowByte};
    sendByte(0x0024, 0b00000001, test, 2); // Update the Sn_RX_RD pointer.
}


void sendResponse(unsigned char* message, unsigned int len) {
	
	sendFlag = true;
	sendByte(0x000C, 0b00000001, peer_ip, 4);  // Destination IP
    sendByte(0x0010, 0b00000001, peer_port, 2);  // Destination port

    unsigned char tx_rd_ptr0 = sockReceive0(0x0022, 0b00000001); 
	unsigned char tx_rd_ptr1 = sockReceive0(0x0023, 0b00000001); 
	unsigned int tx_rd_ptr = tx_rd_ptr0;
	tx_rd_ptr = (tx_rd_ptr << 8) | tx_rd_ptr1;

    for (unsigned int i = 0; i < len; ++i) {
		message[0] = RTU;
		sendByte(tx_rd_ptr + i, 0b00000010, &message[i], 1);  // Writing data to TX buffer
    }
	updateSn_RX_WR(tx_rd_ptr + len);
    unsigned char send_command = 0x20;  // SEND command
    sendByte(0x0001, 0b00000001, &send_command, 1); 
  // Write to Sn_IR to clear SEND_OK flag
	sendFlag = false;
}




void handleDat(){
	if (!dataReceived){
		return;
	}
		
		unsigned char rx_rd0 = sockReceive0(0x0028, 0b00000001);
		unsigned char rx_rd1 = sockReceive0(0x0029, 0b00000001);
		unsigned int rx_rd = rx_rd0;
		rx_rd = (rx_rd << 8) | rx_rd1;

		unsigned char rx_wr0 = sockReceive0(0x002A, 0b00000001);
		unsigned char rx_wr1 = sockReceive0(0X002B, 1);
		unsigned int rx_wr = rx_wr0;
		rx_wr = (rx_wr << 8) | rx_wr1;


		readW55000(rx_rd, 0b00000011, rx_wr - rx_rd);

		transmitString("Processing packet...\r\n");
		printpacketadd();
		updateSn_RX_RD(rx_wr);
		unsigned char command[1] = {0x40}; // RECV command
		sendByte(0x0001, 0b00000001, command, 1);
		unsigned char cmdCheck;
		do {
			cmdCheck = readInt(0x0001, 0b00000001);
			
		} while(cmdCheck != 0x00);
		
		dataReceived = false;
		unsigned int sizeValue = (get_size[0] << 8) | get_size[1];
		sendResponse(message, sizeValue);
		
		
}




void enableSocketInt(){
	unsigned char interruptMask[1] = {0x14};
	unsigned char interruptMask0[1] = {0x01};
	unsigned char intmask[1] = {0x00};
	sendByte(0x002C, 0b00000001, interruptMask, 1);
	sendByte(0x0018, 0, interruptMask0, 1);
	sendByte(0x0002, 0b00000001, intmask, 1);
}



void externalInt10() __interrupt(0){
	//char buffer[5];
	unsigned char intStatus = readInt(0x0002, 0b00000001);

	
	if ((intStatus & 0x04) && !sendFlag){
		dataReceived = true;  //flag
		//transmitString("HI");
        unsigned char clearInt = 0x14;
        sendByte(0x0002, 0b00000001, &clearInt, 1);
		timeout = 0;
		
	}
	else if(intStatus & 0x10){
		unsigned char clearInt = 0x14;
        sendByte(0x0002, 0b00000001, &clearInt, 1);
		//transmitString("HI");
		timeout = 0;
	}
	timeout += 1;
	if (timeout >= 5000){
		resetArrays(peer_ip, peer_port, get_size, message);
		timeout = 0;
		enableSocketInt();
		dataReceived = false;
		sendFlag = false;
		
	}
}

void externalInt80() __interrupt(4){
	if (RI == 1){
		char receivedChar = SBUF;
		if (receivedChar == '\n' || receivedChar == '\r' || bufIndex >= bufferSize - 1){
			bufferM[bufIndex] = '\0';
			strreceived = 1;
			bufIndex = 0; 
		}
		else{
			bufferM[bufIndex] = receivedChar;
			bufIndex++;
		}
		RI = 0;
	}
}
void parseInp(char *arrbuff, unsigned char *iparr, int inc){
	int num = 0;
	int j =0;
	arrbuff += inc;
	while(*arrbuff){
		if (*arrbuff >= '0' && *arrbuff <= '9'){
			num = num * 10 + (*arrbuff - '0');
		}
		else if (*arrbuff == '.' || *(arrbuff + 1) == '\0'){
			if(*(arrbuff + 1) == '\0'){
				num = num * 10 + (*arrbuff - '0');
			}
			iparr[j++] = num;
			num = 0;
		}
		arrbuff++;
	}
}


void main() {
    UART_Init();
    configNetwork();
	enableSocketInt();
	IT0 = 1;
	EX0 = 1;
	EA = 1;
	ES = 1;

    // Initialize socket with command to open in UDP mode
    unsigned char command0[1] = {0b00000010};

    sendByte(0, 0b00000001, command0, 1); // Initialize the socket

    sendByte(0x0004, 0b00000001, port, 2); // Set the socket port
    openSocket(0x0001, 0b00000001, 1);
	enableSocketInt();

	//int bufSize = 34;
    while (1) {
		
		if (strreceived == 1){
			for(int i = 0; i < bufferSize; i++){
				if (bufferM[i] == '?'){
					PrintNetworkInfo();
				}
				else if(bufferM[i] == 'I' && bufferM[i+2] == '='){
					transmitString("hi");
					parseInp(&bufferM[i], ip, 3);
					//configNetwork();
				}
				else if(bufferM[i] == 'G' && bufferM[i+4] == '='){
					parseInp(&bufferM[i], gateway, 5);
					//configNetwork();
				}
				else if(bufferM[i] == 'M' && bufferM[i+3] == '='){
					parseInp(&bufferM[i], mac, 4);
					//configNetwork();
				}
				else if(bufferM[i] == 'S' && bufferM[i+3] == '='){
					parseInp(&bufferM[i], subnet, 4);
					//configNetwork();
				}
				else if(bufferM[i] == 'R' && bufferM[i+3] == '='){
					transmitString("hi");
				}
			}
			transmitString(bufferM);
			
			openSocket(0x0001, 0b00000001, 0x10);
			configNetwork();
			sendByte(0, 0b00000001, command0, 1); // Initialize the socket

    		sendByte(0x0004, 0b00000001, port, 2); // Set the socket port
    		openSocket(0x0001, 0b00000001, 1);
			enableSocketInt();
			strreceived = 0;
		}		
		else {
			handleDat();
		}
    }
}
