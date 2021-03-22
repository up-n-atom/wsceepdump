# Just Enough WonderSwan Color/Swan Crystal EEPROM dumper

_⚠️ USE WITH CAUTION! Always test on a handheld of lesser importance to confirm its operation_

Each boot writes to the EEPROM you lose the authenticity of the factory default. Such writes include the _"unique"_ cartridge count, boot count, and previously booted cartridge identifiers. If these are not important, a custom rom and serial cable is the more convenient alternative.

> Fun Fact: The SwanCrystal EEPROM contains the Bandai bootsplash present in the bootrom.

![Wired](images/wired.jpg?raw=true "Wired")

## Components

> Shop around, AliExpress links are non-affiliated top searches.

* 1x Blue Pill [[AliExpress](https://www.aliexpress.com/item/32792513237.html)]
* 1x ST-Link<sup>1</sup> or USB to TTL<sup>2</sup> [[AliExpress<sup>1</sup>](https://www.aliexpress.com/item/32887597480.html) or [AliExpress<sup>2</sup>](https://www.aliexpress.com/item/32946781917.html)]
* 1x SOP8 Test Clip [[AliExpress](https://www.aliexpress.com/item/32968334401.html)]
* 1x Breadboard [[AliExpress](https://www.aliexpress.com/item/32430469610.html)]
* 7x Male to Male Dupont Cables [[AliExpress](https://www.aliexpress.com/item/4000203371860.html)]
* 1x 1.2K Resistor [[AliExpress](https://www.aliexpress.com/item/32847096736.html)]

## Arduino Bootloader

There are nemerous guides on how to install the STM32duino bootloader and the following video https://www.youtube.com/watch?v=Myon8H111PQ does an excellent job of describing the process.

Additionally, you may require the [STM32 Virtual COM Port Driver](https://www.st.com/en/development-tools/stsw-stm32102.html).

## Wiring

![Wiring](images/wiring.jpg?raw=true "Wiring")

| Blue Pill | Test Clip | EEPROM     |
|-----------|-----------|------------|
| A4        | 1         | CS         |
| A5        | 2         | SK         |
| A6        | 3         | DI         |
| A7        | 4         | DO         |
| G         | 5         | GND        |
| 3.3       | 8         | VCC        |

1.2K pull-down resistor connected to pin 1 (Chip Select) and pin 5 (Ground) of the test clip.

_Optional: 1.5K pull-up resistor connected to pin 4 (DO) and pin 8 (VCC) of the test clip._

## Usage

1. Upload the [Arduino sketch](/arduino/wsc.ino) and run the Arduino IDE Serial Monitor or any alternative serial terminal such as [Tera Term](https://ttssh2.osdn.jp/index.html.en) or [Putty](https://www.putty.org/).
2. Send an **r** character to read the EEPROM.
3. Select all and copy the hex output.
4. Paste the copied hex output as _hex_ into a Hex Editor such as https://hexed.it/ or [HxD](https://mh-nexus.de/en/hxd/)
5. Save As...

## Testing

[Higan](https://higan.dev/) is able to load and emulate your EEPROM dump by renaming it as _save.eeprom_ and moving it into the _Systems/WonderSwan Color_ or _Systems/SwanCrystal_ directories.

## Custom Bootsplash

### WonderSwan Color

https://github.com/up-n-atom/higan/tree/ws-bootsplash/higan/System/WonderSwan%20Color

* [x] Dengeki
* [x] NAVI GET 400 Million
* [x] MS-06S Zaku II
* [ ] RX-78-2
* [ ] Inuyasha

### SwanCrystal

https://github.com/up-n-atom/higan/tree/ws-bootsplash/higan/System/SwanCrystal

* [x] One Piece Grand Battle Swan Colosseum 
* [ ] Tanita Mama Mitte
