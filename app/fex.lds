ENTRY(_entry)
SECTIONS
{
	.text : {
		*(.entry)
		*(.text)
	}
	.rdata : { *(.rdata) }
}