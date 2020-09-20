ENTRY(_entry)
SECTIONS
{
	. = 0x00000010 ;
	.text : {
		*(.entry)
		*(.text)
	}
	.rdata : { *(.rdata) }
}