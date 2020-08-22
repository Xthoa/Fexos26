SECTIONS
{
	.text 0x8200 : {
		*(.entry)
		*(.text)
	}
	.data : { *(.data) }
	.rdata : { *(.rdata) }
	.drectve : { *(.drectve) }
	.bss 0x4000 : { *(.bss) }
}