EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R1
U 1 1 605BCB49
P 6975 3725
F 0 "R1" V 7075 3675 50  0000 L CNN
F 1 "1K2" V 6975 3650 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6905 3725 50  0001 C CNN
F 3 "~" H 6975 3725 50  0001 C CNN
	1    6975 3725
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 605BCFF0
P 6975 3475
F 0 "R2" V 7075 3425 50  0000 L CNN
F 1 "1K5" V 6975 3400 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6905 3475 50  0001 C CNN
F 3 "~" H 6975 3475 50  0001 C CNN
	1    6975 3475
	0    -1   -1   0   
$EndComp
Text GLabel 4475 4575 0    50   Input ~ 0
DO
Text GLabel 4475 4475 0    50   Input ~ 0
DI
Text GLabel 4475 4375 0    50   Input ~ 0
CK
Text GLabel 4475 4275 0    50   Input ~ 0
CS
NoConn ~ 4475 3475
NoConn ~ 4475 3775
NoConn ~ 4475 3875
NoConn ~ 4475 3975
NoConn ~ 4475 4075
NoConn ~ 4475 3575
NoConn ~ 4475 3675
NoConn ~ 5075 4375
NoConn ~ 5075 4275
NoConn ~ 5075 4175
NoConn ~ 5075 4075
NoConn ~ 5075 3975
NoConn ~ 5075 3875
NoConn ~ 5075 3775
NoConn ~ 5075 3675
NoConn ~ 5075 4575
NoConn ~ 5075 4475
NoConn ~ 6325 3675
NoConn ~ 6325 3575
Text GLabel 5825 3475 0    50   Input ~ 0
CS
Text GLabel 5825 3575 0    50   Input ~ 0
CK
Text GLabel 5825 3675 0    50   Input ~ 0
DI
Text GLabel 5825 3775 0    50   Input ~ 0
DO
Text GLabel 6825 3725 0    50   Input ~ 0
CS
Text GLabel 6825 3475 0    50   Input ~ 0
DO
$Comp
L Connector_Generic:Conn_01x12 J1
U 1 1 605CB6B0
P 4675 3975
F 0 "J1" H 4625 4575 50  0000 L CNN
F 1 "Conn_01x12" H 4375 3275 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 4675 3975 50  0001 C CNN
F 3 "~" H 4675 3975 50  0001 C CNN
	1    4675 3975
	1    0    0    -1  
$EndComp
NoConn ~ 4475 4175
$Comp
L power:+3V3 #PWR?
U 1 1 605D1EC5
P 4925 3475
F 0 "#PWR?" H 4925 3325 50  0001 C CNN
F 1 "+3V3" H 4940 3648 50  0000 C CNN
F 2 "" H 4925 3475 50  0001 C CNN
F 3 "" H 4925 3475 50  0001 C CNN
	1    4925 3475
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 605D23E8
P 6325 3475
F 0 "#PWR?" H 6325 3325 50  0001 C CNN
F 1 "+3V3" H 6340 3648 50  0000 C CNN
F 2 "" H 6325 3475 50  0001 C CNN
F 3 "" H 6325 3475 50  0001 C CNN
	1    6325 3475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605D2B57
P 4925 3575
F 0 "#PWR?" H 4925 3325 50  0001 C CNN
F 1 "GND" H 4930 3402 50  0000 C CNN
F 2 "" H 4925 3575 50  0001 C CNN
F 3 "" H 4925 3575 50  0001 C CNN
	1    4925 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	4925 3475 5075 3475
Wire Wire Line
	5075 3575 4925 3575
$Comp
L power:GND #PWR?
U 1 1 605DA1E6
P 6325 3775
F 0 "#PWR?" H 6325 3525 50  0001 C CNN
F 1 "GND" H 6330 3602 50  0000 C CNN
F 2 "" H 6325 3775 50  0001 C CNN
F 3 "" H 6325 3775 50  0001 C CNN
	1    6325 3775
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 J2
U 1 1 605CC458
P 5275 3975
F 0 "J2" H 5275 4575 50  0000 C CNN
F 1 "Conn_01x12" H 5175 3275 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 5275 3975 50  0001 C CNN
F 3 "~" H 5275 3975 50  0001 C CNN
	1    5275 3975
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J3
U 1 1 605BC1D5
P 6025 3575
F 0 "J3" H 6075 3775 50  0000 C CNN
F 1 "Conn_02x04_Counter_Clockwise" H 6025 3125 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 6025 3575 50  0001 C CNN
F 3 "~" H 6025 3575 50  0001 C CNN
	1    6025 3575
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 605E4753
P 7225 3475
F 0 "#PWR?" H 7225 3325 50  0001 C CNN
F 1 "+3V3" H 7240 3648 50  0000 C CNN
F 2 "" H 7225 3475 50  0001 C CNN
F 3 "" H 7225 3475 50  0001 C CNN
	1    7225 3475
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605E4B0F
P 7225 3725
F 0 "#PWR?" H 7225 3475 50  0001 C CNN
F 1 "GND" H 7230 3552 50  0000 C CNN
F 2 "" H 7225 3725 50  0001 C CNN
F 3 "" H 7225 3725 50  0001 C CNN
	1    7225 3725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7125 3725 7225 3725
Wire Wire Line
	7125 3475 7225 3475
$EndSCHEMATC
