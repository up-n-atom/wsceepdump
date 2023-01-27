/* Forked from https://gist.github.com/krisha/fcaaf01534fa0ad9d3da

	Arduino code to read out and write EEPROM 93LC66
	which is used in an AEG 55GAD84AE induction hob.
	Some bits were flipped depending on temperature.
	Writing it back solved this problem.

	Modified for the STM32duino Blue Pill to read the
	WonderSwan Color/Swan Crystal.
*/

#include <limits.h>

#define DELAY_MS 10

/* Bitbang using the SPI port of the Blue Pill. The
	STM32F103 natively supports the micro wire
	protocol on SPI, but where's the fun in that.
*/
#define CS PA4 /* A4 -> 1 */ 
#define CK PA5 /* A5 -> 2 */
#define DI PA6 /* A6 -> 3 */
#define DO PA7 /* A7 -> 4 */
/*	G   -> 5
	3.3 -> 8
	1.2K pull-down resistor on CS */

#define WS_ADDR_BITS 6 /* 1024bit eeprom */
#define WSC_ADDR_BITS 10 /* 16384bit eeprom */

#define DATA_BITS 16

uint16_t addr_bits = WSC_ADDR_BITS;

void spi_bit_tx ( uint8_t bit )
{
	digitalWrite ( DI, bit ? HIGH : LOW);
	digitalWrite ( CK, HIGH );
	delayMicroseconds ( DELAY_MS );
  
	digitalWrite ( CK, LOW );
	digitalWrite ( DI, LOW );
	delayMicroseconds ( DELAY_MS );
}

uint8_t spi_bit_rx ()
{
	uint8_t d;
  
	digitalWrite ( CK, HIGH );
	delayMicroseconds ( DELAY_MS );
  
	d = digitalRead ( DO );
  
	digitalWrite ( CK, LOW );
	delayMicroseconds ( DELAY_MS );
  
	return d ? 1 : 0;
}

void data_read2buf_bitbang ( uint16_t addr, uint16_t len, uint16_t *buf )
{
	int i, j;

	digitalWrite ( CS, HIGH );

	/* start bit */
	spi_bit_tx ( 1 );

	/* read opcode */
	spi_bit_tx ( 1 );
	spi_bit_tx ( 0 );

	/* address */
	for ( i = addr_bits - 1; i >= 0; i-- )
	{
		spi_bit_tx ( ( addr >> i ) & 1 );
	}

	/* continuous data */
	for ( i = 0; i < len; i++ )
	{
		for ( j = 0; j < DATA_BITS; j++ )
		{
			buf[ i ] <<= 1;
			buf[ i ] |= spi_bit_rx ();
		}
	}

	digitalWrite ( CS, LOW );
}

void ewen_set_bitbang ()
{
	int i;
  
	digitalWrite ( CS, HIGH );
  
	spi_bit_tx ( 1 );
  
	spi_bit_tx ( 0 );
	spi_bit_tx ( 0 );
  
	for ( i = 0; i < addr_bits; i++ )
		spi_bit_tx ( 1 );
  
	digitalWrite ( CS, LOW );
}

void data_write_bitbang ( uint16_t addr, uint16_t data )
{
	int i;
  
	digitalWrite ( CS, HIGH );
  
	spi_bit_tx ( 1 );
  
	spi_bit_tx ( 0 );
	spi_bit_tx ( 1 );
  
	for ( i = addr_bits - 1; i >= 0; i-- )
	{
		spi_bit_tx ( (addr >> i ) & 1 );
	}
  
	for ( i = DATA_BITS - 1; i >= 0; i-- )
	{
		spi_bit_tx ( (data >> i ) & 1 );
	}

	/* clock */
	digitalWrite ( CK, HIGH );
	delayMicroseconds ( DELAY_MS );
	digitalWrite ( CK, LOW );
	delayMicroseconds ( DELAY_MS );
  
	digitalWrite ( CS, LOW );
  
	/* clock */
	digitalWrite ( CK, HIGH );
	delayMicroseconds ( DELAY_MS );
	digitalWrite ( CK, LOW );
	delayMicroseconds ( DELAY_MS );
  
	digitalWrite ( CS, HIGH );
  
	/* clock 'til ready */
	digitalWrite ( CK, HIGH );
	delayMicroseconds ( DELAY_MS );
  
	while ( !digitalRead ( DO ) )
	{
		digitalWrite ( CK, LOW );
		delayMicroseconds ( DELAY_MS );
		digitalWrite ( CK, HIGH );
		delayMicroseconds ( DELAY_MS );
	}

	digitalWrite ( CK, LOW );
	delayMicroseconds ( DELAY_MS );
  
	digitalWrite ( CS, LOW );
}

void setup ()
{
	pinMode ( CS, OUTPUT );
	pinMode ( DI, OUTPUT );
	pinMode ( CK, OUTPUT );

	Serial.begin ( 115200 );
}

void loop ()
{
	uint16_t sz;
	uint16_t *buf;
	int i;
	char s [ 7 ] = { 0 };

	if ( Serial.available () > 0 )
	{
		switch ( Serial.read () )
		{
			case -1:
				break;
			case 'm':
				addr_bits = WS_ADDR_BITS;
				break;
			case 'c':
				addr_bits = WSC_ADDR_BITS;
				break;
			case 'r':
				sz = ( ( uint16_t ) -1 ) >> ( ( sizeof ( uint16_t ) * CHAR_BIT ) - addr_bits ) + 1;

				buf = (uint16_t *) calloc ( sz, sizeof ( uint16_t ) );

				data_read2buf_bitbang ( 0, sz, buf );

				for ( i = 0; i < sz; i++ )
				{
					/* format as little endian */
					sprintf ( s, " %02X %02X", ( int )( buf[ i ] & 0xFF ), ( int )( buf[ i ] >> 8 ) );
					Serial.print ( s );
				}

				free ( buf );
				break;
		}
	}
}
