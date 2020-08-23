SECTIONS
{
	.text 0xb400 : {
		*(.entry)
		*(.text)
	}
	.data : { *(.data) }
	.rdata : { *(.rdata) }
	.drectve : { *(.drectve) }
	.bss 0x4000 : { *(.bss) }
}