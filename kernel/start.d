
start.b:     file format pei-i386


Disassembly of section .text:

0000b400 <_entry>:
    b400:	55                   	push   %ebp
    b401:	57                   	push   %edi
    b402:	56                   	push   %esi
    b403:	53                   	push   %ebx
    b404:	81 ec 4c 01 00 00    	sub    $0x14c,%esp
    b40a:	c7 05 00 40 00 00 00 	movl   $0x500,0x4000
    b411:	05 00 00 
    b414:	e8 08 04 00 00       	call   b821 <_cls_bg>
    b419:	c7 05 48 40 00 00 00 	movl   $0x0,0x4048
    b420:	00 00 00 
    b423:	c7 05 44 40 00 00 00 	movl   $0x0,0x4044
    b42a:	00 00 00 
    b42d:	c7 44 24 08 40 00 00 	movl   $0x40,0x8(%esp)
    b434:	00 
    b435:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    b439:	89 44 24 04          	mov    %eax,0x4(%esp)
    b43d:	8d 9c 24 2c 01 00 00 	lea    0x12c(%esp),%ebx
    b444:	89 1c 24             	mov    %ebx,(%esp)
    b447:	e8 38 1d 00 00       	call   d184 <_fifo_init>
    b44c:	89 1d 64 40 00 00    	mov    %ebx,0x4064
    b452:	c7 44 24 08 00 10 00 	movl   $0x1000,0x8(%esp)
    b459:	00 
    b45a:	c7 44 24 04 00 30 00 	movl   $0x3000,0x4(%esp)
    b461:	00 
    b462:	8d 5c 24 18          	lea    0x18(%esp),%ebx
    b466:	89 1c 24             	mov    %ebx,(%esp)
    b469:	e8 16 1d 00 00       	call   d184 <_fifo_init>
    b46e:	89 1d 18 40 00 00    	mov    %ebx,0x4018
    b474:	e8 4b 0a 00 00       	call   bec4 <_init_allocator>
    b479:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
    b480:	00 
    b481:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    b488:	e8 d3 10 00 00       	call   c560 <_disable_page>
    b48d:	e8 09 34 00 00       	call   e89b <_init_idt>
    b492:	e8 8c 37 00 00       	call   ec23 <_init_gdt>
    b497:	e8 bf 03 00 00       	call   b85b <_cpuids>
    b49c:	e8 3b 12 00 00       	call   c6dc <_init_mt>
    b4a1:	e8 9d 12 00 00       	call   c743 <_create_task_0>
    b4a6:	89 04 24             	mov    %eax,(%esp)
    b4a9:	e8 20 14 00 00       	call   c8ce <_task_ready>
    b4ae:	e8 e5 0b 00 00       	call   c098 <_init_sbh>
    b4b3:	e8 68 2e 00 00       	call   e320 <_init_fs>
    b4b8:	8b 15 00 40 00 00    	mov    0x4000,%edx
    b4be:	0f b7 82 9c 01 00 00 	movzwl 0x19c(%edx),%eax
    b4c5:	66 c1 f8 03          	sar    $0x3,%ax
    b4c9:	98                   	cwtl   
    b4ca:	a3 50 40 00 00       	mov    %eax,0x4050
    b4cf:	0f b7 82 9e 01 00 00 	movzwl 0x19e(%edx),%eax
    b4d6:	66 c1 f8 04          	sar    $0x4,%ax
    b4da:	98                   	cwtl   
    b4db:	a3 54 40 00 00       	mov    %eax,0x4054
    b4e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    b4e7:	e8 8d 0b 00 00       	call   c079 <_malloc_page>
    b4ec:	a3 40 40 00 00       	mov    %eax,0x4040
    b4f1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    b4f8:	00 
    b4f9:	89 04 24             	mov    %eax,(%esp)
    b4fc:	e8 2a 32 00 00       	call   e72b <_push_page>
    b501:	a3 40 40 00 00       	mov    %eax,0x4040
    b506:	c7 04 24 17 f3 00 00 	movl   $0xf317,(%esp)
    b50d:	e8 04 30 00 00       	call   e516 <_fopen>
    b512:	89 c3                	mov    %eax,%ebx
    b514:	c7 05 1c 40 00 00 18 	movl   $0xc618,0x401c
    b51b:	c6 00 00 
    b51e:	89 04 24             	mov    %eax,(%esp)
    b521:	e8 66 30 00 00       	call   e58c <_filepos>
    b526:	8b 15 40 40 00 00    	mov    0x4040,%edx
    b52c:	8b 08                	mov    (%eax),%ecx
    b52e:	89 0a                	mov    %ecx,(%edx)
    b530:	8b 88 fc 07 00 00    	mov    0x7fc(%eax),%ecx
    b536:	89 8a fc 07 00 00    	mov    %ecx,0x7fc(%edx)
    b53c:	8d 7a 04             	lea    0x4(%edx),%edi
    b53f:	83 e7 fc             	and    $0xfffffffc,%edi
    b542:	29 fa                	sub    %edi,%edx
    b544:	29 d0                	sub    %edx,%eax
    b546:	89 c6                	mov    %eax,%esi
    b548:	81 c2 00 08 00 00    	add    $0x800,%edx
    b54e:	c1 ea 02             	shr    $0x2,%edx
    b551:	89 d1                	mov    %edx,%ecx
    b553:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
    b555:	89 ca                	mov    %ecx,%edx
    b557:	8b 3d 40 40 00 00    	mov    0x4040,%edi
    b55d:	8d 87 00 08 00 00    	lea    0x800(%edi),%eax
    b563:	c7 87 00 08 00 00 00 	movl   $0x0,0x800(%edi)
    b56a:	00 00 00 
    b56d:	c7 87 fc 0f 00 00 00 	movl   $0x0,0xffc(%edi)
    b574:	00 00 00 
    b577:	81 c7 04 08 00 00    	add    $0x804,%edi
    b57d:	83 e7 fc             	and    $0xfffffffc,%edi
    b580:	29 f8                	sub    %edi,%eax
    b582:	89 c1                	mov    %eax,%ecx
    b584:	81 c1 00 08 00 00    	add    $0x800,%ecx
    b58a:	c1 e9 02             	shr    $0x2,%ecx
    b58d:	89 d0                	mov    %edx,%eax
    b58f:	f3 ab                	rep stos %eax,%es:(%edi)
    b591:	89 1c 24             	mov    %ebx,(%esp)
    b594:	e8 fb 2f 00 00       	call   e594 <_fclose>
    b599:	8b 1d 00 40 00 00    	mov    0x4000,%ebx
    b59f:	0f bf 93 9c 01 00 00 	movswl 0x19c(%ebx),%edx
    b5a6:	0f bf 83 9e 01 00 00 	movswl 0x19e(%ebx),%eax
    b5ad:	0f af d0             	imul   %eax,%edx
    b5b0:	8d 82 ff 07 00 00    	lea    0x7ff(%edx),%eax
    b5b6:	85 d2                	test   %edx,%edx
    b5b8:	0f 49 c2             	cmovns %edx,%eax
    b5bb:	c1 f8 0b             	sar    $0xb,%eax
    b5be:	89 44 24 04          	mov    %eax,0x4(%esp)
    b5c2:	8b 83 98 01 00 00    	mov    0x198(%ebx),%eax
    b5c8:	89 04 24             	mov    %eax,(%esp)
    b5cb:	e8 5b 31 00 00       	call   e72b <_push_page>
    b5d0:	89 83 98 01 00 00    	mov    %eax,0x198(%ebx)
    b5d6:	c7 04 24 2f f3 00 00 	movl   $0xf32f,(%esp)
    b5dd:	e8 91 11 00 00       	call   c773 <_create_task>
    b5e2:	89 c6                	mov    %eax,%esi
    b5e4:	c7 44 24 04 c0 b7 00 	movl   $0xb7c0,0x4(%esp)
    b5eb:	00 
    b5ec:	89 04 24             	mov    %eax,(%esp)
    b5ef:	e8 84 12 00 00       	call   c878 <_task_init>
    b5f4:	e8 45 30 00 00       	call   e63e <_init_pit>
    b5f9:	c7 04 24 78 ff 00 00 	movl   $0xff78,(%esp)
    b600:	e8 06 30 00 00       	call   e60b <_enable_pic>
    b605:	c7 04 24 37 f3 00 00 	movl   $0xf337,(%esp)
    b60c:	e8 19 19 00 00       	call   cf2a <_puts>
    b611:	89 34 24             	mov    %esi,(%esp)
    b614:	e8 b5 12 00 00       	call   c8ce <_task_ready>
    b619:	8d 9c 24 2c 01 00 00 	lea    0x12c(%esp),%ebx
    b620:	89 1c 24             	mov    %ebx,(%esp)
    b623:	e8 7c 1b 00 00       	call   d1a4 <_fifo_size>
    b628:	85 c0                	test   %eax,%eax
    b62a:	0f 8e 73 01 00 00    	jle    b7a3 <_entry+0x3a3>
    b630:	89 1c 24             	mov    %ebx,(%esp)
    b633:	e8 82 1b 00 00       	call   d1ba <_read_cache>
    b638:	3c e1                	cmp    $0xe1,%al
    b63a:	75 1d                	jne    b659 <_entry+0x259>
    b63c:	89 1c 24             	mov    %ebx,(%esp)
    b63f:	e8 b2 1c 00 00       	call   d2f6 <_read_cache_wait>
    b644:	89 1c 24             	mov    %ebx,(%esp)
    b647:	e8 aa 1c 00 00       	call   d2f6 <_read_cache_wait>
    b64c:	89 1c 24             	mov    %ebx,(%esp)
    b64f:	e8 a2 1c 00 00       	call   d2f6 <_read_cache_wait>
    b654:	e9 4a 01 00 00       	jmp    b7a3 <_entry+0x3a3>
    b659:	3c e0                	cmp    $0xe0,%al
    b65b:	75 0c                	jne    b669 <_entry+0x269>
    b65d:	80 0d 0a 40 00 00 01 	orb    $0x1,0x400a
    b664:	e9 3a 01 00 00       	jmp    b7a3 <_entry+0x3a3>
    b669:	84 c0                	test   %al,%al
    b66b:	79 45                	jns    b6b2 <_entry+0x2b2>
    b66d:	3c b6                	cmp    $0xb6,%al
    b66f:	74 04                	je     b675 <_entry+0x275>
    b671:	3c aa                	cmp    $0xaa,%al
    b673:	75 09                	jne    b67e <_entry+0x27e>
    b675:	80 25 0a 40 00 00 fd 	andb   $0xfd,0x400a
    b67c:	eb 18                	jmp    b696 <_entry+0x296>
    b67e:	3c 38                	cmp    $0x38,%al
    b680:	75 09                	jne    b68b <_entry+0x28b>
    b682:	80 25 0a 40 00 00 ef 	andb   $0xef,0x400a
    b689:	eb 0b                	jmp    b696 <_entry+0x296>
    b68b:	3c 1d                	cmp    $0x1d,%al
    b68d:	75 07                	jne    b696 <_entry+0x296>
    b68f:	80 25 0a 40 00 00 df 	andb   $0xdf,0x400a
    b696:	0f b6 05 0a 40 00 00 	movzbl 0x400a,%eax
    b69d:	a8 01                	test   $0x1,%al
    b69f:	0f 84 7b ff ff ff    	je     b620 <_entry+0x220>
    b6a5:	83 e0 fe             	and    $0xfffffffe,%eax
    b6a8:	a2 0a 40 00 00       	mov    %al,0x400a
    b6ad:	e9 6e ff ff ff       	jmp    b620 <_entry+0x220>
    b6b2:	0f b6 15 0a 40 00 00 	movzbl 0x400a,%edx
    b6b9:	f6 c2 01             	test   $0x1,%dl
    b6bc:	74 15                	je     b6d3 <_entry+0x2d3>
    b6be:	83 e2 fe             	and    $0xfffffffe,%edx
    b6c1:	88 15 0a 40 00 00    	mov    %dl,0x400a
    b6c7:	0f b6 c0             	movzbl %al,%eax
    b6ca:	0f b6 80 70 f4 00 00 	movzbl 0xf470(%eax),%eax
    b6d1:	eb 28                	jmp    b6fb <_entry+0x2fb>
    b6d3:	f6 c2 02             	test   $0x2,%dl
    b6d6:	75 0d                	jne    b6e5 <_entry+0x2e5>
    b6d8:	f6 c2 04             	test   $0x4,%dl
    b6db:	74 14                	je     b6f1 <_entry+0x2f1>
    b6dd:	8d 50 b9             	lea    -0x47(%eax),%edx
    b6e0:	80 fa 0c             	cmp    $0xc,%dl
    b6e3:	77 0c                	ja     b6f1 <_entry+0x2f1>
    b6e5:	0f b6 c0             	movzbl %al,%eax
    b6e8:	0f b6 80 00 f4 00 00 	movzbl 0xf400(%eax),%eax
    b6ef:	eb 0a                	jmp    b6fb <_entry+0x2fb>
    b6f1:	0f b6 c0             	movzbl %al,%eax
    b6f4:	0f b6 80 80 f3 00 00 	movzbl 0xf380(%eax),%eax
    b6fb:	0f b6 15 0a 40 00 00 	movzbl 0x400a,%edx
    b702:	f6 c2 08             	test   $0x8,%dl
    b705:	74 1b                	je     b722 <_entry+0x322>
    b707:	8d 48 bf             	lea    -0x41(%eax),%ecx
    b70a:	80 f9 19             	cmp    $0x19,%cl
    b70d:	77 05                	ja     b714 <_entry+0x314>
    b70f:	83 c0 20             	add    $0x20,%eax
    b712:	eb 0e                	jmp    b722 <_entry+0x322>
    b714:	8d 78 9f             	lea    -0x61(%eax),%edi
    b717:	8d 68 e0             	lea    -0x20(%eax),%ebp
    b71a:	89 f9                	mov    %edi,%ecx
    b71c:	80 f9 19             	cmp    $0x19,%cl
    b71f:	0f 46 c5             	cmovbe %ebp,%eax
    b722:	8d 48 7d             	lea    0x7d(%eax),%ecx
    b725:	80 f9 01             	cmp    $0x1,%cl
    b728:	77 0b                	ja     b735 <_entry+0x335>
    b72a:	83 ca 02             	or     $0x2,%edx
    b72d:	88 15 0a 40 00 00    	mov    %dl,0x400a
    b733:	eb 42                	jmp    b777 <_entry+0x377>
    b735:	3c 88                	cmp    $0x88,%al
    b737:	75 0b                	jne    b744 <_entry+0x344>
    b739:	83 f2 04             	xor    $0x4,%edx
    b73c:	88 15 0a 40 00 00    	mov    %dl,0x400a
    b742:	eb 33                	jmp    b777 <_entry+0x377>
    b744:	3c 87                	cmp    $0x87,%al
    b746:	75 0b                	jne    b753 <_entry+0x353>
    b748:	83 f2 08             	xor    $0x8,%edx
    b74b:	88 15 0a 40 00 00    	mov    %dl,0x400a
    b751:	eb 24                	jmp    b777 <_entry+0x377>
    b753:	8d 48 7b             	lea    0x7b(%eax),%ecx
    b756:	80 f9 01             	cmp    $0x1,%cl
    b759:	77 0b                	ja     b766 <_entry+0x366>
    b75b:	83 ca 10             	or     $0x10,%edx
    b75e:	88 15 0a 40 00 00    	mov    %dl,0x400a
    b764:	eb 11                	jmp    b777 <_entry+0x377>
    b766:	8d 48 7f             	lea    0x7f(%eax),%ecx
    b769:	80 f9 01             	cmp    $0x1,%cl
    b76c:	77 09                	ja     b777 <_entry+0x377>
    b76e:	83 ca 20             	or     $0x20,%edx
    b771:	88 15 0a 40 00 00    	mov    %dl,0x400a
    b777:	0f b6 c0             	movzbl %al,%eax
    b77a:	89 44 24 04          	mov    %eax,0x4(%esp)
    b77e:	8b 46 28             	mov    0x28(%esi),%eax
    b781:	89 04 24             	mov    %eax,(%esp)
    b784:	e8 73 1a 00 00       	call   d1fc <_write_cache>
    b789:	eb 18                	jmp    b7a3 <_entry+0x3a3>
    b78b:	a1 18 40 00 00       	mov    0x4018,%eax
    b790:	89 04 24             	mov    %eax,(%esp)
    b793:	e8 22 1a 00 00       	call   d1ba <_read_cache>
    b798:	0f be d0             	movsbl %al,%edx
    b79b:	89 14 24             	mov    %edx,(%esp)
    b79e:	e8 cf 14 00 00       	call   cc72 <_oputch>
    b7a3:	a1 18 40 00 00       	mov    0x4018,%eax
    b7a8:	89 04 24             	mov    %eax,(%esp)
    b7ab:	e8 f4 19 00 00       	call   d1a4 <_fifo_size>
    b7b0:	85 c0                	test   %eax,%eax
    b7b2:	7f d7                	jg     b78b <_entry+0x38b>
    b7b4:	e8 e1 34 00 00       	call   ec9a <_hlt>
    b7b9:	e9 62 fe ff ff       	jmp    b620 <_entry+0x220>
    b7be:	90                   	nop
    b7bf:	90                   	nop

0000b7c0 <_manager>:
    b7c0:	53                   	push   %ebx
    b7c1:	81 ec 88 00 00 00    	sub    $0x88,%esp
    b7c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    b7ce:	00 
    b7cf:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    b7d3:	89 44 24 04          	mov    %eax,0x4(%esp)
    b7d7:	8d 5c 24 6c          	lea    0x6c(%esp),%ebx
    b7db:	89 1c 24             	mov    %ebx,(%esp)
    b7de:	e8 a1 19 00 00       	call   d184 <_fifo_init>
    b7e3:	e8 0f 11 00 00       	call   c8f7 <_task_now>
    b7e8:	89 58 28             	mov    %ebx,0x28(%eax)
    b7eb:	c7 44 24 14 00 f3 00 	movl   $0xf300,0x14(%esp)
    b7f2:	00 
    b7f3:	c7 44 24 10 04 00 00 	movl   $0x4,0x10(%esp)
    b7fa:	00 
    b7fb:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
    b802:	00 
    b803:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    b80a:	00 
    b80b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    b812:	00 
    b813:	c7 04 24 03 f3 00 00 	movl   $0xf303,(%esp)
    b81a:	e8 5e 12 00 00       	call   ca7d <_exec>
    b81f:	eb fe                	jmp    b81f <_manager+0x5f>

0000b821 <_cls_bg>:
    b821:	83 ec 1c             	sub    $0x1c,%esp
    b824:	8b 15 00 40 00 00    	mov    0x4000,%edx
    b82a:	0f bf 8a 9c 01 00 00 	movswl 0x19c(%edx),%ecx
    b831:	0f bf 82 9e 01 00 00 	movswl 0x19e(%edx),%eax
    b838:	0f af c1             	imul   %ecx,%eax
    b83b:	01 c0                	add    %eax,%eax
    b83d:	8b 92 98 01 00 00    	mov    0x198(%edx),%edx
    b843:	89 44 24 08          	mov    %eax,0x8(%esp)
    b847:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    b84e:	00 
    b84f:	89 14 24             	mov    %edx,(%esp)
    b852:	e8 65 36 00 00       	call   eebc <_memset>
    b857:	83 c4 1c             	add    $0x1c,%esp
    b85a:	c3                   	ret    

0000b85b <_cpuids>:
    b85b:	57                   	push   %edi
    b85c:	56                   	push   %esi
    b85d:	53                   	push   %ebx
    b85e:	83 ec 60             	sub    $0x60,%esp
    b861:	8d 7c 24 1c          	lea    0x1c(%esp),%edi
    b865:	b9 11 00 00 00       	mov    $0x11,%ecx
    b86a:	b8 00 00 00 00       	mov    $0x0,%eax
    b86f:	f3 ab                	rep stos %eax,%es:(%edi)
    b871:	8d 7c 24 1c          	lea    0x1c(%esp),%edi
    b875:	89 7c 24 04          	mov    %edi,0x4(%esp)
    b879:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    b880:	e8 bc 35 00 00       	call   ee41 <_cpuid>
    b885:	8b 15 00 40 00 00    	mov    0x4000,%edx
    b88b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    b88f:	89 82 50 01 00 00    	mov    %eax,0x150(%edx)
    b895:	8b 44 24 28          	mov    0x28(%esp),%eax
    b899:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    b89d:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    b8a1:	89 5c 24 28          	mov    %ebx,0x28(%esp)
    b8a5:	89 44 24 24          	mov    %eax,0x24(%esp)
    b8a9:	8b 74 24 20          	mov    0x20(%esp),%esi
    b8ad:	89 b2 58 01 00 00    	mov    %esi,0x158(%edx)
    b8b3:	89 82 5c 01 00 00    	mov    %eax,0x15c(%edx)
    b8b9:	89 9a 60 01 00 00    	mov    %ebx,0x160(%edx)
    b8bf:	89 7c 24 04          	mov    %edi,0x4(%esp)
    b8c3:	c7 04 24 00 00 00 80 	movl   $0x80000000,(%esp)
    b8ca:	e8 72 35 00 00       	call   ee41 <_cpuid>
    b8cf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    b8d3:	8b 15 00 40 00 00    	mov    0x4000,%edx
    b8d9:	89 82 54 01 00 00    	mov    %eax,0x154(%edx)
    b8df:	3d 03 00 00 80       	cmp    $0x80000003,%eax
    b8e4:	0f 86 9f 00 00 00    	jbe    b989 <_cpuids+0x12e>
    b8ea:	8d 44 24 1c          	lea    0x1c(%esp),%eax
    b8ee:	89 44 24 04          	mov    %eax,0x4(%esp)
    b8f2:	c7 04 24 02 00 00 80 	movl   $0x80000002,(%esp)
    b8f9:	e8 43 35 00 00       	call   ee41 <_cpuid>
    b8fe:	8d 44 24 2c          	lea    0x2c(%esp),%eax
    b902:	89 44 24 04          	mov    %eax,0x4(%esp)
    b906:	c7 04 24 03 00 00 80 	movl   $0x80000003,(%esp)
    b90d:	e8 2f 35 00 00       	call   ee41 <_cpuid>
    b912:	8d 44 24 3c          	lea    0x3c(%esp),%eax
    b916:	89 44 24 04          	mov    %eax,0x4(%esp)
    b91a:	c7 04 24 04 00 00 80 	movl   $0x80000004,(%esp)
    b921:	e8 1b 35 00 00       	call   ee41 <_cpuid>
    b926:	8b 15 00 40 00 00    	mov    0x4000,%edx
    b92c:	8d 82 64 01 00 00    	lea    0x164(%edx),%eax
    b932:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    b936:	89 8a 64 01 00 00    	mov    %ecx,0x164(%edx)
    b93c:	8b 54 24 20          	mov    0x20(%esp),%edx
    b940:	89 50 04             	mov    %edx,0x4(%eax)
    b943:	8b 54 24 24          	mov    0x24(%esp),%edx
    b947:	89 50 08             	mov    %edx,0x8(%eax)
    b94a:	8b 54 24 28          	mov    0x28(%esp),%edx
    b94e:	89 50 0c             	mov    %edx,0xc(%eax)
    b951:	8b 54 24 2c          	mov    0x2c(%esp),%edx
    b955:	89 50 10             	mov    %edx,0x10(%eax)
    b958:	8b 54 24 30          	mov    0x30(%esp),%edx
    b95c:	89 50 14             	mov    %edx,0x14(%eax)
    b95f:	8b 54 24 34          	mov    0x34(%esp),%edx
    b963:	89 50 18             	mov    %edx,0x18(%eax)
    b966:	8b 54 24 38          	mov    0x38(%esp),%edx
    b96a:	89 50 1c             	mov    %edx,0x1c(%eax)
    b96d:	8b 54 24 3c          	mov    0x3c(%esp),%edx
    b971:	89 50 20             	mov    %edx,0x20(%eax)
    b974:	8b 54 24 40          	mov    0x40(%esp),%edx
    b978:	89 50 24             	mov    %edx,0x24(%eax)
    b97b:	8b 54 24 44          	mov    0x44(%esp),%edx
    b97f:	89 50 28             	mov    %edx,0x28(%eax)
    b982:	8b 54 24 48          	mov    0x48(%esp),%edx
    b986:	89 50 2c             	mov    %edx,0x2c(%eax)
    b989:	83 c4 60             	add    $0x60,%esp
    b98c:	5b                   	pop    %ebx
    b98d:	5e                   	pop    %esi
    b98e:	5f                   	pop    %edi
    b98f:	c3                   	ret    

0000b990 <_app_startup>:
    b990:	55                   	push   %ebp
    b991:	57                   	push   %edi
    b992:	56                   	push   %esi
    b993:	53                   	push   %ebx
    b994:	81 ec fc 00 00 00    	sub    $0xfc,%esp
    b99a:	e8 58 0f 00 00       	call   c8f7 <_task_now>
    b99f:	89 c3                	mov    %eax,%ebx
    b9a1:	8b 84 24 10 01 00 00 	mov    0x110(%esp),%eax
    b9a8:	89 04 24             	mov    %eax,(%esp)
    b9ab:	e8 66 2b 00 00       	call   e516 <_fopen>
    b9b0:	89 44 24 38          	mov    %eax,0x38(%esp)
    b9b4:	89 04 24             	mov    %eax,(%esp)
    b9b7:	e8 d0 2b 00 00       	call   e58c <_filepos>
    b9bc:	89 c7                	mov    %eax,%edi
    b9be:	81 38 00 66 65 78    	cmpl   $0x78656600,(%eax)
    b9c4:	74 3b                	je     ba01 <_app_startup+0x71>
    b9c6:	c7 04 24 4c f3 00 00 	movl   $0xf34c,(%esp)
    b9cd:	e8 58 15 00 00       	call   cf2a <_puts>
    b9d2:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
    b9d9:	00 
    b9da:	8b 43 28             	mov    0x28(%ebx),%eax
    b9dd:	89 04 24             	mov    %eax,(%esp)
    b9e0:	e8 17 18 00 00       	call   d1fc <_write_cache>
    b9e5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    b9e9:	8b 43 28             	mov    0x28(%ebx),%eax
    b9ec:	89 04 24             	mov    %eax,(%esp)
    b9ef:	e8 08 18 00 00       	call   d1fc <_write_cache>
    b9f4:	89 1c 24             	mov    %ebx,(%esp)
    b9f7:	e8 da 0f 00 00       	call   c9d6 <_task_delete>
    b9fc:	e9 b5 04 00 00       	jmp    beb6 <_app_startup+0x526>
    ba01:	8b 84 24 1c 01 00 00 	mov    0x11c(%esp),%eax
    ba08:	83 f8 02             	cmp    $0x2,%eax
    ba0b:	74 2b                	je     ba38 <_app_startup+0xa8>
    ba0d:	83 f8 03             	cmp    $0x3,%eax
    ba10:	74 35                	je     ba47 <_app_startup+0xb7>
    ba12:	83 f8 01             	cmp    $0x1,%eax
    ba15:	75 3c                	jne    ba53 <_app_startup+0xc3>
    ba17:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    ba1e:	00 
    ba1f:	8d 44 24 70          	lea    0x70(%esp),%eax
    ba23:	89 44 24 04          	mov    %eax,0x4(%esp)
    ba27:	8d 74 24 5c          	lea    0x5c(%esp),%esi
    ba2b:	89 34 24             	mov    %esi,(%esp)
    ba2e:	e8 51 17 00 00       	call   d184 <_fifo_init>
    ba33:	89 73 28             	mov    %esi,0x28(%ebx)
    ba36:	eb 1b                	jmp    ba53 <_app_startup+0xc3>
    ba38:	8b 84 24 18 01 00 00 	mov    0x118(%esp),%eax
    ba3f:	8b 40 28             	mov    0x28(%eax),%eax
    ba42:	89 43 28             	mov    %eax,0x28(%ebx)
    ba45:	eb 0c                	jmp    ba53 <_app_startup+0xc3>
    ba47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    ba4e:	e8 f5 36 00 00       	call   f148 <_error>
    ba53:	8b 84 24 20 01 00 00 	mov    0x120(%esp),%eax
    ba5a:	83 f8 01             	cmp    $0x1,%eax
    ba5d:	74 05                	je     ba64 <_app_startup+0xd4>
    ba5f:	83 f8 04             	cmp    $0x4,%eax
    ba62:	75 0c                	jne    ba70 <_app_startup+0xe0>
    ba64:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    ba6b:	e8 d8 36 00 00       	call   f148 <_error>
    ba70:	8b 6f 04             	mov    0x4(%edi),%ebp
    ba73:	8b 47 08             	mov    0x8(%edi),%eax
    ba76:	89 44 24 28          	mov    %eax,0x28(%esp)
    ba7a:	8b 77 0c             	mov    0xc(%edi),%esi
    ba7d:	89 74 24 48          	mov    %esi,0x48(%esp)
    ba81:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    ba88:	e8 ec 05 00 00       	call   c079 <_malloc_page>
    ba8d:	89 c6                	mov    %eax,%esi
    ba8f:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
    ba95:	89 44 24 24          	mov    %eax,0x24(%esp)
    ba99:	8d 96 00 20 00 00    	lea    0x2000(%esi),%edx
    ba9f:	89 54 24 30          	mov    %edx,0x30(%esp)
    baa3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    baaa:	00 
    baab:	89 34 24             	mov    %esi,(%esp)
    baae:	e8 78 2c 00 00       	call   e72b <_push_page>
    bab3:	89 44 24 20          	mov    %eax,0x20(%esp)
    bab7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    babe:	00 
    babf:	8b 44 24 24          	mov    0x24(%esp),%eax
    bac3:	89 04 24             	mov    %eax,(%esp)
    bac6:	e8 60 2c 00 00       	call   e72b <_push_page>
    bacb:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    bacf:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    bad6:	00 
    bad7:	8b 54 24 30          	mov    0x30(%esp),%edx
    badb:	89 14 24             	mov    %edx,(%esp)
    bade:	e8 48 2c 00 00       	call   e72b <_push_page>
    bae3:	89 44 24 3c          	mov    %eax,0x3c(%esp)
    bae7:	03 6c 24 28          	add    0x28(%esp),%ebp
    baeb:	89 2c 24             	mov    %ebp,(%esp)
    baee:	e8 86 05 00 00       	call   c079 <_malloc_page>
    baf3:	89 6c 24 40          	mov    %ebp,0x40(%esp)
    baf7:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    bafb:	89 44 24 44          	mov    %eax,0x44(%esp)
    baff:	89 04 24             	mov    %eax,(%esp)
    bb02:	e8 24 2c 00 00       	call   e72b <_push_page>
    bb07:	89 c5                	mov    %eax,%ebp
    bb09:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    bb0d:	8d 41 ff             	lea    -0x1(%ecx),%eax
    bb10:	89 c2                	mov    %eax,%edx
    bb12:	c1 e2 0c             	shl    $0xc,%edx
    bb15:	89 54 24 34          	mov    %edx,0x34(%esp)
    bb19:	01 ea                	add    %ebp,%edx
    bb1b:	89 54 24 28          	mov    %edx,0x28(%esp)
    bb1f:	89 4c 24 18          	mov    %ecx,0x18(%esp)
    bb23:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
    bb2a:	00 
    bb2b:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
    bb32:	00 
    bb33:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    bb37:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    bb3b:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    bb3f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    bb43:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    bb47:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    bb4b:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    bb4f:	89 0c 24             	mov    %ecx,(%esp)
    bb52:	e8 9b 2c 00 00       	call   e7f2 <_local_page>
    bb57:	8d 55 10             	lea    0x10(%ebp),%edx
    bb5a:	8b 4c 24 38          	mov    0x38(%esp),%ecx
    bb5e:	8b 41 18             	mov    0x18(%ecx),%eax
    bb61:	89 44 24 4c          	mov    %eax,0x4c(%esp)
    bb65:	83 e8 10             	sub    $0x10,%eax
    bb68:	83 c7 10             	add    $0x10,%edi
    bb6b:	89 44 24 08          	mov    %eax,0x8(%esp)
    bb6f:	89 7c 24 04          	mov    %edi,0x4(%esp)
    bb73:	89 14 24             	mov    %edx,(%esp)
    bb76:	e8 38 04 00 00       	call   bfb3 <_memcpy>
    bb7b:	8b 7c 24 38          	mov    0x38(%esp),%edi
    bb7f:	89 3c 24             	mov    %edi,(%esp)
    bb82:	e8 0d 2a 00 00       	call   e594 <_fclose>
    bb87:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    bb8e:	e8 e6 04 00 00       	call   c079 <_malloc_page>
    bb93:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    bb9a:	00 
    bb9b:	89 44 24 38          	mov    %eax,0x38(%esp)
    bb9f:	89 04 24             	mov    %eax,(%esp)
    bba2:	e8 84 2b 00 00       	call   e72b <_push_page>
    bba7:	89 c7                	mov    %eax,%edi
    bba9:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
    bbb0:	00 
    bbb1:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
    bbb8:	00 
    bbb9:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    bbc0:	00 
    bbc1:	8b 4c 24 38          	mov    0x38(%esp),%ecx
    bbc5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    bbc9:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    bbcd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    bbd1:	8b 44 24 24          	mov    0x24(%esp),%eax
    bbd5:	89 44 24 04          	mov    %eax,0x4(%esp)
    bbd9:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    bbdd:	89 0c 24             	mov    %ecx,(%esp)
    bbe0:	e8 0d 2c 00 00       	call   e7f2 <_local_page>
    bbe5:	8b 54 24 28          	mov    0x28(%esp),%edx
    bbe9:	89 57 30             	mov    %edx,0x30(%edi)
    bbec:	83 bc 24 14 01 00 00 	cmpl   $0x0,0x114(%esp)
    bbf3:	00 
    bbf4:	74 24                	je     bc1a <_app_startup+0x28a>
    bbf6:	8b 84 24 14 01 00 00 	mov    0x114(%esp),%eax
    bbfd:	89 44 24 04          	mov    %eax,0x4(%esp)
    bc01:	89 14 24             	mov    %edx,(%esp)
    bc04:	e8 8d 08 00 00       	call   c496 <_strcpy>
    bc09:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
    bc10:	8b 54 24 28          	mov    0x28(%esp),%edx
    bc14:	29 ea                	sub    %ebp,%edx
    bc16:	89 d0                	mov    %edx,%eax
    bc18:	eb 13                	jmp    bc2d <_app_startup+0x29d>
    bc1a:	8b 44 24 28          	mov    0x28(%esp),%eax
    bc1e:	c6 00 00             	movb   $0x0,(%eax)
    bc21:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%ebp)
    bc28:	b8 00 00 00 00       	mov    $0x0,%eax
    bc2d:	89 45 04             	mov    %eax,0x4(%ebp)
    bc30:	89 7d 08             	mov    %edi,0x8(%ebp)
    bc33:	8b 44 24 28          	mov    0x28(%esp),%eax
    bc37:	83 c0 40             	add    $0x40,%eax
    bc3a:	89 47 34             	mov    %eax,0x34(%edi)
    bc3d:	8b 94 24 28 01 00 00 	mov    0x128(%esp),%edx
    bc44:	89 54 24 04          	mov    %edx,0x4(%esp)
    bc48:	89 04 24             	mov    %eax,(%esp)
    bc4b:	e8 46 08 00 00       	call   c496 <_strcpy>
    bc50:	c7 44 24 18 08 00 00 	movl   $0x8,0x18(%esp)
    bc57:	00 
    bc58:	c7 44 24 14 09 00 00 	movl   $0x9,0x14(%esp)
    bc5f:	00 
    bc60:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    bc67:	00 
    bc68:	c7 44 24 0c 00 90 00 	movl   $0x9000,0xc(%esp)
    bc6f:	00 
    bc70:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    bc74:	89 44 24 08          	mov    %eax,0x8(%esp)
    bc78:	8b 54 24 24          	mov    0x24(%esp),%edx
    bc7c:	89 54 24 04          	mov    %edx,0x4(%esp)
    bc80:	8b 44 24 20          	mov    0x20(%esp),%eax
    bc84:	89 04 24             	mov    %eax,(%esp)
    bc87:	e8 66 2b 00 00       	call   e7f2 <_local_page>
    bc8c:	c7 44 24 18 07 00 00 	movl   $0x7,0x18(%esp)
    bc93:	00 
    bc94:	c7 44 24 14 00 01 00 	movl   $0x100,0x14(%esp)
    bc9b:	00 
    bc9c:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    bca3:	00 
    bca4:	c7 44 24 0c 00 00 10 	movl   $0x100000,0xc(%esp)
    bcab:	00 
    bcac:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    bcb0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    bcb4:	8b 54 24 24          	mov    0x24(%esp),%edx
    bcb8:	89 54 24 04          	mov    %edx,0x4(%esp)
    bcbc:	8b 44 24 20          	mov    0x20(%esp),%eax
    bcc0:	89 04 24             	mov    %eax,(%esp)
    bcc3:	e8 2a 2b 00 00       	call   e7f2 <_local_page>
    bcc8:	89 77 50             	mov    %esi,0x50(%edi)
    bccb:	8b 44 24 20          	mov    0x20(%esp),%eax
    bccf:	89 47 54             	mov    %eax,0x54(%edi)
    bcd2:	8b 54 24 24          	mov    0x24(%esp),%edx
    bcd6:	89 57 58             	mov    %edx,0x58(%edi)
    bcd9:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    bcdd:	89 4f 5c             	mov    %ecx,0x5c(%edi)
    bce0:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    bce4:	89 4f 60             	mov    %ecx,0x60(%edi)
    bce7:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    bceb:	89 4f 64             	mov    %ecx,0x64(%edi)
    bcee:	89 6f 28             	mov    %ebp,0x28(%edi)
    bcf1:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    bcf8:	00 
    bcf9:	c7 04 24 0c 40 00 00 	movl   $0x400c,(%esp)
    bd00:	e8 d6 02 00 00       	call   bfdb <_alloc>
    bd05:	8b 54 24 34          	mov    0x34(%esp),%edx
    bd09:	81 c2 ff 0f 00 00    	add    $0xfff,%edx
    bd0f:	c7 44 24 0c 9a 40 00 	movl   $0x409a,0xc(%esp)
    bd16:	00 
    bd17:	89 54 24 28          	mov    %edx,0x28(%esp)
    bd1b:	89 54 24 08          	mov    %edx,0x8(%esp)
    bd1f:	c7 44 24 04 00 00 40 	movl   $0x400000,0x4(%esp)
    bd26:	00 
    bd27:	89 44 24 24          	mov    %eax,0x24(%esp)
    bd2b:	89 04 24             	mov    %eax,(%esp)
    bd2e:	e8 0c 2b 00 00       	call   e83f <_set_segmdesc>
    bd33:	c7 44 24 0c 92 40 00 	movl   $0x4092,0xc(%esp)
    bd3a:	00 
    bd3b:	8b 54 24 28          	mov    0x28(%esp),%edx
    bd3f:	89 54 24 08          	mov    %edx,0x8(%esp)
    bd43:	c7 44 24 04 00 00 40 	movl   $0x400000,0x4(%esp)
    bd4a:	00 
    bd4b:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    bd4f:	8d 41 01             	lea    0x1(%ecx),%eax
    bd52:	89 04 24             	mov    %eax,(%esp)
    bd55:	e8 e5 2a 00 00       	call   e83f <_set_segmdesc>
    bd5a:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    bd5e:	8d 04 cd 00 00 00 00 	lea    0x0(,%ecx,8),%eax
    bd65:	89 47 04             	mov    %eax,0x4(%edi)
    bd68:	8b 54 24 48          	mov    0x48(%esp),%edx
    bd6c:	83 c2 10             	add    $0x10,%edx
    bd6f:	89 17                	mov    %edx,(%edi)
    bd71:	83 c0 08             	add    $0x8,%eax
    bd74:	89 47 0c             	mov    %eax,0xc(%edi)
    bd77:	89 43 04             	mov    %eax,0x4(%ebx)
    bd7a:	8b 54 24 34          	mov    0x34(%esp),%edx
    bd7e:	8d 82 f8 0f 00 00    	lea    0xff8(%edx),%eax
    bd84:	89 47 08             	mov    %eax,0x8(%edi)
    bd87:	89 77 20             	mov    %esi,0x20(%edi)
    bd8a:	89 7f 24             	mov    %edi,0x24(%edi)
    bd8d:	89 73 08             	mov    %esi,0x8(%ebx)
    bd90:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    bd97:	00 
    bd98:	89 3c 24             	mov    %edi,(%esp)
    bd9b:	e8 47 31 00 00       	call   eee7 <_app_startup_asm>
    bda0:	c7 43 08 00 80 00 00 	movl   $0x8000,0x8(%ebx)
    bda7:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    bdae:	00 
    bdaf:	8b 4c 24 24          	mov    0x24(%esp),%ecx
    bdb3:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    bdb7:	c7 04 24 0c 40 00 00 	movl   $0x400c,(%esp)
    bdbe:	e8 f7 03 00 00       	call   c1ba <_afree>
    bdc3:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    bdc9:	c7 87 fc 0f 00 00 00 	movl   $0x0,0xffc(%edi)
    bdd0:	00 00 00 
    bdd3:	8d 57 04             	lea    0x4(%edi),%edx
    bdd6:	83 e2 fc             	and    $0xfffffffc,%edx
    bdd9:	29 d7                	sub    %edx,%edi
    bddb:	89 f9                	mov    %edi,%ecx
    bddd:	81 c1 00 10 00 00    	add    $0x1000,%ecx
    bde3:	c1 e9 02             	shr    $0x2,%ecx
    bde6:	b8 00 00 00 00       	mov    $0x0,%eax
    bdeb:	89 d7                	mov    %edx,%edi
    bded:	f3 ab                	rep stos %eax,%es:(%edi)
    bdef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    bdf6:	e8 d5 28 00 00       	call   e6d0 <_pop_page>
    bdfb:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    be02:	00 
    be03:	8b 7c 24 38          	mov    0x38(%esp),%edi
    be07:	c1 ff 0c             	sar    $0xc,%edi
    be0a:	89 3c 24             	mov    %edi,(%esp)
    be0d:	e8 cb 05 00 00       	call   c3dd <_free_page>
    be12:	8b 54 24 34          	mov    0x34(%esp),%edx
    be16:	8d 82 00 10 00 00    	lea    0x1000(%edx),%eax
    be1c:	89 44 24 08          	mov    %eax,0x8(%esp)
    be20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    be27:	00 
    be28:	89 2c 24             	mov    %ebp,(%esp)
    be2b:	e8 8c 30 00 00       	call   eebc <_memset>
    be30:	8b 7c 24 40          	mov    0x40(%esp),%edi
    be34:	89 3c 24             	mov    %edi,(%esp)
    be37:	e8 94 28 00 00       	call   e6d0 <_pop_page>
    be3c:	89 7c 24 04          	mov    %edi,0x4(%esp)
    be40:	8b 4c 24 44          	mov    0x44(%esp),%ecx
    be44:	c1 f9 0c             	sar    $0xc,%ecx
    be47:	89 0c 24             	mov    %ecx,(%esp)
    be4a:	e8 8e 05 00 00       	call   c3dd <_free_page>
    be4f:	c7 44 24 08 00 30 00 	movl   $0x3000,0x8(%esp)
    be56:	00 
    be57:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    be5e:	00 
    be5f:	8b 44 24 20          	mov    0x20(%esp),%eax
    be63:	89 04 24             	mov    %eax,(%esp)
    be66:	e8 51 30 00 00       	call   eebc <_memset>
    be6b:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    be72:	e8 59 28 00 00       	call   e6d0 <_pop_page>
    be77:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
    be7e:	00 
    be7f:	c1 fe 0c             	sar    $0xc,%esi
    be82:	89 34 24             	mov    %esi,(%esp)
    be85:	e8 53 05 00 00       	call   c3dd <_free_page>
    be8a:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
    be91:	00 
    be92:	8b 43 28             	mov    0x28(%ebx),%eax
    be95:	89 04 24             	mov    %eax,(%esp)
    be98:	e8 5f 13 00 00       	call   d1fc <_write_cache>
    be9d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    bea1:	8b 43 28             	mov    0x28(%ebx),%eax
    bea4:	89 04 24             	mov    %eax,(%esp)
    bea7:	e8 50 13 00 00       	call   d1fc <_write_cache>
    beac:	89 1c 24             	mov    %ebx,(%esp)
    beaf:	e8 22 0b 00 00       	call   c9d6 <_task_delete>
    beb4:	eb fe                	jmp    beb4 <_app_startup+0x524>
    beb6:	81 c4 fc 00 00 00    	add    $0xfc,%esp
    bebc:	5b                   	pop    %ebx
    bebd:	5e                   	pop    %esi
    bebe:	5f                   	pop    %edi
    bebf:	5d                   	pop    %ebp
    bec0:	c3                   	ret    
    bec1:	90                   	nop
    bec2:	90                   	nop
    bec3:	90                   	nop

0000bec4 <_init_allocator>:
    bec4:	57                   	push   %edi
    bec5:	56                   	push   %esi
    bec6:	53                   	push   %ebx
    bec7:	c7 05 2c 40 00 00 00 	movl   $0x2000,0x402c
    bece:	20 00 00 
    bed1:	ba 00 20 00 00       	mov    $0x2000,%edx
    bed6:	b9 00 04 00 00       	mov    $0x400,%ecx
    bedb:	b8 00 00 00 00       	mov    $0x0,%eax
    bee0:	89 d7                	mov    %edx,%edi
    bee2:	f3 ab                	rep stos %eax,%es:(%edi)
    bee4:	a1 2c 40 00 00       	mov    0x402c,%eax
    bee9:	c7 00 0c 20 00 00    	movl   $0x200c,(%eax)
    beef:	a1 2c 40 00 00       	mov    0x402c,%eax
    bef4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    befb:	c7 40 08 8e 01 00 00 	movl   $0x18e,0x8(%eax)
    bf02:	66 83 3d 02 05 00 00 	cmpw   $0x0,0x502
    bf09:	00 
    bf0a:	7e 67                	jle    bf73 <_init_allocator+0xaf>
    bf0c:	b8 20 05 00 00       	mov    $0x520,%eax
    bf11:	66 ba 00 00          	mov    $0x0,%dx
    bf15:	bb 00 00 00 00       	mov    $0x0,%ebx
    bf1a:	83 38 01             	cmpl   $0x1,(%eax)
    bf1d:	75 41                	jne    bf60 <_init_allocator+0x9c>
    bf1f:	8b 0d 2c 40 00 00    	mov    0x402c,%ecx
    bf25:	8b 71 04             	mov    0x4(%ecx),%esi
    bf28:	8d 7e 01             	lea    0x1(%esi),%edi
    bf2b:	89 79 04             	mov    %edi,0x4(%ecx)
    bf2e:	8b 78 f0             	mov    -0x10(%eax),%edi
    bf31:	8d 8f ff 0f 00 00    	lea    0xfff(%edi),%ecx
    bf37:	85 ff                	test   %edi,%edi
    bf39:	0f 49 cf             	cmovns %edi,%ecx
    bf3c:	c1 f9 0c             	sar    $0xc,%ecx
    bf3f:	89 0c f5 0c 20 00 00 	mov    %ecx,0x200c(,%esi,8)
    bf46:	8b 78 f8             	mov    -0x8(%eax),%edi
    bf49:	8d 8f ff 0f 00 00    	lea    0xfff(%edi),%ecx
    bf4f:	85 ff                	test   %edi,%edi
    bf51:	0f 49 cf             	cmovns %edi,%ecx
    bf54:	c1 f9 0c             	sar    $0xc,%ecx
    bf57:	89 0c f5 10 20 00 00 	mov    %ecx,0x2010(,%esi,8)
    bf5e:	01 cb                	add    %ecx,%ebx
    bf60:	83 c2 01             	add    $0x1,%edx
    bf63:	83 c0 14             	add    $0x14,%eax
    bf66:	0f bf 0d 02 05 00 00 	movswl 0x502,%ecx
    bf6d:	39 d1                	cmp    %edx,%ecx
    bf6f:	7f a9                	jg     bf1a <_init_allocator+0x56>
    bf71:	eb 05                	jmp    bf78 <_init_allocator+0xb4>
    bf73:	bb 00 00 00 00       	mov    $0x0,%ebx
    bf78:	a1 00 40 00 00       	mov    0x4000,%eax
    bf7d:	89 98 94 01 00 00    	mov    %ebx,0x194(%eax)
    bf83:	5b                   	pop    %ebx
    bf84:	5e                   	pop    %esi
    bf85:	5f                   	pop    %edi
    bf86:	c3                   	ret    

0000bf87 <_mem_left>:
    bf87:	8b 15 2c 40 00 00    	mov    0x402c,%edx
    bf8d:	8b 42 04             	mov    0x4(%edx),%eax
    bf90:	85 c0                	test   %eax,%eax
    bf92:	7e 19                	jle    bfad <_mem_left+0x26>
    bf94:	8b 0a                	mov    (%edx),%ecx
    bf96:	8d 51 04             	lea    0x4(%ecx),%edx
    bf99:	8d 4c c1 04          	lea    0x4(%ecx,%eax,8),%ecx
    bf9d:	b8 00 00 00 00       	mov    $0x0,%eax
    bfa2:	03 02                	add    (%edx),%eax
    bfa4:	83 c2 08             	add    $0x8,%edx
    bfa7:	39 ca                	cmp    %ecx,%edx
    bfa9:	75 f7                	jne    bfa2 <_mem_left+0x1b>
    bfab:	f3 c3                	repz ret 
    bfad:	b8 00 00 00 00       	mov    $0x0,%eax
    bfb2:	c3                   	ret    

0000bfb3 <_memcpy>:
    bfb3:	56                   	push   %esi
    bfb4:	53                   	push   %ebx
    bfb5:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    bfb9:	8b 74 24 10          	mov    0x10(%esp),%esi
    bfbd:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    bfc1:	85 c9                	test   %ecx,%ecx
    bfc3:	74 13                	je     bfd8 <_memcpy+0x25>
    bfc5:	b8 00 00 00 00       	mov    $0x0,%eax
    bfca:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
    bfce:	88 14 03             	mov    %dl,(%ebx,%eax,1)
    bfd1:	83 c0 01             	add    $0x1,%eax
    bfd4:	39 c8                	cmp    %ecx,%eax
    bfd6:	75 f2                	jne    bfca <_memcpy+0x17>
    bfd8:	5b                   	pop    %ebx
    bfd9:	5e                   	pop    %esi
    bfda:	c3                   	ret    

0000bfdb <_alloc>:
    bfdb:	55                   	push   %ebp
    bfdc:	57                   	push   %edi
    bfdd:	56                   	push   %esi
    bfde:	53                   	push   %ebx
    bfdf:	83 ec 1c             	sub    $0x1c,%esp
    bfe2:	8b 44 24 30          	mov    0x30(%esp),%eax
    bfe6:	8b 78 04             	mov    0x4(%eax),%edi
    bfe9:	85 ff                	test   %edi,%edi
    bfeb:	7e 7f                	jle    c06c <_alloc+0x91>
    bfed:	8b 28                	mov    (%eax),%ebp
    bfef:	8b 55 04             	mov    0x4(%ebp),%edx
    bff2:	8b 74 24 34          	mov    0x34(%esp),%esi
    bff6:	39 f2                	cmp    %esi,%edx
    bff8:	74 19                	je     c013 <_alloc+0x38>
    bffa:	8d 45 08             	lea    0x8(%ebp),%eax
    bffd:	b9 00 00 00 00       	mov    $0x0,%ecx
    c002:	39 f2                	cmp    %esi,%edx
    c004:	76 58                	jbe    c05e <_alloc+0x83>
    c006:	eb 41                	jmp    c049 <_alloc+0x6e>
    c008:	89 c3                	mov    %eax,%ebx
    c00a:	8b 50 04             	mov    0x4(%eax),%edx
    c00d:	39 f2                	cmp    %esi,%edx
    c00f:	75 2f                	jne    c040 <_alloc+0x65>
    c011:	eb 02                	jmp    c015 <_alloc+0x3a>
    c013:	89 eb                	mov    %ebp,%ebx
    c015:	89 d8                	mov    %ebx,%eax
    c017:	29 e8                	sub    %ebp,%eax
    c019:	c1 f8 03             	sar    $0x3,%eax
    c01c:	29 c7                	sub    %eax,%edi
    c01e:	c1 e7 02             	shl    $0x2,%edi
    c021:	8d 43 08             	lea    0x8(%ebx),%eax
    c024:	89 7c 24 08          	mov    %edi,0x8(%esp)
    c028:	89 44 24 04          	mov    %eax,0x4(%esp)
    c02c:	89 1c 24             	mov    %ebx,(%esp)
    c02f:	e8 7f ff ff ff       	call   bfb3 <_memcpy>
    c034:	8b 44 24 30          	mov    0x30(%esp),%eax
    c038:	83 68 04 01          	subl   $0x1,0x4(%eax)
    c03c:	8b 03                	mov    (%ebx),%eax
    c03e:	eb 31                	jmp    c071 <_alloc+0x96>
    c040:	83 c0 08             	add    $0x8,%eax
    c043:	39 f2                	cmp    %esi,%edx
    c045:	76 17                	jbe    c05e <_alloc+0x83>
    c047:	eb 02                	jmp    c04b <_alloc+0x70>
    c049:	89 eb                	mov    %ebp,%ebx
    c04b:	8b 03                	mov    (%ebx),%eax
    c04d:	89 c1                	mov    %eax,%ecx
    c04f:	03 4c 24 34          	add    0x34(%esp),%ecx
    c053:	89 0b                	mov    %ecx,(%ebx)
    c055:	2b 54 24 34          	sub    0x34(%esp),%edx
    c059:	89 53 04             	mov    %edx,0x4(%ebx)
    c05c:	eb 13                	jmp    c071 <_alloc+0x96>
    c05e:	83 c1 01             	add    $0x1,%ecx
    c061:	39 f9                	cmp    %edi,%ecx
    c063:	75 a3                	jne    c008 <_alloc+0x2d>
    c065:	b8 00 00 00 00       	mov    $0x0,%eax
    c06a:	eb 05                	jmp    c071 <_alloc+0x96>
    c06c:	b8 00 00 00 00       	mov    $0x0,%eax
    c071:	83 c4 1c             	add    $0x1c,%esp
    c074:	5b                   	pop    %ebx
    c075:	5e                   	pop    %esi
    c076:	5f                   	pop    %edi
    c077:	5d                   	pop    %ebp
    c078:	c3                   	ret    

0000c079 <_malloc_page>:
    c079:	83 ec 1c             	sub    $0x1c,%esp
    c07c:	8b 44 24 20          	mov    0x20(%esp),%eax
    c080:	89 44 24 04          	mov    %eax,0x4(%esp)
    c084:	a1 2c 40 00 00       	mov    0x402c,%eax
    c089:	89 04 24             	mov    %eax,(%esp)
    c08c:	e8 4a ff ff ff       	call   bfdb <_alloc>
    c091:	c1 e0 0c             	shl    $0xc,%eax
    c094:	83 c4 1c             	add    $0x1c,%esp
    c097:	c3                   	ret    

0000c098 <_init_sbh>:
    c098:	53                   	push   %ebx
    c099:	83 ec 18             	sub    $0x18,%esp
    c09c:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    c0a3:	e8 d1 ff ff ff       	call   c079 <_malloc_page>
    c0a8:	89 c3                	mov    %eax,%ebx
    c0aa:	a3 20 40 00 00       	mov    %eax,0x4020
    c0af:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    c0b6:	e8 be ff ff ff       	call   c079 <_malloc_page>
    c0bb:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    c0c2:	00 
    c0c3:	89 04 24             	mov    %eax,(%esp)
    c0c6:	e8 60 26 00 00       	call   e72b <_push_page>
    c0cb:	89 03                	mov    %eax,(%ebx)
    c0cd:	c7 43 04 00 40 00 00 	movl   $0x4000,0x4(%ebx)
    c0d4:	c7 05 28 40 00 00 00 	movl   $0x800,0x4028
    c0db:	08 00 00 
    c0de:	c7 05 24 40 00 00 01 	movl   $0x1,0x4024
    c0e5:	00 00 00 
    c0e8:	83 c4 18             	add    $0x18,%esp
    c0eb:	5b                   	pop    %ebx
    c0ec:	c3                   	ret    

0000c0ed <_malloc>:
    c0ed:	83 ec 1c             	sub    $0x1c,%esp
    c0f0:	8b 44 24 20          	mov    0x20(%esp),%eax
    c0f4:	05 ff 0f 00 00       	add    $0xfff,%eax
    c0f9:	c1 f8 0c             	sar    $0xc,%eax
    c0fc:	89 04 24             	mov    %eax,(%esp)
    c0ff:	e8 75 ff ff ff       	call   c079 <_malloc_page>
    c104:	83 c4 1c             	add    $0x1c,%esp
    c107:	c3                   	ret    

0000c108 <_vramcpy>:
    c108:	55                   	push   %ebp
    c109:	57                   	push   %edi
    c10a:	56                   	push   %esi
    c10b:	53                   	push   %ebx
    c10c:	83 ec 1c             	sub    $0x1c,%esp
    c10f:	a1 00 40 00 00       	mov    0x4000,%eax
    c114:	8b b0 98 01 00 00    	mov    0x198(%eax),%esi
    c11a:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
    c11e:	03 4c 24 38          	add    0x38(%esp),%ecx
    c122:	8b 1d 50 40 00 00    	mov    0x4050,%ebx
    c128:	8b 44 24 34          	mov    0x34(%esp),%eax
    c12c:	03 44 24 30          	add    0x30(%esp),%eax
    c130:	99                   	cltd   
    c131:	f7 fb                	idiv   %ebx
    c133:	c1 e0 08             	shl    $0x8,%eax
    c136:	0f af c3             	imul   %ebx,%eax
    c139:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    c13c:	89 d0                	mov    %edx,%eax
    c13e:	c1 e0 04             	shl    $0x4,%eax
    c141:	01 c7                	add    %eax,%edi
    c143:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    c147:	c1 e5 08             	shl    $0x8,%ebp
    c14a:	89 c8                	mov    %ecx,%eax
    c14c:	99                   	cltd   
    c14d:	f7 fb                	idiv   %ebx
    c14f:	c1 e0 08             	shl    $0x8,%eax
    c152:	0f af d8             	imul   %eax,%ebx
    c155:	01 de                	add    %ebx,%esi
    c157:	c1 e2 04             	shl    $0x4,%edx
    c15a:	01 d6                	add    %edx,%esi
    c15c:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    c160:	89 74 24 04          	mov    %esi,0x4(%esp)
    c164:	89 3c 24             	mov    %edi,(%esp)
    c167:	e8 47 fe ff ff       	call   bfb3 <_memcpy>
    c16c:	83 c4 1c             	add    $0x1c,%esp
    c16f:	5b                   	pop    %ebx
    c170:	5e                   	pop    %esi
    c171:	5f                   	pop    %edi
    c172:	5d                   	pop    %ebp
    c173:	c3                   	ret    

0000c174 <_memmove>:
    c174:	56                   	push   %esi
    c175:	53                   	push   %ebx
    c176:	8b 54 24 0c          	mov    0xc(%esp),%edx
    c17a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
    c17e:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    c182:	39 ca                	cmp    %ecx,%edx
    c184:	73 1b                	jae    c1a1 <_memmove+0x2d>
    c186:	85 db                	test   %ebx,%ebx
    c188:	74 2d                	je     c1b7 <_memmove+0x43>
    c18a:	89 de                	mov    %ebx,%esi
    c18c:	b8 00 00 00 00       	mov    $0x0,%eax
    c191:	0f b6 1c 01          	movzbl (%ecx,%eax,1),%ebx
    c195:	88 1c 02             	mov    %bl,(%edx,%eax,1)
    c198:	83 c0 01             	add    $0x1,%eax
    c19b:	39 f0                	cmp    %esi,%eax
    c19d:	75 f2                	jne    c191 <_memmove+0x1d>
    c19f:	eb 16                	jmp    c1b7 <_memmove+0x43>
    c1a1:	8d 43 ff             	lea    -0x1(%ebx),%eax
    c1a4:	85 db                	test   %ebx,%ebx
    c1a6:	74 0f                	je     c1b7 <_memmove+0x43>
    c1a8:	0f b6 1c 01          	movzbl (%ecx,%eax,1),%ebx
    c1ac:	88 1c 02             	mov    %bl,(%edx,%eax,1)
    c1af:	83 e8 01             	sub    $0x1,%eax
    c1b2:	83 f8 ff             	cmp    $0xffffffff,%eax
    c1b5:	75 f1                	jne    c1a8 <_memmove+0x34>
    c1b7:	5b                   	pop    %ebx
    c1b8:	5e                   	pop    %esi
    c1b9:	c3                   	ret    

0000c1ba <_afree>:
    c1ba:	55                   	push   %ebp
    c1bb:	57                   	push   %edi
    c1bc:	56                   	push   %esi
    c1bd:	53                   	push   %ebx
    c1be:	83 ec 18             	sub    $0x18,%esp
    c1c1:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    c1c5:	8b 7c 24 30          	mov    0x30(%esp),%edi
    c1c9:	8b 56 04             	mov    0x4(%esi),%edx
    c1cc:	85 d2                	test   %edx,%edx
    c1ce:	7e 5e                	jle    c22e <_afree+0x74>
    c1d0:	8b 2e                	mov    (%esi),%ebp
    c1d2:	89 f9                	mov    %edi,%ecx
    c1d4:	03 4c 24 34          	add    0x34(%esp),%ecx
    c1d8:	8d 45 08             	lea    0x8(%ebp),%eax
    c1db:	bb 00 00 00 00       	mov    $0x0,%ebx
    c1e0:	39 4d 00             	cmp    %ecx,0x0(%ebp)
    c1e3:	72 3b                	jb     c220 <_afree+0x66>
    c1e5:	eb 0c                	jmp    c1f3 <_afree+0x39>
    c1e7:	89 c5                	mov    %eax,%ebp
    c1e9:	83 c0 08             	add    $0x8,%eax
    c1ec:	39 48 f8             	cmp    %ecx,-0x8(%eax)
    c1ef:	72 2f                	jb     c220 <_afree+0x66>
    c1f1:	eb 05                	jmp    c1f8 <_afree+0x3e>
    c1f3:	bb 00 00 00 00       	mov    $0x0,%ebx
    c1f8:	29 da                	sub    %ebx,%edx
    c1fa:	c1 e2 03             	shl    $0x3,%edx
    c1fd:	89 54 24 08          	mov    %edx,0x8(%esp)
    c201:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    c205:	8d 45 08             	lea    0x8(%ebp),%eax
    c208:	89 04 24             	mov    %eax,(%esp)
    c20b:	e8 64 ff ff ff       	call   c174 <_memmove>
    c210:	89 7d 00             	mov    %edi,0x0(%ebp)
    c213:	8b 44 24 34          	mov    0x34(%esp),%eax
    c217:	89 45 04             	mov    %eax,0x4(%ebp)
    c21a:	83 46 04 01          	addl   $0x1,0x4(%esi)
    c21e:	eb 13                	jmp    c233 <_afree+0x79>
    c220:	83 c3 01             	add    $0x1,%ebx
    c223:	39 d3                	cmp    %edx,%ebx
    c225:	75 c0                	jne    c1e7 <_afree+0x2d>
    c227:	bb 00 00 00 00       	mov    $0x0,%ebx
    c22c:	eb 05                	jmp    c233 <_afree+0x79>
    c22e:	bb 00 00 00 00       	mov    $0x0,%ebx
    c233:	8b 0e                	mov    (%esi),%ecx
    c235:	8d 04 dd f8 ff ff ff 	lea    -0x8(,%ebx,8),%eax
    c23c:	8d 14 01             	lea    (%ecx,%eax,1),%edx
    c23f:	8d 6c 01 08          	lea    0x8(%ecx,%eax,1),%ebp
    c243:	89 6c 24 10          	mov    %ebp,0x10(%esp)
    c247:	8d 44 01 10          	lea    0x10(%ecx,%eax,1),%eax
    c24b:	8b 0a                	mov    (%edx),%ecx
    c24d:	89 4c 24 14          	mov    %ecx,0x14(%esp)
    c251:	8b 4a 04             	mov    0x4(%edx),%ecx
    c254:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    c258:	89 fd                	mov    %edi,%ebp
    c25a:	03 6c 24 34          	add    0x34(%esp),%ebp
    c25e:	39 28                	cmp    %ebp,(%eax)
    c260:	0f 94 c1             	sete   %cl
    c263:	0f b6 c9             	movzbl %cl,%ecx
    c266:	89 cd                	mov    %ecx,%ebp
    c268:	85 db                	test   %ebx,%ebx
    c26a:	74 2a                	je     c296 <_afree+0xdc>
    c26c:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    c270:	03 4c 24 0c          	add    0xc(%esp),%ecx
    c274:	39 f9                	cmp    %edi,%ecx
    c276:	0f 94 c1             	sete   %cl
    c279:	0f b6 c9             	movzbl %cl,%ecx
    c27c:	89 cf                	mov    %ecx,%edi
    c27e:	8b 4e 04             	mov    0x4(%esi),%ecx
    c281:	83 e9 01             	sub    $0x1,%ecx
    c284:	39 d9                	cmp    %ebx,%ecx
    c286:	0f 84 a7 00 00 00    	je     c333 <_afree+0x179>
    c28c:	85 ff                	test   %edi,%edi
    c28e:	74 06                	je     c296 <_afree+0xdc>
    c290:	85 ed                	test   %ebp,%ebp
    c292:	75 6a                	jne    c2fe <_afree+0x144>
    c294:	eb 0a                	jmp    c2a0 <_afree+0xe6>
    c296:	85 ed                	test   %ebp,%ebp
    c298:	0f 84 9d 00 00 00    	je     c33b <_afree+0x181>
    c29e:	eb 2f                	jmp    c2cf <_afree+0x115>
    c2a0:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    c2a4:	03 4c 24 34          	add    0x34(%esp),%ecx
    c2a8:	89 4a 04             	mov    %ecx,0x4(%edx)
    c2ab:	f7 d3                	not    %ebx
    c2ad:	89 da                	mov    %ebx,%edx
    c2af:	03 56 04             	add    0x4(%esi),%edx
    c2b2:	c1 e2 03             	shl    $0x3,%edx
    c2b5:	89 54 24 08          	mov    %edx,0x8(%esp)
    c2b9:	89 44 24 04          	mov    %eax,0x4(%esp)
    c2bd:	8b 44 24 10          	mov    0x10(%esp),%eax
    c2c1:	89 04 24             	mov    %eax,(%esp)
    c2c4:	e8 ab fe ff ff       	call   c174 <_memmove>
    c2c9:	83 6e 04 01          	subl   $0x1,0x4(%esi)
    c2cd:	eb 6c                	jmp    c33b <_afree+0x181>
    c2cf:	8b 50 04             	mov    0x4(%eax),%edx
    c2d2:	8b 7c 24 10          	mov    0x10(%esp),%edi
    c2d6:	01 57 04             	add    %edx,0x4(%edi)
    c2d9:	8b 56 04             	mov    0x4(%esi),%edx
    c2dc:	29 da                	sub    %ebx,%edx
    c2de:	8d 14 d5 f0 ff ff ff 	lea    -0x10(,%edx,8),%edx
    c2e5:	89 54 24 08          	mov    %edx,0x8(%esp)
    c2e9:	8d 50 08             	lea    0x8(%eax),%edx
    c2ec:	89 54 24 04          	mov    %edx,0x4(%esp)
    c2f0:	89 04 24             	mov    %eax,(%esp)
    c2f3:	e8 7c fe ff ff       	call   c174 <_memmove>
    c2f8:	83 6e 04 01          	subl   $0x1,0x4(%esi)
    c2fc:	eb 3d                	jmp    c33b <_afree+0x181>
    c2fe:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    c302:	03 48 04             	add    0x4(%eax),%ecx
    c305:	03 4c 24 34          	add    0x34(%esp),%ecx
    c309:	89 4a 04             	mov    %ecx,0x4(%edx)
    c30c:	8b 56 04             	mov    0x4(%esi),%edx
    c30f:	8d 14 d5 f0 ff ff ff 	lea    -0x10(,%edx,8),%edx
    c316:	89 54 24 08          	mov    %edx,0x8(%esp)
    c31a:	83 c0 08             	add    $0x8,%eax
    c31d:	89 44 24 04          	mov    %eax,0x4(%esp)
    c321:	8b 44 24 10          	mov    0x10(%esp),%eax
    c325:	89 04 24             	mov    %eax,(%esp)
    c328:	e8 47 fe ff ff       	call   c174 <_memmove>
    c32d:	83 6e 04 02          	subl   $0x2,0x4(%esi)
    c331:	eb 08                	jmp    c33b <_afree+0x181>
    c333:	85 ff                	test   %edi,%edi
    c335:	0f 85 65 ff ff ff    	jne    c2a0 <_afree+0xe6>
    c33b:	83 c4 18             	add    $0x18,%esp
    c33e:	5b                   	pop    %ebx
    c33f:	5e                   	pop    %esi
    c340:	5f                   	pop    %edi
    c341:	5d                   	pop    %ebp
    c342:	c3                   	ret    

0000c343 <_sbh_resize>:
    c343:	53                   	push   %ebx
    c344:	83 ec 18             	sub    $0x18,%esp
    c347:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    c34e:	e8 26 fd ff ff       	call   c079 <_malloc_page>
    c353:	89 c3                	mov    %eax,%ebx
    c355:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    c35c:	e8 a5 05 00 00       	call   c906 <_find_task>
    c361:	c7 44 24 08 04 00 00 	movl   $0x4,0x8(%esp)
    c368:	00 
    c369:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    c36d:	89 04 24             	mov    %eax,(%esp)
    c370:	e8 1a 24 00 00       	call   e78f <_push_task_page>
    c375:	c7 44 24 08 00 40 00 	movl   $0x4000,0x8(%esp)
    c37c:	00 
    c37d:	89 44 24 04          	mov    %eax,0x4(%esp)
    c381:	c7 04 24 20 40 00 00 	movl   $0x4020,(%esp)
    c388:	e8 2d fe ff ff       	call   c1ba <_afree>
    c38d:	83 c4 18             	add    $0x18,%esp
    c390:	5b                   	pop    %ebx
    c391:	c3                   	ret    

0000c392 <_sbh_alloc>:
    c392:	53                   	push   %ebx
    c393:	83 ec 18             	sub    $0x18,%esp
    c396:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    c39a:	eb 05                	jmp    c3a1 <_sbh_alloc+0xf>
    c39c:	e8 a2 ff ff ff       	call   c343 <_sbh_resize>
    c3a1:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    c3a5:	c7 04 24 20 40 00 00 	movl   $0x4020,(%esp)
    c3ac:	e8 2a fc ff ff       	call   bfdb <_alloc>
    c3b1:	85 c0                	test   %eax,%eax
    c3b3:	74 e7                	je     c39c <_sbh_alloc+0xa>
    c3b5:	83 c4 18             	add    $0x18,%esp
    c3b8:	5b                   	pop    %ebx
    c3b9:	c3                   	ret    

0000c3ba <_sbh_free>:
    c3ba:	83 ec 0c             	sub    $0xc,%esp
    c3bd:	8b 44 24 14          	mov    0x14(%esp),%eax
    c3c1:	89 44 24 08          	mov    %eax,0x8(%esp)
    c3c5:	8b 44 24 10          	mov    0x10(%esp),%eax
    c3c9:	89 44 24 04          	mov    %eax,0x4(%esp)
    c3cd:	c7 04 24 20 40 00 00 	movl   $0x4020,(%esp)
    c3d4:	e8 e1 fd ff ff       	call   c1ba <_afree>
    c3d9:	83 c4 0c             	add    $0xc,%esp
    c3dc:	c3                   	ret    

0000c3dd <_free_page>:
    c3dd:	83 ec 0c             	sub    $0xc,%esp
    c3e0:	8b 44 24 14          	mov    0x14(%esp),%eax
    c3e4:	89 44 24 08          	mov    %eax,0x8(%esp)
    c3e8:	8b 44 24 10          	mov    0x10(%esp),%eax
    c3ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    c3f0:	a1 2c 40 00 00       	mov    0x402c,%eax
    c3f5:	89 04 24             	mov    %eax,(%esp)
    c3f8:	e8 bd fd ff ff       	call   c1ba <_afree>
    c3fd:	83 c4 0c             	add    $0xc,%esp
    c400:	c3                   	ret    

0000c401 <_free>:
    c401:	83 ec 08             	sub    $0x8,%esp
    c404:	8b 44 24 10          	mov    0x10(%esp),%eax
    c408:	05 ff 0f 00 00       	add    $0xfff,%eax
    c40d:	c1 f8 0c             	sar    $0xc,%eax
    c410:	89 44 24 04          	mov    %eax,0x4(%esp)
    c414:	8b 44 24 0c          	mov    0xc(%esp),%eax
    c418:	05 ff 0f 00 00       	add    $0xfff,%eax
    c41d:	c1 f8 0c             	sar    $0xc,%eax
    c420:	89 04 24             	mov    %eax,(%esp)
    c423:	e8 b5 ff ff ff       	call   c3dd <_free_page>
    c428:	83 c4 08             	add    $0x8,%esp
    c42b:	c3                   	ret    

0000c42c <_vrammove>:
    c42c:	57                   	push   %edi
    c42d:	56                   	push   %esi
    c42e:	53                   	push   %ebx
    c42f:	83 ec 0c             	sub    $0xc,%esp
    c432:	a1 00 40 00 00       	mov    0x4000,%eax
    c437:	8b b0 98 01 00 00    	mov    0x198(%eax),%esi
    c43d:	8b 44 24 28          	mov    0x28(%esp),%eax
    c441:	03 44 24 24          	add    0x24(%esp),%eax
    c445:	8b 1d 50 40 00 00    	mov    0x4050,%ebx
    c44b:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    c44f:	03 4c 24 1c          	add    0x1c(%esp),%ecx
    c453:	8b 54 24 2c          	mov    0x2c(%esp),%edx
    c457:	c1 e2 08             	shl    $0x8,%edx
    c45a:	89 54 24 08          	mov    %edx,0x8(%esp)
    c45e:	99                   	cltd   
    c45f:	f7 fb                	idiv   %ebx
    c461:	c1 e0 08             	shl    $0x8,%eax
    c464:	0f af c3             	imul   %ebx,%eax
    c467:	8d 3c 06             	lea    (%esi,%eax,1),%edi
    c46a:	89 d0                	mov    %edx,%eax
    c46c:	c1 e0 04             	shl    $0x4,%eax
    c46f:	01 c7                	add    %eax,%edi
    c471:	89 7c 24 04          	mov    %edi,0x4(%esp)
    c475:	89 c8                	mov    %ecx,%eax
    c477:	99                   	cltd   
    c478:	f7 fb                	idiv   %ebx
    c47a:	c1 e0 08             	shl    $0x8,%eax
    c47d:	0f af d8             	imul   %eax,%ebx
    c480:	01 de                	add    %ebx,%esi
    c482:	c1 e2 04             	shl    $0x4,%edx
    c485:	01 d6                	add    %edx,%esi
    c487:	89 34 24             	mov    %esi,(%esp)
    c48a:	e8 e5 fc ff ff       	call   c174 <_memmove>
    c48f:	83 c4 0c             	add    $0xc,%esp
    c492:	5b                   	pop    %ebx
    c493:	5e                   	pop    %esi
    c494:	5f                   	pop    %edi
    c495:	c3                   	ret    

0000c496 <_strcpy>:
    c496:	8b 44 24 04          	mov    0x4(%esp),%eax
    c49a:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    c49e:	0f b6 11             	movzbl (%ecx),%edx
    c4a1:	84 d2                	test   %dl,%dl
    c4a3:	74 10                	je     c4b5 <_strcpy+0x1f>
    c4a5:	83 c0 01             	add    $0x1,%eax
    c4a8:	83 c1 01             	add    $0x1,%ecx
    c4ab:	88 50 ff             	mov    %dl,-0x1(%eax)
    c4ae:	0f b6 11             	movzbl (%ecx),%edx
    c4b1:	84 d2                	test   %dl,%dl
    c4b3:	75 f0                	jne    c4a5 <_strcpy+0xf>
    c4b5:	c6 00 00             	movb   $0x0,(%eax)
    c4b8:	c3                   	ret    

0000c4b9 <_strcat>:
    c4b9:	8b 44 24 04          	mov    0x4(%esp),%eax
    c4bd:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    c4c1:	80 38 00             	cmpb   $0x0,(%eax)
    c4c4:	74 08                	je     c4ce <_strcat+0x15>
    c4c6:	83 c0 01             	add    $0x1,%eax
    c4c9:	80 38 00             	cmpb   $0x0,(%eax)
    c4cc:	75 f8                	jne    c4c6 <_strcat+0xd>
    c4ce:	0f b6 11             	movzbl (%ecx),%edx
    c4d1:	84 d2                	test   %dl,%dl
    c4d3:	74 10                	je     c4e5 <_strcat+0x2c>
    c4d5:	83 c0 01             	add    $0x1,%eax
    c4d8:	83 c1 01             	add    $0x1,%ecx
    c4db:	88 50 ff             	mov    %dl,-0x1(%eax)
    c4de:	0f b6 11             	movzbl (%ecx),%edx
    c4e1:	84 d2                	test   %dl,%dl
    c4e3:	75 f0                	jne    c4d5 <_strcat+0x1c>
    c4e5:	c6 00 00             	movb   $0x0,(%eax)
    c4e8:	c3                   	ret    

0000c4e9 <_dispalocr>:
    c4e9:	55                   	push   %ebp
    c4ea:	57                   	push   %edi
    c4eb:	56                   	push   %esi
    c4ec:	53                   	push   %ebx
    c4ed:	83 ec 1c             	sub    $0x1c,%esp
    c4f0:	8b 7c 24 30          	mov    0x30(%esp),%edi
    c4f4:	83 7f 04 00          	cmpl   $0x0,0x4(%edi)
    c4f8:	7e 35                	jle    c52f <_dispalocr+0x46>
    c4fa:	bb 00 00 00 00       	mov    $0x0,%ebx
    c4ff:	bd 00 00 00 00       	mov    $0x0,%ebp
    c504:	8b 07                	mov    (%edi),%eax
    c506:	8d 34 d8             	lea    (%eax,%ebx,8),%esi
    c509:	8b 46 04             	mov    0x4(%esi),%eax
    c50c:	89 44 24 08          	mov    %eax,0x8(%esp)
    c510:	8b 06                	mov    (%esi),%eax
    c512:	89 44 24 04          	mov    %eax,0x4(%esp)
    c516:	c7 04 24 00 f5 00 00 	movl   $0xf500,(%esp)
    c51d:	e8 0e 0b 00 00       	call   d030 <_printf>
    c522:	03 6e 04             	add    0x4(%esi),%ebp
    c525:	83 c3 01             	add    $0x1,%ebx
    c528:	39 5f 04             	cmp    %ebx,0x4(%edi)
    c52b:	7f d7                	jg     c504 <_dispalocr+0x1b>
    c52d:	eb 05                	jmp    c534 <_dispalocr+0x4b>
    c52f:	bd 00 00 00 00       	mov    $0x0,%ebp
    c534:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    c538:	c7 04 24 07 f5 00 00 	movl   $0xf507,(%esp)
    c53f:	e8 ec 0a 00 00       	call   d030 <_printf>
    c544:	83 c4 1c             	add    $0x1c,%esp
    c547:	5b                   	pop    %ebx
    c548:	5e                   	pop    %esi
    c549:	5f                   	pop    %edi
    c54a:	5d                   	pop    %ebp
    c54b:	c3                   	ret    

0000c54c <_dispmem>:
    c54c:	83 ec 1c             	sub    $0x1c,%esp
    c54f:	a1 2c 40 00 00       	mov    0x402c,%eax
    c554:	89 04 24             	mov    %eax,(%esp)
    c557:	e8 8d ff ff ff       	call   c4e9 <_dispalocr>
    c55c:	83 c4 1c             	add    $0x1c,%esp
    c55f:	c3                   	ret    

0000c560 <_disable_page>:
    c560:	55                   	push   %ebp
    c561:	57                   	push   %edi
    c562:	56                   	push   %esi
    c563:	53                   	push   %ebx
    c564:	83 ec 2c             	sub    $0x2c,%esp
    c567:	8b 35 2c 40 00 00    	mov    0x402c,%esi
    c56d:	8b 46 04             	mov    0x4(%esi),%eax
    c570:	85 c0                	test   %eax,%eax
    c572:	0f 8e 14 01 00 00    	jle    c68c <_disable_page+0x12c>
    c578:	bf 00 00 00 00       	mov    $0x0,%edi
    c57d:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
    c584:	00 
    c585:	8b 54 24 40          	mov    0x40(%esp),%edx
    c589:	03 54 24 44          	add    0x44(%esp),%edx
    c58d:	89 54 24 1c          	mov    %edx,0x1c(%esp)
    c591:	89 fb                	mov    %edi,%ebx
    c593:	03 1e                	add    (%esi),%ebx
    c595:	8b 2b                	mov    (%ebx),%ebp
    c597:	3b 6c 24 40          	cmp    0x40(%esp),%ebp
    c59b:	75 46                	jne    c5e3 <_disable_page+0x83>
    c59d:	8b 53 04             	mov    0x4(%ebx),%edx
    c5a0:	3b 54 24 44          	cmp    0x44(%esp),%edx
    c5a4:	77 2b                	ja     c5d1 <_disable_page+0x71>
    c5a6:	89 fa                	mov    %edi,%edx
    c5a8:	c1 fa 03             	sar    $0x3,%edx
    c5ab:	29 d0                	sub    %edx,%eax
    c5ad:	c1 e0 03             	shl    $0x3,%eax
    c5b0:	8d 53 08             	lea    0x8(%ebx),%edx
    c5b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    c5b7:	89 54 24 04          	mov    %edx,0x4(%esp)
    c5bb:	89 1c 24             	mov    %ebx,(%esp)
    c5be:	e8 f0 f9 ff ff       	call   bfb3 <_memcpy>
    c5c3:	a1 2c 40 00 00       	mov    0x402c,%eax
    c5c8:	83 68 04 01          	subl   $0x1,0x4(%eax)
    c5cc:	e9 9e 00 00 00       	jmp    c66f <_disable_page+0x10f>
    c5d1:	03 6c 24 44          	add    0x44(%esp),%ebp
    c5d5:	89 2b                	mov    %ebp,(%ebx)
    c5d7:	2b 54 24 44          	sub    0x44(%esp),%edx
    c5db:	89 53 04             	mov    %edx,0x4(%ebx)
    c5de:	e9 8c 00 00 00       	jmp    c66f <_disable_page+0x10f>
    c5e3:	8b 53 04             	mov    0x4(%ebx),%edx
    c5e6:	8d 0c 2a             	lea    (%edx,%ebp,1),%ecx
    c5e9:	3b 4c 24 1c          	cmp    0x1c(%esp),%ecx
    c5ed:	75 37                	jne    c626 <_disable_page+0xc6>
    c5ef:	3b 54 24 44          	cmp    0x44(%esp),%edx
    c5f3:	77 28                	ja     c61d <_disable_page+0xbd>
    c5f5:	89 fa                	mov    %edi,%edx
    c5f7:	c1 fa 03             	sar    $0x3,%edx
    c5fa:	29 d0                	sub    %edx,%eax
    c5fc:	c1 e0 03             	shl    $0x3,%eax
    c5ff:	8d 53 08             	lea    0x8(%ebx),%edx
    c602:	89 44 24 08          	mov    %eax,0x8(%esp)
    c606:	89 54 24 04          	mov    %edx,0x4(%esp)
    c60a:	89 1c 24             	mov    %ebx,(%esp)
    c60d:	e8 a1 f9 ff ff       	call   bfb3 <_memcpy>
    c612:	a1 2c 40 00 00       	mov    0x402c,%eax
    c617:	83 68 04 01          	subl   $0x1,0x4(%eax)
    c61b:	eb 52                	jmp    c66f <_disable_page+0x10f>
    c61d:	2b 54 24 44          	sub    0x44(%esp),%edx
    c621:	89 53 04             	mov    %edx,0x4(%ebx)
    c624:	eb 49                	jmp    c66f <_disable_page+0x10f>
    c626:	3b 4c 24 1c          	cmp    0x1c(%esp),%ecx
    c62a:	76 43                	jbe    c66f <_disable_page+0x10f>
    c62c:	3b 6c 24 40          	cmp    0x40(%esp),%ebp
    c630:	73 3d                	jae    c66f <_disable_page+0x10f>
    c632:	89 fa                	mov    %edi,%edx
    c634:	c1 fa 03             	sar    $0x3,%edx
    c637:	29 d0                	sub    %edx,%eax
    c639:	c1 e0 03             	shl    $0x3,%eax
    c63c:	89 44 24 08          	mov    %eax,0x8(%esp)
    c640:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    c644:	8d 43 08             	lea    0x8(%ebx),%eax
    c647:	89 04 24             	mov    %eax,(%esp)
    c64a:	e8 25 fb ff ff       	call   c174 <_memmove>
    c64f:	8b 54 24 40          	mov    0x40(%esp),%edx
    c653:	29 ea                	sub    %ebp,%edx
    c655:	89 53 04             	mov    %edx,0x4(%ebx)
    c658:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    c65c:	89 43 08             	mov    %eax,0x8(%ebx)
    c65f:	8b 43 0c             	mov    0xc(%ebx),%eax
    c662:	2b 44 24 44          	sub    0x44(%esp),%eax
    c666:	29 d0                	sub    %edx,%eax
    c668:	89 43 0c             	mov    %eax,0xc(%ebx)
    c66b:	83 46 04 01          	addl   $0x1,0x4(%esi)
    c66f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
    c674:	8b 4c 24 18          	mov    0x18(%esp),%ecx
    c678:	8b 35 2c 40 00 00    	mov    0x402c,%esi
    c67e:	8b 46 04             	mov    0x4(%esi),%eax
    c681:	83 c7 08             	add    $0x8,%edi
    c684:	39 c8                	cmp    %ecx,%eax
    c686:	0f 8f 05 ff ff ff    	jg     c591 <_disable_page+0x31>
    c68c:	83 c4 2c             	add    $0x2c,%esp
    c68f:	5b                   	pop    %ebx
    c690:	5e                   	pop    %esi
    c691:	5f                   	pop    %edi
    c692:	5d                   	pop    %ebp
    c693:	c3                   	ret    

0000c694 <_strcmp>:
    c694:	53                   	push   %ebx
    c695:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    c699:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    c69d:	0f b6 01             	movzbl (%ecx),%eax
    c6a0:	3a 03                	cmp    (%ebx),%al
    c6a2:	75 22                	jne    c6c6 <_strcmp+0x32>
    c6a4:	84 c0                	test   %al,%al
    c6a6:	74 25                	je     c6cd <_strcmp+0x39>
    c6a8:	b8 00 00 00 00       	mov    $0x0,%eax
    c6ad:	eb 04                	jmp    c6b3 <_strcmp+0x1f>
    c6af:	84 d2                	test   %dl,%dl
    c6b1:	74 21                	je     c6d4 <_strcmp+0x40>
    c6b3:	83 c0 01             	add    $0x1,%eax
    c6b6:	0f b6 14 01          	movzbl (%ecx,%eax,1),%edx
    c6ba:	3a 14 03             	cmp    (%ebx,%eax,1),%dl
    c6bd:	74 f0                	je     c6af <_strcmp+0x1b>
    c6bf:	b8 01 00 00 00       	mov    $0x1,%eax
    c6c4:	eb 13                	jmp    c6d9 <_strcmp+0x45>
    c6c6:	b8 01 00 00 00       	mov    $0x1,%eax
    c6cb:	eb 0c                	jmp    c6d9 <_strcmp+0x45>
    c6cd:	b8 00 00 00 00       	mov    $0x0,%eax
    c6d2:	eb 05                	jmp    c6d9 <_strcmp+0x45>
    c6d4:	b8 00 00 00 00       	mov    $0x0,%eax
    c6d9:	5b                   	pop    %ebx
    c6da:	c3                   	ret    
    c6db:	90                   	nop

0000c6dc <_init_mt>:
    c6dc:	57                   	push   %edi
    c6dd:	83 ec 18             	sub    $0x18,%esp
    c6e0:	c7 04 24 00 2c 00 00 	movl   $0x2c00,(%esp)
    c6e7:	e8 01 fa ff ff       	call   c0ed <_malloc>
    c6ec:	a3 30 40 00 00       	mov    %eax,0x4030
    c6f1:	c7 44 24 08 00 2c 00 	movl   $0x2c00,0x8(%esp)
    c6f8:	00 
    c6f9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    c700:	00 
    c701:	89 04 24             	mov    %eax,(%esp)
    c704:	e8 b3 27 00 00       	call   eebc <_memset>
    c709:	c7 04 24 00 04 00 00 	movl   $0x400,(%esp)
    c710:	e8 d8 f9 ff ff       	call   c0ed <_malloc>
    c715:	89 c2                	mov    %eax,%edx
    c717:	a3 34 40 00 00       	mov    %eax,0x4034
    c71c:	b9 00 01 00 00       	mov    $0x100,%ecx
    c721:	b8 00 00 00 00       	mov    $0x0,%eax
    c726:	89 d7                	mov    %edx,%edi
    c728:	f3 ab                	rep stos %eax,%es:(%edi)
    c72a:	c7 05 38 40 00 00 00 	movl   $0x0,0x4038
    c731:	00 00 00 
    c734:	c7 05 3c 40 00 00 00 	movl   $0x0,0x403c
    c73b:	00 00 00 
    c73e:	83 c4 18             	add    $0x18,%esp
    c741:	5f                   	pop    %edi
    c742:	c3                   	ret    

0000c743 <_create_task_0>:
    c743:	a1 30 40 00 00       	mov    0x4030,%eax
    c748:	c7 40 1c 01 00 00 00 	movl   $0x1,0x1c(%eax)
    c74f:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
    c756:	c7 40 24 14 f5 00 00 	movl   $0xf514,0x24(%eax)
    c75d:	c7 40 18 10 00 00 00 	movl   $0x10,0x18(%eax)
    c764:	c7 40 20 00 90 00 00 	movl   $0x9000,0x20(%eax)
    c76b:	c7 40 08 00 80 00 00 	movl   $0x8000,0x8(%eax)
    c772:	c3                   	ret    

0000c773 <_create_task>:
    c773:	57                   	push   %edi
    c774:	56                   	push   %esi
    c775:	53                   	push   %ebx
    c776:	83 ec 10             	sub    $0x10,%esp
    c779:	8b 35 30 40 00 00    	mov    0x4030,%esi
    c77f:	83 7e 1c 00          	cmpl   $0x0,0x1c(%esi)
    c783:	74 12                	je     c797 <_create_task+0x24>
    c785:	8d 56 2c             	lea    0x2c(%esi),%edx
    c788:	bb 01 00 00 00       	mov    $0x1,%ebx
    c78d:	89 d6                	mov    %edx,%esi
    c78f:	83 7a 1c 00          	cmpl   $0x0,0x1c(%edx)
    c793:	75 7f                	jne    c814 <_create_task+0xa1>
    c795:	eb 05                	jmp    c79c <_create_task+0x29>
    c797:	bb 00 00 00 00       	mov    $0x0,%ebx
    c79c:	c7 46 1c 01 00 00 00 	movl   $0x1,0x1c(%esi)
    c7a3:	89 5e 14             	mov    %ebx,0x14(%esi)
    c7a6:	8b 44 24 20          	mov    0x20(%esp),%eax
    c7aa:	89 46 24             	mov    %eax,0x24(%esi)
    c7ad:	c7 46 18 10 00 00 00 	movl   $0x10,0x18(%esi)
    c7b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    c7bb:	e8 b9 f8 ff ff       	call   c079 <_malloc_page>
    c7c0:	8d 50 03             	lea    0x3(%eax),%edx
    c7c3:	89 14 9d 00 80 00 00 	mov    %edx,0x8000(,%ebx,4)
    c7ca:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    c7d1:	00 
    c7d2:	89 04 24             	mov    %eax,(%esp)
    c7d5:	e8 51 1f 00 00       	call   e72b <_push_page>
    c7da:	89 c2                	mov    %eax,%edx
    c7dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    c7e2:	c7 80 fc 0f 00 00 00 	movl   $0x0,0xffc(%eax)
    c7e9:	00 00 00 
    c7ec:	8d 78 04             	lea    0x4(%eax),%edi
    c7ef:	83 e7 fc             	and    $0xfffffffc,%edi
    c7f2:	89 c1                	mov    %eax,%ecx
    c7f4:	29 f9                	sub    %edi,%ecx
    c7f6:	81 c1 00 10 00 00    	add    $0x1000,%ecx
    c7fc:	c1 e9 02             	shr    $0x2,%ecx
    c7ff:	b8 00 00 00 00       	mov    $0x0,%eax
    c804:	f3 ab                	rep stos %eax,%es:(%edi)
    c806:	89 56 20             	mov    %edx,0x20(%esi)
    c809:	c7 46 08 00 80 00 00 	movl   $0x8000,0x8(%esi)
    c810:	89 f0                	mov    %esi,%eax
    c812:	eb 17                	jmp    c82b <_create_task+0xb8>
    c814:	83 c3 01             	add    $0x1,%ebx
    c817:	83 c2 2c             	add    $0x2c,%edx
    c81a:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
    c820:	0f 85 67 ff ff ff    	jne    c78d <_create_task+0x1a>
    c826:	b8 00 00 00 00       	mov    $0x0,%eax
    c82b:	83 c4 10             	add    $0x10,%esp
    c82e:	5b                   	pop    %ebx
    c82f:	5e                   	pop    %esi
    c830:	5f                   	pop    %edi
    c831:	c3                   	ret    

0000c832 <_task_init_ns>:
    c832:	53                   	push   %ebx
    c833:	8b 44 24 08          	mov    0x8(%esp),%eax
    c837:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    c83b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
    c83f:	83 ea 3c             	sub    $0x3c,%edx
    c842:	89 10                	mov    %edx,(%eax)
    c844:	89 52 1c             	mov    %edx,0x1c(%edx)
    c847:	8b 10                	mov    (%eax),%edx
    c849:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    c84d:	89 5a 34             	mov    %ebx,0x34(%edx)
    c850:	8b 10                	mov    (%eax),%edx
    c852:	89 0a                	mov    %ecx,(%edx)
    c854:	89 4a 08             	mov    %ecx,0x8(%edx)
    c857:	89 4a 0c             	mov    %ecx,0xc(%edx)
    c85a:	89 4a 04             	mov    %ecx,0x4(%edx)
    c85d:	8b 10                	mov    (%eax),%edx
    c85f:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    c863:	89 4a 30             	mov    %ecx,0x30(%edx)
    c866:	8b 10                	mov    (%eax),%edx
    c868:	8b 4c 24 20          	mov    0x20(%esp),%ecx
    c86c:	89 4a 38             	mov    %ecx,0x38(%edx)
    c86f:	8b 54 24 18          	mov    0x18(%esp),%edx
    c873:	89 50 04             	mov    %edx,0x4(%eax)
    c876:	5b                   	pop    %ebx
    c877:	c3                   	ret    

0000c878 <_task_init>:
    c878:	53                   	push   %ebx
    c879:	83 ec 28             	sub    $0x28,%esp
    c87c:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
    c883:	e8 f1 f7 ff ff       	call   c079 <_malloc_page>
    c888:	89 c3                	mov    %eax,%ebx
    c88a:	e8 44 26 00 00       	call   eed3 <_read_eflags>
    c88f:	89 44 24 18          	mov    %eax,0x18(%esp)
    c893:	81 c3 00 00 01 00    	add    $0x10000,%ebx
    c899:	89 5c 24 14          	mov    %ebx,0x14(%esp)
    c89d:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
    c8a4:	00 
    c8a5:	c7 44 24 0c 08 00 00 	movl   $0x8,0xc(%esp)
    c8ac:	00 
    c8ad:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    c8b4:	00 
    c8b5:	8b 44 24 34          	mov    0x34(%esp),%eax
    c8b9:	89 44 24 04          	mov    %eax,0x4(%esp)
    c8bd:	8b 44 24 30          	mov    0x30(%esp),%eax
    c8c1:	89 04 24             	mov    %eax,(%esp)
    c8c4:	e8 69 ff ff ff       	call   c832 <_task_init_ns>
    c8c9:	83 c4 28             	add    $0x28,%esp
    c8cc:	5b                   	pop    %ebx
    c8cd:	c3                   	ret    

0000c8ce <_task_ready>:
    c8ce:	8b 44 24 04          	mov    0x4(%esp),%eax
    c8d2:	83 78 1c 02          	cmpl   $0x2,0x1c(%eax)
    c8d6:	74 1d                	je     c8f5 <_task_ready+0x27>
    c8d8:	c7 40 1c 02 00 00 00 	movl   $0x2,0x1c(%eax)
    c8df:	8b 15 34 40 00 00    	mov    0x4034,%edx
    c8e5:	8b 0d 38 40 00 00    	mov    0x4038,%ecx
    c8eb:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
    c8ee:	83 05 38 40 00 00 01 	addl   $0x1,0x4038
    c8f5:	f3 c3                	repz ret 

0000c8f7 <_task_now>:
    c8f7:	a1 34 40 00 00       	mov    0x4034,%eax
    c8fc:	8b 15 3c 40 00 00    	mov    0x403c,%edx
    c902:	8b 04 90             	mov    (%eax,%edx,4),%eax
    c905:	c3                   	ret    

0000c906 <_find_task>:
    c906:	6b 44 24 04 2c       	imul   $0x2c,0x4(%esp),%eax
    c90b:	03 05 30 40 00 00    	add    0x4030,%eax
    c911:	c3                   	ret    

0000c912 <_schedule>:
    c912:	56                   	push   %esi
    c913:	53                   	push   %ebx
    c914:	83 ec 14             	sub    $0x14,%esp
    c917:	8b 1d 38 40 00 00    	mov    0x4038,%ebx
    c91d:	83 fb 01             	cmp    $0x1,%ebx
    c920:	7e 31                	jle    c953 <_schedule+0x41>
    c922:	e8 d0 ff ff ff       	call   c8f7 <_task_now>
    c927:	89 c6                	mov    %eax,%esi
    c929:	a1 3c 40 00 00       	mov    0x403c,%eax
    c92e:	8d 50 01             	lea    0x1(%eax),%edx
    c931:	39 d3                	cmp    %edx,%ebx
    c933:	b8 00 00 00 00       	mov    $0x0,%eax
    c938:	0f 44 d0             	cmove  %eax,%edx
    c93b:	89 15 3c 40 00 00    	mov    %edx,0x403c
    c941:	fb                   	sti    
    c942:	e8 b0 ff ff ff       	call   c8f7 <_task_now>
    c947:	89 44 24 04          	mov    %eax,0x4(%esp)
    c94b:	89 34 24             	mov    %esi,(%esp)
    c94e:	e8 19 25 00 00       	call   ee6c <_restart>
    c953:	83 c4 14             	add    $0x14,%esp
    c956:	5b                   	pop    %ebx
    c957:	5e                   	pop    %esi
    c958:	c3                   	ret    

0000c959 <_task_sleep>:
    c959:	57                   	push   %edi
    c95a:	56                   	push   %esi
    c95b:	53                   	push   %ebx
    c95c:	8b 74 24 10          	mov    0x10(%esp),%esi
    c960:	83 7e 1c 02          	cmpl   $0x2,0x1c(%esi)
    c964:	75 6c                	jne    c9d2 <_task_sleep+0x79>
    c966:	fa                   	cli    
    c967:	c7 46 1c 01 00 00 00 	movl   $0x1,0x1c(%esi)
    c96e:	a1 38 40 00 00       	mov    0x4038,%eax
    c973:	85 c0                	test   %eax,%eax
    c975:	7e 5b                	jle    c9d2 <_task_sleep+0x79>
    c977:	bb 00 00 00 00       	mov    $0x0,%ebx
    c97c:	8b 3d 34 40 00 00    	mov    0x4034,%edi
    c982:	8d 0c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%ecx
    c989:	8d 14 0f             	lea    (%edi,%ecx,1),%edx
    c98c:	39 32                	cmp    %esi,(%edx)
    c98e:	75 36                	jne    c9c6 <_task_sleep+0x6d>
    c990:	83 e8 01             	sub    $0x1,%eax
    c993:	a3 38 40 00 00       	mov    %eax,0x4038
    c998:	83 3a 00             	cmpl   $0x0,(%edx)
    c99b:	74 0d                	je     c9aa <_task_sleep+0x51>
    c99d:	8d 44 0f 04          	lea    0x4(%edi,%ecx,1),%eax
    c9a1:	83 c0 04             	add    $0x4,%eax
    c9a4:	83 78 fc 00          	cmpl   $0x0,-0x4(%eax)
    c9a8:	75 f7                	jne    c9a1 <_task_sleep+0x48>
    c9aa:	a1 3c 40 00 00       	mov    0x403c,%eax
    c9af:	39 d8                	cmp    %ebx,%eax
    c9b1:	7e 0a                	jle    c9bd <_task_sleep+0x64>
    c9b3:	83 e8 01             	sub    $0x1,%eax
    c9b6:	a3 3c 40 00 00       	mov    %eax,0x403c
    c9bb:	eb 09                	jmp    c9c6 <_task_sleep+0x6d>
    c9bd:	39 c3                	cmp    %eax,%ebx
    c9bf:	75 05                	jne    c9c6 <_task_sleep+0x6d>
    c9c1:	e8 4c ff ff ff       	call   c912 <_schedule>
    c9c6:	83 c3 01             	add    $0x1,%ebx
    c9c9:	a1 38 40 00 00       	mov    0x4038,%eax
    c9ce:	39 d8                	cmp    %ebx,%eax
    c9d0:	7f aa                	jg     c97c <_task_sleep+0x23>
    c9d2:	5b                   	pop    %ebx
    c9d3:	5e                   	pop    %esi
    c9d4:	5f                   	pop    %edi
    c9d5:	c3                   	ret    

0000c9d6 <_task_delete>:
    c9d6:	55                   	push   %ebp
    c9d7:	57                   	push   %edi
    c9d8:	56                   	push   %esi
    c9d9:	53                   	push   %ebx
    c9da:	83 ec 1c             	sub    $0x1c,%esp
    c9dd:	8b 74 24 30          	mov    0x30(%esp),%esi
    c9e1:	83 7e 1c 02          	cmpl   $0x2,0x1c(%esi)
    c9e5:	0f 85 8a 00 00 00    	jne    ca75 <_task_delete+0x9f>
    c9eb:	fa                   	cli    
    c9ec:	c7 46 1c 00 00 00 00 	movl   $0x0,0x1c(%esi)
    c9f3:	a1 38 40 00 00       	mov    0x4038,%eax
    c9f8:	85 c0                	test   %eax,%eax
    c9fa:	7e 79                	jle    ca75 <_task_delete+0x9f>
    c9fc:	bb 00 00 00 00       	mov    $0x0,%ebx
    ca01:	8b 2d 34 40 00 00    	mov    0x4034,%ebp
    ca07:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
    ca0e:	8d 4c 3d 00          	lea    0x0(%ebp,%edi,1),%ecx
    ca12:	39 31                	cmp    %esi,(%ecx)
    ca14:	75 53                	jne    ca69 <_task_delete+0x93>
    ca16:	8d 50 ff             	lea    -0x1(%eax),%edx
    ca19:	89 15 38 40 00 00    	mov    %edx,0x4038
    ca1f:	83 39 00             	cmpl   $0x0,(%ecx)
    ca22:	74 0d                	je     ca31 <_task_delete+0x5b>
    ca24:	8d 44 3d 04          	lea    0x4(%ebp,%edi,1),%eax
    ca28:	83 c0 04             	add    $0x4,%eax
    ca2b:	83 78 fc 00          	cmpl   $0x0,-0x4(%eax)
    ca2f:	75 f7                	jne    ca28 <_task_delete+0x52>
    ca31:	a1 3c 40 00 00       	mov    0x403c,%eax
    ca36:	39 d8                	cmp    %ebx,%eax
    ca38:	7e 0a                	jle    ca44 <_task_delete+0x6e>
    ca3a:	83 e8 01             	sub    $0x1,%eax
    ca3d:	a3 3c 40 00 00       	mov    %eax,0x403c
    ca42:	eb 25                	jmp    ca69 <_task_delete+0x93>
    ca44:	83 fa 01             	cmp    $0x1,%edx
    ca47:	7e 20                	jle    ca69 <_task_delete+0x93>
    ca49:	39 c3                	cmp    %eax,%ebx
    ca4b:	75 1c                	jne    ca69 <_task_delete+0x93>
    ca4d:	39 c2                	cmp    %eax,%edx
    ca4f:	75 0a                	jne    ca5b <_task_delete+0x85>
    ca51:	c7 05 3c 40 00 00 00 	movl   $0x0,0x403c
    ca58:	00 00 00 
    ca5b:	fb                   	sti    
    ca5c:	e8 96 fe ff ff       	call   c8f7 <_task_now>
    ca61:	89 04 24             	mov    %eax,(%esp)
    ca64:	e8 e0 24 00 00       	call   ef49 <_destart>
    ca69:	83 c3 01             	add    $0x1,%ebx
    ca6c:	a1 38 40 00 00       	mov    0x4038,%eax
    ca71:	39 d8                	cmp    %ebx,%eax
    ca73:	7f 8c                	jg     ca01 <_task_delete+0x2b>
    ca75:	83 c4 1c             	add    $0x1c,%esp
    ca78:	5b                   	pop    %ebx
    ca79:	5e                   	pop    %esi
    ca7a:	5f                   	pop    %edi
    ca7b:	5d                   	pop    %ebp
    ca7c:	c3                   	ret    

0000ca7d <_exec>:
    ca7d:	55                   	push   %ebp
    ca7e:	57                   	push   %edi
    ca7f:	56                   	push   %esi
    ca80:	53                   	push   %ebx
    ca81:	83 ec 2c             	sub    $0x2c,%esp
    ca84:	8b 6c 24 40          	mov    0x40(%esp),%ebp
    ca88:	89 2c 24             	mov    %ebp,(%esp)
    ca8b:	e8 86 1a 00 00       	call   e516 <_fopen>
    ca90:	85 c0                	test   %eax,%eax
    ca92:	75 29                	jne    cabd <_exec+0x40>
    ca94:	89 ef                	mov    %ebp,%edi
    ca96:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    ca9b:	f2 ae                	repnz scas %es:(%edi),%al
    ca9d:	f7 d1                	not    %ecx
    ca9f:	8d 44 0d ff          	lea    -0x1(%ebp,%ecx,1),%eax
    caa3:	c7 00 2e 66 65 78    	movl   $0x7865662e,(%eax)
    caa9:	c6 40 04 00          	movb   $0x0,0x4(%eax)
    caad:	89 2c 24             	mov    %ebp,(%esp)
    cab0:	e8 61 1a 00 00       	call   e516 <_fopen>
    cab5:	85 c0                	test   %eax,%eax
    cab7:	0f 84 ba 00 00 00    	je     cb77 <_exec+0xfa>
    cabd:	89 04 24             	mov    %eax,(%esp)
    cac0:	e8 cf 1a 00 00       	call   e594 <_fclose>
    cac5:	89 2c 24             	mov    %ebp,(%esp)
    cac8:	e8 a6 fc ff ff       	call   c773 <_create_task>
    cacd:	89 c6                	mov    %eax,%esi
    cacf:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    cad6:	e8 9e f5 ff ff       	call   c079 <_malloc_page>
    cadb:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    cae2:	00 
    cae3:	89 04 24             	mov    %eax,(%esp)
    cae6:	e8 40 1c 00 00       	call   e72b <_push_page>
    caeb:	89 c3                	mov    %eax,%ebx
    caed:	e8 e1 23 00 00       	call   eed3 <_read_eflags>
    caf2:	89 44 24 18          	mov    %eax,0x18(%esp)
    caf6:	8d 83 e0 3f 00 00    	lea    0x3fe0(%ebx),%eax
    cafc:	89 44 24 14          	mov    %eax,0x14(%esp)
    cb00:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%esp)
    cb07:	00 
    cb08:	c7 44 24 0c 08 00 00 	movl   $0x8,0xc(%esp)
    cb0f:	00 
    cb10:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    cb17:	00 
    cb18:	c7 44 24 04 90 b9 00 	movl   $0xb990,0x4(%esp)
    cb1f:	00 
    cb20:	89 34 24             	mov    %esi,(%esp)
    cb23:	e8 0a fd ff ff       	call   c832 <_task_init_ns>
    cb28:	89 ab e4 3f 00 00    	mov    %ebp,0x3fe4(%ebx)
    cb2e:	8b 44 24 44          	mov    0x44(%esp),%eax
    cb32:	89 83 e8 3f 00 00    	mov    %eax,0x3fe8(%ebx)
    cb38:	e8 ba fd ff ff       	call   c8f7 <_task_now>
    cb3d:	89 83 ec 3f 00 00    	mov    %eax,0x3fec(%ebx)
    cb43:	8b 54 24 48          	mov    0x48(%esp),%edx
    cb47:	89 93 f0 3f 00 00    	mov    %edx,0x3ff0(%ebx)
    cb4d:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    cb51:	89 93 f4 3f 00 00    	mov    %edx,0x3ff4(%ebx)
    cb57:	8b 54 24 50          	mov    0x50(%esp),%edx
    cb5b:	89 93 f8 3f 00 00    	mov    %edx,0x3ff8(%ebx)
    cb61:	8b 44 24 54          	mov    0x54(%esp),%eax
    cb65:	89 83 fc 3f 00 00    	mov    %eax,0x3ffc(%ebx)
    cb6b:	89 34 24             	mov    %esi,(%esp)
    cb6e:	e8 5b fd ff ff       	call   c8ce <_task_ready>
    cb73:	89 f0                	mov    %esi,%eax
    cb75:	eb 05                	jmp    cb7c <_exec+0xff>
    cb77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    cb7c:	83 c4 2c             	add    $0x2c,%esp
    cb7f:	5b                   	pop    %ebx
    cb80:	5e                   	pop    %esi
    cb81:	5f                   	pop    %edi
    cb82:	5d                   	pop    %ebp
    cb83:	c3                   	ret    

0000cb84 <_unexec>:
    cb84:	83 ec 1c             	sub    $0x1c,%esp
    cb87:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
    cb8e:	e8 3d 1b 00 00       	call   e6d0 <_pop_page>
    cb93:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    cb9a:	00 
    cb9b:	c1 f8 0c             	sar    $0xc,%eax
    cb9e:	89 04 24             	mov    %eax,(%esp)
    cba1:	e8 37 f8 ff ff       	call   c3dd <_free_page>
    cba6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    cbad:	e8 1e 1b 00 00       	call   e6d0 <_pop_page>
    cbb2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    cbb9:	00 
    cbba:	c1 f8 0c             	sar    $0xc,%eax
    cbbd:	89 04 24             	mov    %eax,(%esp)
    cbc0:	e8 18 f8 ff ff       	call   c3dd <_free_page>
    cbc5:	83 c4 1c             	add    $0x1c,%esp
    cbc8:	c3                   	ret    
    cbc9:	90                   	nop
    cbca:	90                   	nop
    cbcb:	90                   	nop

0000cbcc <_dispchar>:
    cbcc:	55                   	push   %ebp
    cbcd:	57                   	push   %edi
    cbce:	56                   	push   %esi
    cbcf:	53                   	push   %ebx
    cbd0:	83 ec 08             	sub    $0x8,%esp
    cbd3:	0f b7 74 24 28       	movzwl 0x28(%esp),%esi
    cbd8:	0f b7 5c 24 2c       	movzwl 0x2c(%esp),%ebx
    cbdd:	8b 44 24 20          	mov    0x20(%esp),%eax
    cbe1:	03 44 24 1c          	add    0x1c(%esp),%eax
    cbe5:	8b 0d 50 40 00 00    	mov    0x4050,%ecx
    cbeb:	99                   	cltd   
    cbec:	f7 f9                	idiv   %ecx
    cbee:	c1 e0 08             	shl    $0x8,%eax
    cbf1:	0f af c1             	imul   %ecx,%eax
    cbf4:	89 c7                	mov    %eax,%edi
    cbf6:	a1 00 40 00 00       	mov    0x4000,%eax
    cbfb:	03 b8 98 01 00 00    	add    0x198(%eax),%edi
    cc01:	c1 e2 04             	shl    $0x4,%edx
    cc04:	01 fa                	add    %edi,%edx
    cc06:	c1 e1 04             	shl    $0x4,%ecx
    cc09:	29 ca                	sub    %ecx,%edx
    cc0b:	8b 0d 40 40 00 00    	mov    0x4040,%ecx
    cc11:	0f be 44 24 24       	movsbl 0x24(%esp),%eax
    cc16:	c1 e0 04             	shl    $0x4,%eax
    cc19:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
    cc1c:	89 3c 24             	mov    %edi,(%esp)
    cc1f:	8d 44 01 10          	lea    0x10(%ecx,%eax,1),%eax
    cc23:	89 44 24 04          	mov    %eax,0x4(%esp)
    cc27:	b8 00 00 00 00       	mov    $0x0,%eax
    cc2c:	8b 3c 24             	mov    (%esp),%edi
    cc2f:	0f be 3f             	movsbl (%edi),%edi
    cc32:	b9 07 00 00 00       	mov    $0x7,%ecx
    cc37:	29 c1                	sub    %eax,%ecx
    cc39:	89 fd                	mov    %edi,%ebp
    cc3b:	d3 fd                	sar    %cl,%ebp
    cc3d:	89 e9                	mov    %ebp,%ecx
    cc3f:	83 e1 01             	and    $0x1,%ecx
    cc42:	89 f1                	mov    %esi,%ecx
    cc44:	0f 45 cb             	cmovne %ebx,%ecx
    cc47:	66 89 0c 42          	mov    %cx,(%edx,%eax,2)
    cc4b:	83 c0 01             	add    $0x1,%eax
    cc4e:	83 f8 08             	cmp    $0x8,%eax
    cc51:	75 df                	jne    cc32 <_dispchar+0x66>
    cc53:	a1 50 40 00 00       	mov    0x4050,%eax
    cc58:	c1 e0 04             	shl    $0x4,%eax
    cc5b:	01 c2                	add    %eax,%edx
    cc5d:	83 04 24 01          	addl   $0x1,(%esp)
    cc61:	8b 04 24             	mov    (%esp),%eax
    cc64:	3b 44 24 04          	cmp    0x4(%esp),%eax
    cc68:	75 bd                	jne    cc27 <_dispchar+0x5b>
    cc6a:	83 c4 08             	add    $0x8,%esp
    cc6d:	5b                   	pop    %ebx
    cc6e:	5e                   	pop    %esi
    cc6f:	5f                   	pop    %edi
    cc70:	5d                   	pop    %ebp
    cc71:	c3                   	ret    

0000cc72 <_oputch>:
    cc72:	56                   	push   %esi
    cc73:	53                   	push   %ebx
    cc74:	83 ec 24             	sub    $0x24,%esp
    cc77:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    cc7b:	80 fb 03             	cmp    $0x3,%bl
    cc7e:	75 24                	jne    cca4 <_oputch+0x32>
    cc80:	a1 4c 40 00 00       	mov    0x404c,%eax
    cc85:	01 05 44 40 00 00    	add    %eax,0x4044
    cc8b:	c7 05 4c 40 00 00 00 	movl   $0x0,0x404c
    cc92:	00 00 00 
    cc95:	c7 05 48 40 00 00 00 	movl   $0x0,0x4048
    cc9c:	00 00 00 
    cc9f:	e9 36 02 00 00       	jmp    ceda <_oputch+0x268>
    cca4:	80 fb 0a             	cmp    $0xa,%bl
    cca7:	0f 85 a7 00 00 00    	jne    cd54 <_oputch+0xe2>
    ccad:	8b 0d 50 40 00 00    	mov    0x4050,%ecx
    ccb3:	89 c8                	mov    %ecx,%eax
    ccb5:	03 05 44 40 00 00    	add    0x4044,%eax
    ccbb:	99                   	cltd   
    ccbc:	f7 f9                	idiv   %ecx
    ccbe:	0f af c1             	imul   %ecx,%eax
    ccc1:	a3 44 40 00 00       	mov    %eax,0x4044
    ccc6:	c7 05 4c 40 00 00 00 	movl   $0x0,0x404c
    cccd:	00 00 00 
    ccd0:	c7 05 48 40 00 00 00 	movl   $0x0,0x4048
    ccd7:	00 00 00 
    ccda:	89 ca                	mov    %ecx,%edx
    ccdc:	0f af 15 54 40 00 00 	imul   0x4054,%edx
    cce3:	39 d0                	cmp    %edx,%eax
    cce5:	0f 85 ef 01 00 00    	jne    ceda <_oputch+0x268>
    cceb:	29 c8                	sub    %ecx,%eax
    cced:	a3 44 40 00 00       	mov    %eax,0x4044
    ccf2:	89 44 24 10          	mov    %eax,0x10(%esp)
    ccf6:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
    ccfd:	00 
    ccfe:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    cd02:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    cd09:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    cd10:	00 
    cd11:	e8 16 f7 ff ff       	call   c42c <_vrammove>
    cd16:	8b 15 50 40 00 00    	mov    0x4050,%edx
    cd1c:	89 d1                	mov    %edx,%ecx
    cd1e:	c1 e1 08             	shl    $0x8,%ecx
    cd21:	a1 54 40 00 00       	mov    0x4054,%eax
    cd26:	83 e8 01             	sub    $0x1,%eax
    cd29:	0f af c2             	imul   %edx,%eax
    cd2c:	c1 e0 08             	shl    $0x8,%eax
    cd2f:	8b 15 00 40 00 00    	mov    0x4000,%edx
    cd35:	03 82 98 01 00 00    	add    0x198(%edx),%eax
    cd3b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    cd3f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    cd46:	00 
    cd47:	89 04 24             	mov    %eax,(%esp)
    cd4a:	e8 6d 21 00 00       	call   eebc <_memset>
    cd4f:	e9 86 01 00 00       	jmp    ceda <_oputch+0x268>
    cd54:	80 fb 0d             	cmp    $0xd,%bl
    cd57:	75 0f                	jne    cd68 <_oputch+0xf6>
    cd59:	c7 05 48 40 00 00 00 	movl   $0x0,0x4048
    cd60:	00 00 00 
    cd63:	e9 72 01 00 00       	jmp    ceda <_oputch+0x268>
    cd68:	80 fb 08             	cmp    $0x8,%bl
    cd6b:	75 7a                	jne    cde7 <_oputch+0x175>
    cd6d:	a1 48 40 00 00       	mov    0x4048,%eax
    cd72:	85 c0                	test   %eax,%eax
    cd74:	0f 84 60 01 00 00    	je     ceda <_oputch+0x268>
    cd7a:	8b 0d 44 40 00 00    	mov    0x4044,%ecx
    cd80:	8d 58 ff             	lea    -0x1(%eax),%ebx
    cd83:	8b 15 4c 40 00 00    	mov    0x404c,%edx
    cd89:	29 c2                	sub    %eax,%edx
    cd8b:	89 54 24 10          	mov    %edx,0x10(%esp)
    cd8f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    cd93:	89 44 24 0c          	mov    %eax,0xc(%esp)
    cd97:	89 0c 24             	mov    %ecx,(%esp)
    cd9a:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    cd9e:	e8 65 f3 ff ff       	call   c108 <_vramcpy>
    cda3:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
    cdaa:	00 
    cdab:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    cdb2:	00 
    cdb3:	c7 44 24 08 20 00 00 	movl   $0x20,0x8(%esp)
    cdba:	00 
    cdbb:	a1 4c 40 00 00       	mov    0x404c,%eax
    cdc0:	83 e8 01             	sub    $0x1,%eax
    cdc3:	89 44 24 04          	mov    %eax,0x4(%esp)
    cdc7:	a1 44 40 00 00       	mov    0x4044,%eax
    cdcc:	89 04 24             	mov    %eax,(%esp)
    cdcf:	e8 f8 fd ff ff       	call   cbcc <_dispchar>
    cdd4:	83 2d 48 40 00 00 01 	subl   $0x1,0x4048
    cddb:	83 2d 4c 40 00 00 01 	subl   $0x1,0x404c
    cde2:	e9 f3 00 00 00       	jmp    ceda <_oputch+0x268>
    cde7:	80 fb 7f             	cmp    $0x7f,%bl
    cdea:	75 4c                	jne    ce38 <_oputch+0x1c6>
    cdec:	8b 15 48 40 00 00    	mov    0x4048,%edx
    cdf2:	a1 4c 40 00 00       	mov    0x404c,%eax
    cdf7:	39 c2                	cmp    %eax,%edx
    cdf9:	0f 84 db 00 00 00    	je     ceda <_oputch+0x268>
    cdff:	8b 0d 44 40 00 00    	mov    0x4044,%ecx
    ce05:	8d 5a 01             	lea    0x1(%edx),%ebx
    ce08:	29 d0                	sub    %edx,%eax
    ce0a:	83 e8 01             	sub    $0x1,%eax
    ce0d:	89 44 24 10          	mov    %eax,0x10(%esp)
    ce11:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    ce15:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    ce19:	89 0c 24             	mov    %ecx,(%esp)
    ce1c:	89 54 24 04          	mov    %edx,0x4(%esp)
    ce20:	e8 e3 f2 ff ff       	call   c108 <_vramcpy>
    ce25:	83 2d 48 40 00 00 01 	subl   $0x1,0x4048
    ce2c:	83 2d 4c 40 00 00 01 	subl   $0x1,0x404c
    ce33:	e9 a2 00 00 00       	jmp    ceda <_oputch+0x268>
    ce38:	80 fb 09             	cmp    $0x9,%bl
    ce3b:	75 31                	jne    ce6e <_oputch+0x1fc>
    ce3d:	a1 48 40 00 00       	mov    0x4048,%eax
    ce42:	89 c6                	mov    %eax,%esi
    ce44:	83 ce 03             	or     $0x3,%esi
    ce47:	83 c6 01             	add    $0x1,%esi
    ce4a:	29 c6                	sub    %eax,%esi
    ce4c:	85 f6                	test   %esi,%esi
    ce4e:	0f 8e 86 00 00 00    	jle    ceda <_oputch+0x268>
    ce54:	bb 00 00 00 00       	mov    $0x0,%ebx
    ce59:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
    ce60:	e8 0d fe ff ff       	call   cc72 <_oputch>
    ce65:	83 c3 01             	add    $0x1,%ebx
    ce68:	39 f3                	cmp    %esi,%ebx
    ce6a:	75 ed                	jne    ce59 <_oputch+0x1e7>
    ce6c:	eb 6c                	jmp    ceda <_oputch+0x268>
    ce6e:	8b 0d 44 40 00 00    	mov    0x4044,%ecx
    ce74:	a1 48 40 00 00       	mov    0x4048,%eax
    ce79:	8d 70 01             	lea    0x1(%eax),%esi
    ce7c:	8b 15 4c 40 00 00    	mov    0x404c,%edx
    ce82:	29 c2                	sub    %eax,%edx
    ce84:	89 54 24 10          	mov    %edx,0x10(%esp)
    ce88:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    ce8c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    ce90:	89 0c 24             	mov    %ecx,(%esp)
    ce93:	89 74 24 04          	mov    %esi,0x4(%esp)
    ce97:	e8 90 f5 ff ff       	call   c42c <_vrammove>
    ce9c:	a1 1c 40 00 00       	mov    0x401c,%eax
    cea1:	0f bf d0             	movswl %ax,%edx
    cea4:	89 54 24 10          	mov    %edx,0x10(%esp)
    cea8:	c1 f8 10             	sar    $0x10,%eax
    ceab:	89 44 24 0c          	mov    %eax,0xc(%esp)
    ceaf:	0f be db             	movsbl %bl,%ebx
    ceb2:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    ceb6:	a1 48 40 00 00       	mov    0x4048,%eax
    cebb:	89 44 24 04          	mov    %eax,0x4(%esp)
    cebf:	a1 44 40 00 00       	mov    0x4044,%eax
    cec4:	89 04 24             	mov    %eax,(%esp)
    cec7:	e8 00 fd ff ff       	call   cbcc <_dispchar>
    cecc:	83 05 48 40 00 00 01 	addl   $0x1,0x4048
    ced3:	83 05 4c 40 00 00 01 	addl   $0x1,0x404c
    ceda:	83 c4 24             	add    $0x24,%esp
    cedd:	5b                   	pop    %ebx
    cede:	5e                   	pop    %esi
    cedf:	c3                   	ret    

0000cee0 <_putch>:
    cee0:	83 ec 1c             	sub    $0x1c,%esp
    cee3:	8b 44 24 20          	mov    0x20(%esp),%eax
    cee7:	89 44 24 04          	mov    %eax,0x4(%esp)
    ceeb:	a1 18 40 00 00       	mov    0x4018,%eax
    cef0:	89 04 24             	mov    %eax,(%esp)
    cef3:	e8 2a 04 00 00       	call   d322 <_write_cache_wait>
    cef8:	83 c4 1c             	add    $0x1c,%esp
    cefb:	c3                   	ret    

0000cefc <_putstr>:
    cefc:	53                   	push   %ebx
    cefd:	83 ec 18             	sub    $0x18,%esp
    cf00:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    cf04:	0f b6 03             	movzbl (%ebx),%eax
    cf07:	84 c0                	test   %al,%al
    cf09:	74 15                	je     cf20 <_putstr+0x24>
    cf0b:	0f be c0             	movsbl %al,%eax
    cf0e:	89 04 24             	mov    %eax,(%esp)
    cf11:	e8 ca ff ff ff       	call   cee0 <_putch>
    cf16:	83 c3 01             	add    $0x1,%ebx
    cf19:	0f b6 03             	movzbl (%ebx),%eax
    cf1c:	84 c0                	test   %al,%al
    cf1e:	75 eb                	jne    cf0b <_putstr+0xf>
    cf20:	b8 01 00 00 00       	mov    $0x1,%eax
    cf25:	83 c4 18             	add    $0x18,%esp
    cf28:	5b                   	pop    %ebx
    cf29:	c3                   	ret    

0000cf2a <_puts>:
    cf2a:	83 ec 1c             	sub    $0x1c,%esp
    cf2d:	8b 44 24 20          	mov    0x20(%esp),%eax
    cf31:	89 04 24             	mov    %eax,(%esp)
    cf34:	e8 c3 ff ff ff       	call   cefc <_putstr>
    cf39:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    cf40:	e8 9b ff ff ff       	call   cee0 <_putch>
    cf45:	83 c4 1c             	add    $0x1c,%esp
    cf48:	c3                   	ret    

0000cf49 <_transdig>:
    cf49:	8b 54 24 04          	mov    0x4(%esp),%edx
    cf4d:	8d 4a 37             	lea    0x37(%edx),%ecx
    cf50:	8d 42 30             	lea    0x30(%edx),%eax
    cf53:	83 fa 0a             	cmp    $0xa,%edx
    cf56:	0f 4d c1             	cmovge %ecx,%eax
    cf59:	c3                   	ret    

0000cf5a <_putint>:
    cf5a:	57                   	push   %edi
    cf5b:	56                   	push   %esi
    cf5c:	53                   	push   %ebx
    cf5d:	83 ec 20             	sub    $0x20,%esp
    cf60:	8b 74 24 30          	mov    0x30(%esp),%esi
    cf64:	8b 5c 24 34          	mov    0x34(%esp),%ebx
    cf68:	83 fb 08             	cmp    $0x8,%ebx
    cf6b:	7f 45                	jg     cfb2 <_putint+0x58>
    cf6d:	c7 44 24 17 00 00 00 	movl   $0x0,0x17(%esp)
    cf74:	00 
    cf75:	c7 44 24 1b 00 00 00 	movl   $0x0,0x1b(%esp)
    cf7c:	00 
    cf7d:	c6 44 24 1f 00       	movb   $0x0,0x1f(%esp)
    cf82:	85 db                	test   %ebx,%ebx
    cf84:	74 20                	je     cfa6 <_putint+0x4c>
    cf86:	8d 7c 24 17          	lea    0x17(%esp),%edi
    cf8a:	01 fb                	add    %edi,%ebx
    cf8c:	89 f0                	mov    %esi,%eax
    cf8e:	83 e0 0f             	and    $0xf,%eax
    cf91:	89 04 24             	mov    %eax,(%esp)
    cf94:	e8 b0 ff ff ff       	call   cf49 <_transdig>
    cf99:	88 43 ff             	mov    %al,-0x1(%ebx)
    cf9c:	c1 fe 04             	sar    $0x4,%esi
    cf9f:	83 eb 01             	sub    $0x1,%ebx
    cfa2:	39 fb                	cmp    %edi,%ebx
    cfa4:	75 e6                	jne    cf8c <_putint+0x32>
    cfa6:	8d 44 24 17          	lea    0x17(%esp),%eax
    cfaa:	89 04 24             	mov    %eax,(%esp)
    cfad:	e8 4a ff ff ff       	call   cefc <_putstr>
    cfb2:	83 c4 20             	add    $0x20,%esp
    cfb5:	5b                   	pop    %ebx
    cfb6:	5e                   	pop    %esi
    cfb7:	5f                   	pop    %edi
    cfb8:	c3                   	ret    

0000cfb9 <_putdec>:
    cfb9:	55                   	push   %ebp
    cfba:	57                   	push   %edi
    cfbb:	56                   	push   %esi
    cfbc:	53                   	push   %ebx
    cfbd:	83 ec 2c             	sub    $0x2c,%esp
    cfc0:	8b 4c 24 40          	mov    0x40(%esp),%ecx
    cfc4:	8b 74 24 44          	mov    0x44(%esp),%esi
    cfc8:	83 fe 08             	cmp    $0x8,%esi
    cfcb:	7f 5b                	jg     d028 <_putdec+0x6f>
    cfcd:	c7 44 24 17 00 00 00 	movl   $0x0,0x17(%esp)
    cfd4:	00 
    cfd5:	c7 44 24 1b 00 00 00 	movl   $0x0,0x1b(%esp)
    cfdc:	00 
    cfdd:	c6 44 24 1f 00       	movb   $0x0,0x1f(%esp)
    cfe2:	85 f6                	test   %esi,%esi
    cfe4:	74 36                	je     d01c <_putdec+0x63>
    cfe6:	8d 7c 24 17          	lea    0x17(%esp),%edi
    cfea:	01 fe                	add    %edi,%esi
    cfec:	bd 67 66 66 66       	mov    $0x66666667,%ebp
    cff1:	89 c8                	mov    %ecx,%eax
    cff3:	f7 ed                	imul   %ebp
    cff5:	c1 fa 02             	sar    $0x2,%edx
    cff8:	89 c8                	mov    %ecx,%eax
    cffa:	c1 f8 1f             	sar    $0x1f,%eax
    cffd:	89 d3                	mov    %edx,%ebx
    cfff:	29 c3                	sub    %eax,%ebx
    d001:	8d 04 9b             	lea    (%ebx,%ebx,4),%eax
    d004:	01 c0                	add    %eax,%eax
    d006:	29 c1                	sub    %eax,%ecx
    d008:	89 0c 24             	mov    %ecx,(%esp)
    d00b:	e8 39 ff ff ff       	call   cf49 <_transdig>
    d010:	88 46 ff             	mov    %al,-0x1(%esi)
    d013:	89 d9                	mov    %ebx,%ecx
    d015:	83 ee 01             	sub    $0x1,%esi
    d018:	39 fe                	cmp    %edi,%esi
    d01a:	75 d5                	jne    cff1 <_putdec+0x38>
    d01c:	8d 44 24 17          	lea    0x17(%esp),%eax
    d020:	89 04 24             	mov    %eax,(%esp)
    d023:	e8 d4 fe ff ff       	call   cefc <_putstr>
    d028:	83 c4 2c             	add    $0x2c,%esp
    d02b:	5b                   	pop    %ebx
    d02c:	5e                   	pop    %esi
    d02d:	5f                   	pop    %edi
    d02e:	5d                   	pop    %ebp
    d02f:	c3                   	ret    

0000d030 <_printf>:
    d030:	55                   	push   %ebp
    d031:	57                   	push   %edi
    d032:	56                   	push   %esi
    d033:	53                   	push   %ebx
    d034:	83 ec 1c             	sub    $0x1c,%esp
    d037:	8b 74 24 30          	mov    0x30(%esp),%esi
    d03b:	8d 7c 24 34          	lea    0x34(%esp),%edi
    d03f:	0f b6 06             	movzbl (%esi),%eax
    d042:	84 c0                	test   %al,%al
    d044:	0f 84 26 01 00 00    	je     d170 <_printf+0x140>
    d04a:	bb 00 00 00 00       	mov    $0x0,%ebx
    d04f:	3c 25                	cmp    $0x25,%al
    d051:	74 10                	je     d063 <_printf+0x33>
    d053:	0f be c0             	movsbl %al,%eax
    d056:	89 04 24             	mov    %eax,(%esp)
    d059:	e8 82 fe ff ff       	call   cee0 <_putch>
    d05e:	e9 fe 00 00 00       	jmp    d161 <_printf+0x131>
    d063:	8d 6b 01             	lea    0x1(%ebx),%ebp
    d066:	0f b6 44 1e 01       	movzbl 0x1(%esi,%ebx,1),%eax
    d06b:	84 c0                	test   %al,%al
    d06d:	0f 84 04 01 00 00    	je     d177 <_printf+0x147>
    d073:	3c 78                	cmp    $0x78,%al
    d075:	75 1e                	jne    d095 <_printf+0x65>
    d077:	8d 5f 04             	lea    0x4(%edi),%ebx
    d07a:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    d081:	00 
    d082:	8b 07                	mov    (%edi),%eax
    d084:	89 04 24             	mov    %eax,(%esp)
    d087:	e8 ce fe ff ff       	call   cf5a <_putint>
    d08c:	89 df                	mov    %ebx,%edi
    d08e:	89 eb                	mov    %ebp,%ebx
    d090:	e9 cc 00 00 00       	jmp    d161 <_printf+0x131>
    d095:	3c 64                	cmp    $0x64,%al
    d097:	75 1e                	jne    d0b7 <_printf+0x87>
    d099:	8d 5f 04             	lea    0x4(%edi),%ebx
    d09c:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    d0a3:	00 
    d0a4:	8b 07                	mov    (%edi),%eax
    d0a6:	89 04 24             	mov    %eax,(%esp)
    d0a9:	e8 0b ff ff ff       	call   cfb9 <_putdec>
    d0ae:	89 df                	mov    %ebx,%edi
    d0b0:	89 eb                	mov    %ebp,%ebx
    d0b2:	e9 aa 00 00 00       	jmp    d161 <_printf+0x131>
    d0b7:	3c 63                	cmp    $0x63,%al
    d0b9:	75 16                	jne    d0d1 <_printf+0xa1>
    d0bb:	89 f8                	mov    %edi,%eax
    d0bd:	83 c7 04             	add    $0x4,%edi
    d0c0:	8b 00                	mov    (%eax),%eax
    d0c2:	89 04 24             	mov    %eax,(%esp)
    d0c5:	e8 16 fe ff ff       	call   cee0 <_putch>
    d0ca:	89 eb                	mov    %ebp,%ebx
    d0cc:	e9 90 00 00 00       	jmp    d161 <_printf+0x131>
    d0d1:	3c 73                	cmp    $0x73,%al
    d0d3:	75 13                	jne    d0e8 <_printf+0xb8>
    d0d5:	89 f8                	mov    %edi,%eax
    d0d7:	83 c7 04             	add    $0x4,%edi
    d0da:	8b 00                	mov    (%eax),%eax
    d0dc:	89 04 24             	mov    %eax,(%esp)
    d0df:	e8 18 fe ff ff       	call   cefc <_putstr>
    d0e4:	89 eb                	mov    %ebp,%ebx
    d0e6:	eb 79                	jmp    d161 <_printf+0x131>
    d0e8:	8d 50 d0             	lea    -0x30(%eax),%edx
    d0eb:	80 fa 09             	cmp    $0x9,%dl
    d0ee:	77 4f                	ja     d13f <_printf+0x10f>
    d0f0:	83 c3 02             	add    $0x2,%ebx
    d0f3:	0f b6 14 1e          	movzbl (%esi,%ebx,1),%edx
    d0f7:	0f be c0             	movsbl %al,%eax
    d0fa:	83 e8 30             	sub    $0x30,%eax
    d0fd:	80 fa 78             	cmp    $0x78,%dl
    d100:	75 15                	jne    d117 <_printf+0xe7>
    d102:	89 fa                	mov    %edi,%edx
    d104:	83 c7 04             	add    $0x4,%edi
    d107:	89 44 24 04          	mov    %eax,0x4(%esp)
    d10b:	8b 02                	mov    (%edx),%eax
    d10d:	89 04 24             	mov    %eax,(%esp)
    d110:	e8 45 fe ff ff       	call   cf5a <_putint>
    d115:	eb 4a                	jmp    d161 <_printf+0x131>
    d117:	80 fa 64             	cmp    $0x64,%dl
    d11a:	75 15                	jne    d131 <_printf+0x101>
    d11c:	89 fa                	mov    %edi,%edx
    d11e:	83 c7 04             	add    $0x4,%edi
    d121:	89 44 24 04          	mov    %eax,0x4(%esp)
    d125:	8b 02                	mov    (%edx),%eax
    d127:	89 04 24             	mov    %eax,(%esp)
    d12a:	e8 8a fe ff ff       	call   cfb9 <_putdec>
    d12f:	eb 30                	jmp    d161 <_printf+0x131>
    d131:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    d138:	e8 0b 20 00 00       	call   f148 <_error>
    d13d:	eb 22                	jmp    d161 <_printf+0x131>
    d13f:	3c 25                	cmp    $0x25,%al
    d141:	75 10                	jne    d153 <_printf+0x123>
    d143:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
    d14a:	e8 91 fd ff ff       	call   cee0 <_putch>
    d14f:	89 eb                	mov    %ebp,%ebx
    d151:	eb 0e                	jmp    d161 <_printf+0x131>
    d153:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    d15a:	e8 e9 1f 00 00       	call   f148 <_error>
    d15f:	89 eb                	mov    %ebp,%ebx
    d161:	83 c3 01             	add    $0x1,%ebx
    d164:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
    d168:	84 c0                	test   %al,%al
    d16a:	0f 85 df fe ff ff    	jne    d04f <_printf+0x1f>
    d170:	b8 01 00 00 00       	mov    $0x1,%eax
    d175:	eb 05                	jmp    d17c <_printf+0x14c>
    d177:	b8 00 00 00 00       	mov    $0x0,%eax
    d17c:	83 c4 1c             	add    $0x1c,%esp
    d17f:	5b                   	pop    %ebx
    d180:	5e                   	pop    %esi
    d181:	5f                   	pop    %edi
    d182:	5d                   	pop    %ebp
    d183:	c3                   	ret    

0000d184 <_fifo_init>:
    d184:	8b 44 24 04          	mov    0x4(%esp),%eax
    d188:	8b 54 24 08          	mov    0x8(%esp),%edx
    d18c:	89 50 0c             	mov    %edx,0xc(%eax)
    d18f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    d196:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    d19d:	8b 54 24 0c          	mov    0xc(%esp),%edx
    d1a1:	89 10                	mov    %edx,(%eax)
    d1a3:	c3                   	ret    

0000d1a4 <_fifo_size>:
    d1a4:	8b 54 24 04          	mov    0x4(%esp),%edx
    d1a8:	8b 42 08             	mov    0x8(%edx),%eax
    d1ab:	8b 4a 04             	mov    0x4(%edx),%ecx
    d1ae:	29 c8                	sub    %ecx,%eax
    d1b0:	79 06                	jns    d1b8 <_fifo_size+0x14>
    d1b2:	8b 12                	mov    (%edx),%edx
    d1b4:	29 c2                	sub    %eax,%edx
    d1b6:	89 d0                	mov    %edx,%eax
    d1b8:	f3 c3                	repz ret 

0000d1ba <_read_cache>:
    d1ba:	53                   	push   %ebx
    d1bb:	8b 54 24 08          	mov    0x8(%esp),%edx
    d1bf:	8b 42 10             	mov    0x10(%edx),%eax
    d1c2:	83 e0 01             	and    $0x1,%eax
    d1c5:	75 2e                	jne    d1f5 <_read_cache+0x3b>
    d1c7:	8b 5a 08             	mov    0x8(%edx),%ebx
    d1ca:	8b 4a 04             	mov    0x4(%edx),%ecx
    d1cd:	39 cb                	cmp    %ecx,%ebx
    d1cf:	74 29                	je     d1fa <_read_cache+0x40>
    d1d1:	8b 4a 04             	mov    0x4(%edx),%ecx
    d1d4:	8b 42 0c             	mov    0xc(%edx),%eax
    d1d7:	8b 0c 88             	mov    (%eax,%ecx,4),%ecx
    d1da:	8b 42 04             	mov    0x4(%edx),%eax
    d1dd:	83 c0 01             	add    $0x1,%eax
    d1e0:	89 42 04             	mov    %eax,0x4(%edx)
    d1e3:	8b 5a 04             	mov    0x4(%edx),%ebx
    d1e6:	89 c8                	mov    %ecx,%eax
    d1e8:	3b 1a                	cmp    (%edx),%ebx
    d1ea:	75 0e                	jne    d1fa <_read_cache+0x40>
    d1ec:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
    d1f3:	eb 05                	jmp    d1fa <_read_cache+0x40>
    d1f5:	b8 00 00 00 00       	mov    $0x0,%eax
    d1fa:	5b                   	pop    %ebx
    d1fb:	c3                   	ret    

0000d1fc <_write_cache>:
    d1fc:	53                   	push   %ebx
    d1fd:	8b 44 24 08          	mov    0x8(%esp),%eax
    d201:	f6 40 10 02          	testb  $0x2,0x10(%eax)
    d205:	75 31                	jne    d238 <_write_cache+0x3c>
    d207:	8b 48 08             	mov    0x8(%eax),%ecx
    d20a:	8b 50 04             	mov    0x4(%eax),%edx
    d20d:	83 ea 01             	sub    $0x1,%edx
    d210:	39 d1                	cmp    %edx,%ecx
    d212:	74 24                	je     d238 <_write_cache+0x3c>
    d214:	8b 48 08             	mov    0x8(%eax),%ecx
    d217:	8b 50 0c             	mov    0xc(%eax),%edx
    d21a:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    d21e:	89 1c 8a             	mov    %ebx,(%edx,%ecx,4)
    d221:	8b 50 08             	mov    0x8(%eax),%edx
    d224:	83 c2 01             	add    $0x1,%edx
    d227:	89 50 08             	mov    %edx,0x8(%eax)
    d22a:	8b 50 08             	mov    0x8(%eax),%edx
    d22d:	3b 10                	cmp    (%eax),%edx
    d22f:	75 07                	jne    d238 <_write_cache+0x3c>
    d231:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    d238:	5b                   	pop    %ebx
    d239:	c3                   	ret    

0000d23a <_read_cache8>:
    d23a:	8b 54 24 04          	mov    0x4(%esp),%edx
    d23e:	b8 00 00 00 00       	mov    $0x0,%eax
    d243:	f6 42 10 01          	testb  $0x1,0x10(%edx)
    d247:	75 31                	jne    d27a <_read_cache8+0x40>
    d249:	8b 4a 08             	mov    0x8(%edx),%ecx
    d24c:	8b 42 04             	mov    0x4(%edx),%eax
    d24f:	39 c1                	cmp    %eax,%ecx
    d251:	74 22                	je     d275 <_read_cache8+0x3b>
    d253:	8b 42 04             	mov    0x4(%edx),%eax
    d256:	8b 4a 0c             	mov    0xc(%edx),%ecx
    d259:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
    d25d:	8b 4a 04             	mov    0x4(%edx),%ecx
    d260:	83 c1 01             	add    $0x1,%ecx
    d263:	89 4a 04             	mov    %ecx,0x4(%edx)
    d266:	8b 4a 04             	mov    0x4(%edx),%ecx
    d269:	3b 0a                	cmp    (%edx),%ecx
    d26b:	75 0d                	jne    d27a <_read_cache8+0x40>
    d26d:	c7 42 04 00 00 00 00 	movl   $0x0,0x4(%edx)
    d274:	c3                   	ret    
    d275:	b8 00 00 00 00       	mov    $0x0,%eax
    d27a:	f3 c3                	repz ret 

0000d27c <_write_cache8>:
    d27c:	53                   	push   %ebx
    d27d:	8b 44 24 08          	mov    0x8(%esp),%eax
    d281:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    d285:	f6 40 10 02          	testb  $0x2,0x10(%eax)
    d289:	75 2d                	jne    d2b8 <_write_cache8+0x3c>
    d28b:	8b 58 08             	mov    0x8(%eax),%ebx
    d28e:	8b 50 04             	mov    0x4(%eax),%edx
    d291:	83 ea 01             	sub    $0x1,%edx
    d294:	39 d3                	cmp    %edx,%ebx
    d296:	74 20                	je     d2b8 <_write_cache8+0x3c>
    d298:	8b 50 08             	mov    0x8(%eax),%edx
    d29b:	8b 58 0c             	mov    0xc(%eax),%ebx
    d29e:	88 0c 13             	mov    %cl,(%ebx,%edx,1)
    d2a1:	8b 50 08             	mov    0x8(%eax),%edx
    d2a4:	83 c2 01             	add    $0x1,%edx
    d2a7:	89 50 08             	mov    %edx,0x8(%eax)
    d2aa:	8b 50 08             	mov    0x8(%eax),%edx
    d2ad:	3b 10                	cmp    (%eax),%edx
    d2af:	75 07                	jne    d2b8 <_write_cache8+0x3c>
    d2b1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    d2b8:	5b                   	pop    %ebx
    d2b9:	c3                   	ret    

0000d2ba <_readable>:
    d2ba:	8b 44 24 04          	mov    0x4(%esp),%eax
    d2be:	f6 40 10 01          	testb  $0x1,0x10(%eax)
    d2c2:	0f 94 c0             	sete   %al
    d2c5:	0f b6 c0             	movzbl %al,%eax
    d2c8:	c3                   	ret    

0000d2c9 <_writeable>:
    d2c9:	8b 44 24 04          	mov    0x4(%esp),%eax
    d2cd:	f6 40 10 02          	testb  $0x2,0x10(%eax)
    d2d1:	0f 94 c0             	sete   %al
    d2d4:	0f b6 c0             	movzbl %al,%eax
    d2d7:	c3                   	ret    

0000d2d8 <_readable8>:
    d2d8:	8b 44 24 04          	mov    0x4(%esp),%eax
    d2dc:	f6 40 10 01          	testb  $0x1,0x10(%eax)
    d2e0:	0f 94 c0             	sete   %al
    d2e3:	0f b6 c0             	movzbl %al,%eax
    d2e6:	c3                   	ret    

0000d2e7 <_writeable8>:
    d2e7:	8b 44 24 04          	mov    0x4(%esp),%eax
    d2eb:	f6 40 10 02          	testb  $0x2,0x10(%eax)
    d2ef:	0f 94 c0             	sete   %al
    d2f2:	0f b6 c0             	movzbl %al,%eax
    d2f5:	c3                   	ret    

0000d2f6 <_read_cache_wait>:
    d2f6:	53                   	push   %ebx
    d2f7:	83 ec 04             	sub    $0x4,%esp
    d2fa:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    d2fe:	b8 00 00 00 00       	mov    $0x0,%eax
    d303:	f6 43 10 01          	testb  $0x1,0x10(%ebx)
    d307:	75 14                	jne    d31d <_read_cache_wait+0x27>
    d309:	89 1c 24             	mov    %ebx,(%esp)
    d30c:	e8 93 fe ff ff       	call   d1a4 <_fifo_size>
    d311:	85 c0                	test   %eax,%eax
    d313:	74 f4                	je     d309 <_read_cache_wait+0x13>
    d315:	89 1c 24             	mov    %ebx,(%esp)
    d318:	e8 9d fe ff ff       	call   d1ba <_read_cache>
    d31d:	83 c4 04             	add    $0x4,%esp
    d320:	5b                   	pop    %ebx
    d321:	c3                   	ret    

0000d322 <_write_cache_wait>:
    d322:	53                   	push   %ebx
    d323:	83 ec 08             	sub    $0x8,%esp
    d326:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    d32a:	f6 43 10 02          	testb  $0x2,0x10(%ebx)
    d32e:	75 21                	jne    d351 <_write_cache_wait+0x2f>
    d330:	89 1c 24             	mov    %ebx,(%esp)
    d333:	e8 6c fe ff ff       	call   d1a4 <_fifo_size>
    d338:	8b 0b                	mov    (%ebx),%ecx
    d33a:	8d 51 ff             	lea    -0x1(%ecx),%edx
    d33d:	39 d0                	cmp    %edx,%eax
    d33f:	74 ef                	je     d330 <_write_cache_wait+0xe>
    d341:	8b 44 24 14          	mov    0x14(%esp),%eax
    d345:	89 44 24 04          	mov    %eax,0x4(%esp)
    d349:	89 1c 24             	mov    %ebx,(%esp)
    d34c:	e8 ab fe ff ff       	call   d1fc <_write_cache>
    d351:	83 c4 08             	add    $0x8,%esp
    d354:	5b                   	pop    %ebx
    d355:	c3                   	ret    

0000d356 <_front_cache>:
    d356:	53                   	push   %ebx
    d357:	8b 54 24 08          	mov    0x8(%esp),%edx
    d35b:	8b 42 10             	mov    0x10(%edx),%eax
    d35e:	83 e0 01             	and    $0x1,%eax
    d361:	75 15                	jne    d378 <_front_cache+0x22>
    d363:	8b 5a 08             	mov    0x8(%edx),%ebx
    d366:	8b 4a 04             	mov    0x4(%edx),%ecx
    d369:	39 cb                	cmp    %ecx,%ebx
    d36b:	74 10                	je     d37d <_front_cache+0x27>
    d36d:	8b 4a 04             	mov    0x4(%edx),%ecx
    d370:	8b 42 0c             	mov    0xc(%edx),%eax
    d373:	8b 04 88             	mov    (%eax,%ecx,4),%eax
    d376:	eb 05                	jmp    d37d <_front_cache+0x27>
    d378:	b8 00 00 00 00       	mov    $0x0,%eax
    d37d:	5b                   	pop    %ebx
    d37e:	c3                   	ret    

0000d37f <_front_cache_wait>:
    d37f:	53                   	push   %ebx
    d380:	83 ec 04             	sub    $0x4,%esp
    d383:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
    d387:	b8 00 00 00 00       	mov    $0x0,%eax
    d38c:	f6 43 10 01          	testb  $0x1,0x10(%ebx)
    d390:	75 14                	jne    d3a6 <_front_cache_wait+0x27>
    d392:	89 1c 24             	mov    %ebx,(%esp)
    d395:	e8 0a fe ff ff       	call   d1a4 <_fifo_size>
    d39a:	85 c0                	test   %eax,%eax
    d39c:	74 f4                	je     d392 <_front_cache_wait+0x13>
    d39e:	89 1c 24             	mov    %ebx,(%esp)
    d3a1:	e8 b0 ff ff ff       	call   d356 <_front_cache>
    d3a6:	83 c4 04             	add    $0x4,%esp
    d3a9:	5b                   	pop    %ebx
    d3aa:	c3                   	ret    

0000d3ab <_count_cache>:
    d3ab:	53                   	push   %ebx
    d3ac:	8b 54 24 08          	mov    0x8(%esp),%edx
    d3b0:	8b 42 10             	mov    0x10(%edx),%eax
    d3b3:	83 e0 01             	and    $0x1,%eax
    d3b6:	75 1d                	jne    d3d5 <_count_cache+0x2a>
    d3b8:	8b 5a 08             	mov    0x8(%edx),%ebx
    d3bb:	8b 4a 04             	mov    0x4(%edx),%ecx
    d3be:	03 4c 24 0c          	add    0xc(%esp),%ecx
    d3c2:	39 cb                	cmp    %ecx,%ebx
    d3c4:	74 14                	je     d3da <_count_cache+0x2f>
    d3c6:	8b 42 04             	mov    0x4(%edx),%eax
    d3c9:	03 44 24 0c          	add    0xc(%esp),%eax
    d3cd:	8b 52 0c             	mov    0xc(%edx),%edx
    d3d0:	8b 04 82             	mov    (%edx,%eax,4),%eax
    d3d3:	eb 05                	jmp    d3da <_count_cache+0x2f>
    d3d5:	b8 00 00 00 00       	mov    $0x0,%eax
    d3da:	5b                   	pop    %ebx
    d3db:	c3                   	ret    

0000d3dc <_pop_cache>:
    d3dc:	8b 44 24 04          	mov    0x4(%esp),%eax
    d3e0:	f6 40 10 01          	testb  $0x1,0x10(%eax)
    d3e4:	75 17                	jne    d3fd <_pop_cache+0x21>
    d3e6:	8b 50 04             	mov    0x4(%eax),%edx
    d3e9:	83 c2 01             	add    $0x1,%edx
    d3ec:	89 50 04             	mov    %edx,0x4(%eax)
    d3ef:	8b 50 04             	mov    0x4(%eax),%edx
    d3f2:	3b 10                	cmp    (%eax),%edx
    d3f4:	75 07                	jne    d3fd <_pop_cache+0x21>
    d3f6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    d3fd:	f3 c3                	repz ret 
    d3ff:	90                   	nop

0000d400 <_int30api>:
    d400:	83 ec 1c             	sub    $0x1c,%esp
    d403:	c7 04 24 1c f5 00 00 	movl   $0xf51c,(%esp)
    d40a:	e8 1b fb ff ff       	call   cf2a <_puts>
    d40f:	83 c4 1c             	add    $0x1c,%esp
    d412:	c3                   	ret    

0000d413 <_int31api_basic_io>:
    d413:	57                   	push   %edi
    d414:	56                   	push   %esi
    d415:	53                   	push   %ebx
    d416:	83 ec 10             	sub    $0x10,%esp
    d419:	8b 74 24 20          	mov    0x20(%esp),%esi
    d41d:	8b 44 24 28          	mov    0x28(%esp),%eax
    d421:	83 f8 01             	cmp    $0x1,%eax
    d424:	75 11                	jne    d437 <_int31api_basic_io+0x24>
    d426:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d42a:	89 04 24             	mov    %eax,(%esp)
    d42d:	e8 ae fa ff ff       	call   cee0 <_putch>
    d432:	e9 87 01 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d437:	83 f8 02             	cmp    $0x2,%eax
    d43a:	75 19                	jne    d455 <_int31api_basic_io+0x42>
    d43c:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    d443:	00 
    d444:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d448:	89 04 24             	mov    %eax,(%esp)
    d44b:	e8 0a fb ff ff       	call   cf5a <_putint>
    d450:	e9 69 01 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d455:	83 f8 03             	cmp    $0x3,%eax
    d458:	75 19                	jne    d473 <_int31api_basic_io+0x60>
    d45a:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
    d461:	00 
    d462:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d466:	89 04 24             	mov    %eax,(%esp)
    d469:	e8 4b fb ff ff       	call   cfb9 <_putdec>
    d46e:	e9 4b 01 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d473:	83 f8 04             	cmp    $0x4,%eax
    d476:	75 19                	jne    d491 <_int31api_basic_io+0x7e>
    d478:	8b 44 24 30          	mov    0x30(%esp),%eax
    d47c:	89 44 24 04          	mov    %eax,0x4(%esp)
    d480:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d484:	89 04 24             	mov    %eax,(%esp)
    d487:	e8 ce fa ff ff       	call   cf5a <_putint>
    d48c:	e9 2d 01 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d491:	83 f8 05             	cmp    $0x5,%eax
    d494:	75 19                	jne    d4af <_int31api_basic_io+0x9c>
    d496:	8b 44 24 30          	mov    0x30(%esp),%eax
    d49a:	89 44 24 04          	mov    %eax,0x4(%esp)
    d49e:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d4a2:	89 04 24             	mov    %eax,(%esp)
    d4a5:	e8 0f fb ff ff       	call   cfb9 <_putdec>
    d4aa:	e9 0f 01 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d4af:	83 f8 06             	cmp    $0x6,%eax
    d4b2:	75 11                	jne    d4c5 <_int31api_basic_io+0xb2>
    d4b4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
    d4bb:	e8 20 fa ff ff       	call   cee0 <_putch>
    d4c0:	e9 f9 00 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d4c5:	83 f8 07             	cmp    $0x7,%eax
    d4c8:	75 11                	jne    d4db <_int31api_basic_io+0xc8>
    d4ca:	c7 04 24 0d 00 00 00 	movl   $0xd,(%esp)
    d4d1:	e8 0a fa ff ff       	call   cee0 <_putch>
    d4d6:	e9 e3 00 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d4db:	83 f8 08             	cmp    $0x8,%eax
    d4de:	75 11                	jne    d4f1 <_int31api_basic_io+0xde>
    d4e0:	c7 04 24 22 f5 00 00 	movl   $0xf522,(%esp)
    d4e7:	e8 3e fa ff ff       	call   cf2a <_puts>
    d4ec:	e9 cd 00 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d4f1:	83 f8 09             	cmp    $0x9,%eax
    d4f4:	75 0d                	jne    d503 <_int31api_basic_io+0xf0>
    d4f6:	89 34 24             	mov    %esi,(%esp)
    d4f9:	e8 bc fc ff ff       	call   d1ba <_read_cache>
    d4fe:	e9 bb 00 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d503:	83 f8 0a             	cmp    $0xa,%eax
    d506:	75 0d                	jne    d515 <_int31api_basic_io+0x102>
    d508:	89 34 24             	mov    %esi,(%esp)
    d50b:	e8 e6 fd ff ff       	call   d2f6 <_read_cache_wait>
    d510:	e9 a9 00 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d515:	83 f8 0b             	cmp    $0xb,%eax
    d518:	75 15                	jne    d52f <_int31api_basic_io+0x11c>
    d51a:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d51e:	89 44 24 04          	mov    %eax,0x4(%esp)
    d522:	89 34 24             	mov    %esi,(%esp)
    d525:	e8 d2 fc ff ff       	call   d1fc <_write_cache>
    d52a:	e9 8f 00 00 00       	jmp    d5be <_int31api_basic_io+0x1ab>
    d52f:	83 f8 0c             	cmp    $0xc,%eax
    d532:	75 12                	jne    d546 <_int31api_basic_io+0x133>
    d534:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d538:	89 44 24 04          	mov    %eax,0x4(%esp)
    d53c:	89 34 24             	mov    %esi,(%esp)
    d53f:	e8 de fd ff ff       	call   d322 <_write_cache_wait>
    d544:	eb 78                	jmp    d5be <_int31api_basic_io+0x1ab>
    d546:	83 f8 0d             	cmp    $0xd,%eax
    d549:	75 12                	jne    d55d <_int31api_basic_io+0x14a>
    d54b:	8b 44 24 24          	mov    0x24(%esp),%eax
    d54f:	03 44 24 34          	add    0x34(%esp),%eax
    d553:	89 04 24             	mov    %eax,(%esp)
    d556:	e8 a1 f9 ff ff       	call   cefc <_putstr>
    d55b:	eb 61                	jmp    d5be <_int31api_basic_io+0x1ab>
    d55d:	83 f8 0e             	cmp    $0xe,%eax
    d560:	75 12                	jne    d574 <_int31api_basic_io+0x161>
    d562:	8b 44 24 24          	mov    0x24(%esp),%eax
    d566:	03 44 24 34          	add    0x34(%esp),%eax
    d56a:	89 04 24             	mov    %eax,(%esp)
    d56d:	e8 b8 f9 ff ff       	call   cf2a <_puts>
    d572:	eb 4a                	jmp    d5be <_int31api_basic_io+0x1ab>
    d574:	83 f8 13             	cmp    $0x13,%eax
    d577:	75 27                	jne    d5a0 <_int31api_basic_io+0x18d>
    d579:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
    d57e:	74 3e                	je     d5be <_int31api_basic_io+0x1ab>
    d580:	8b 7c 24 24          	mov    0x24(%esp),%edi
    d584:	03 7c 24 34          	add    0x34(%esp),%edi
    d588:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
    d58c:	89 34 24             	mov    %esi,(%esp)
    d58f:	e8 62 fd ff ff       	call   d2f6 <_read_cache_wait>
    d594:	88 07                	mov    %al,(%edi)
    d596:	83 c7 01             	add    $0x1,%edi
    d599:	83 eb 01             	sub    $0x1,%ebx
    d59c:	75 ee                	jne    d58c <_int31api_basic_io+0x179>
    d59e:	eb 1e                	jmp    d5be <_int31api_basic_io+0x1ab>
    d5a0:	83 f8 14             	cmp    $0x14,%eax
    d5a3:	75 19                	jne    d5be <_int31api_basic_io+0x1ab>
    d5a5:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    d5a9:	03 5c 24 34          	add    0x34(%esp),%ebx
    d5ad:	89 34 24             	mov    %esi,(%esp)
    d5b0:	e8 41 fd ff ff       	call   d2f6 <_read_cache_wait>
    d5b5:	88 03                	mov    %al,(%ebx)
    d5b7:	83 c3 01             	add    $0x1,%ebx
    d5ba:	3c 0a                	cmp    $0xa,%al
    d5bc:	75 ef                	jne    d5ad <_int31api_basic_io+0x19a>
    d5be:	83 c4 10             	add    $0x10,%esp
    d5c1:	5b                   	pop    %ebx
    d5c2:	5e                   	pop    %esi
    d5c3:	5f                   	pop    %edi
    d5c4:	c3                   	ret    

0000d5c5 <_int31api_file_io>:
    d5c5:	55                   	push   %ebp
    d5c6:	57                   	push   %edi
    d5c7:	56                   	push   %esi
    d5c8:	53                   	push   %ebx
    d5c9:	83 ec 5c             	sub    $0x5c,%esp
    d5cc:	8b 54 24 78          	mov    0x78(%esp),%edx
    d5d0:	83 fa 37             	cmp    $0x37,%edx
    d5d3:	75 6b                	jne    d640 <_int31api_file_io+0x7b>
    d5d5:	a1 58 40 00 00       	mov    0x4058,%eax
    d5da:	85 c0                	test   %eax,%eax
    d5dc:	7e 48                	jle    d626 <_int31api_file_io+0x61>
    d5de:	be 00 00 00 00       	mov    $0x0,%esi
    d5e3:	89 f3                	mov    %esi,%ebx
    d5e5:	c1 e3 05             	shl    $0x5,%ebx
    d5e8:	03 1d 5c 40 00 00    	add    0x405c,%ebx
    d5ee:	8b 43 18             	mov    0x18(%ebx),%eax
    d5f1:	89 44 24 0c          	mov    %eax,0xc(%esp)
    d5f5:	8b 43 1c             	mov    0x1c(%ebx),%eax
    d5f8:	89 44 24 08          	mov    %eax,0x8(%esp)
    d5fc:	0f be 03             	movsbl (%ebx),%eax
    d5ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    d603:	c7 04 24 2f f5 00 00 	movl   $0xf52f,(%esp)
    d60a:	e8 21 fa ff ff       	call   d030 <_printf>
    d60f:	83 c3 01             	add    $0x1,%ebx
    d612:	89 1c 24             	mov    %ebx,(%esp)
    d615:	e8 10 f9 ff ff       	call   cf2a <_puts>
    d61a:	83 c6 01             	add    $0x1,%esi
    d61d:	a1 58 40 00 00       	mov    0x4058,%eax
    d622:	39 f0                	cmp    %esi,%eax
    d624:	7f bd                	jg     d5e3 <_int31api_file_io+0x1e>
    d626:	89 44 24 04          	mov    %eax,0x4(%esp)
    d62a:	c7 04 24 3a f5 00 00 	movl   $0xf53a,(%esp)
    d631:	e8 fa f9 ff ff       	call   d030 <_printf>
    d636:	bb 00 00 00 00       	mov    $0x0,%ebx
    d63b:	e9 28 02 00 00       	jmp    d868 <_int31api_file_io+0x2a3>
    d640:	83 fa 41             	cmp    $0x41,%edx
    d643:	0f 85 c6 00 00 00    	jne    d70f <_int31api_file_io+0x14a>
    d649:	8b 44 24 70          	mov    0x70(%esp),%eax
    d64d:	8b 50 34             	mov    0x34(%eax),%edx
    d650:	80 3a 00             	cmpb   $0x0,(%edx)
    d653:	74 12                	je     d667 <_int31api_file_io+0xa2>
    d655:	b8 00 00 00 00       	mov    $0x0,%eax
    d65a:	83 c0 01             	add    $0x1,%eax
    d65d:	89 c3                	mov    %eax,%ebx
    d65f:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    d663:	75 f5                	jne    d65a <_int31api_file_io+0x95>
    d665:	eb 05                	jmp    d66c <_int31api_file_io+0xa7>
    d667:	bb 00 00 00 00       	mov    $0x0,%ebx
    d66c:	c6 44 1a ff 00       	movb   $0x0,-0x1(%edx,%ebx,1)
    d671:	8b 44 24 70          	mov    0x70(%esp),%eax
    d675:	8b 40 34             	mov    0x34(%eax),%eax
    d678:	89 04 24             	mov    %eax,(%esp)
    d67b:	e8 96 0e 00 00       	call   e516 <_fopen>
    d680:	89 c5                	mov    %eax,%ebp
    d682:	8b 44 24 70          	mov    0x70(%esp),%eax
    d686:	8b 40 34             	mov    0x34(%eax),%eax
    d689:	c6 44 18 ff 2f       	movb   $0x2f,-0x1(%eax,%ebx,1)
    d68e:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
    d691:	89 df                	mov    %ebx,%edi
    d693:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    d697:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    d69b:	c7 04 24 4a f5 00 00 	movl   $0xf54a,(%esp)
    d6a2:	e8 89 f9 ff ff       	call   d030 <_printf>
    d6a7:	8b 43 18             	mov    0x18(%ebx),%eax
    d6aa:	85 c0                	test   %eax,%eax
    d6ac:	7e 3f                	jle    d6ed <_int31api_file_io+0x128>
    d6ae:	83 c3 01             	add    $0x1,%ebx
    d6b1:	be 00 00 00 00       	mov    $0x0,%esi
    d6b6:	8b 43 17             	mov    0x17(%ebx),%eax
    d6b9:	89 44 24 0c          	mov    %eax,0xc(%esp)
    d6bd:	8b 43 1b             	mov    0x1b(%ebx),%eax
    d6c0:	89 44 24 08          	mov    %eax,0x8(%esp)
    d6c4:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
    d6c8:	89 44 24 04          	mov    %eax,0x4(%esp)
    d6cc:	c7 04 24 2f f5 00 00 	movl   $0xf52f,(%esp)
    d6d3:	e8 58 f9 ff ff       	call   d030 <_printf>
    d6d8:	89 1c 24             	mov    %ebx,(%esp)
    d6db:	e8 4a f8 ff ff       	call   cf2a <_puts>
    d6e0:	83 c6 01             	add    $0x1,%esi
    d6e3:	8b 47 18             	mov    0x18(%edi),%eax
    d6e6:	83 c3 20             	add    $0x20,%ebx
    d6e9:	39 f0                	cmp    %esi,%eax
    d6eb:	7f c9                	jg     d6b6 <_int31api_file_io+0xf1>
    d6ed:	89 44 24 04          	mov    %eax,0x4(%esp)
    d6f1:	c7 04 24 3a f5 00 00 	movl   $0xf53a,(%esp)
    d6f8:	e8 33 f9 ff ff       	call   d030 <_printf>
    d6fd:	89 2c 24             	mov    %ebp,(%esp)
    d700:	e8 8f 0e 00 00       	call   e594 <_fclose>
    d705:	bb 00 00 00 00       	mov    $0x0,%ebx
    d70a:	e9 59 01 00 00       	jmp    d868 <_int31api_file_io+0x2a3>
    d70f:	83 fa 40             	cmp    $0x40,%edx
    d712:	75 22                	jne    d736 <_int31api_file_io+0x171>
    d714:	8b 44 24 74          	mov    0x74(%esp),%eax
    d718:	03 84 24 84 00 00 00 	add    0x84(%esp),%eax
    d71f:	89 04 24             	mov    %eax,(%esp)
    d722:	e8 ef 0d 00 00       	call   e516 <_fopen>
    d727:	89 c3                	mov    %eax,%ebx
    d729:	89 04 24             	mov    %eax,(%esp)
    d72c:	e8 63 0e 00 00       	call   e594 <_fclose>
    d731:	e9 32 01 00 00       	jmp    d868 <_int31api_file_io+0x2a3>
    d736:	83 fa 38             	cmp    $0x38,%edx
    d739:	0f 85 9f 00 00 00    	jne    d7de <_int31api_file_io+0x219>
    d73f:	8b 5c 24 74          	mov    0x74(%esp),%ebx
    d743:	03 9c 24 84 00 00 00 	add    0x84(%esp),%ebx
    d74a:	80 3b 2f             	cmpb   $0x2f,(%ebx)
    d74d:	75 17                	jne    d766 <_int31api_file_io+0x1a1>
    d74f:	c6 44 24 10 2e       	movb   $0x2e,0x10(%esp)
    d754:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    d758:	8d 44 24 11          	lea    0x11(%esp),%eax
    d75c:	89 04 24             	mov    %eax,(%esp)
    d75f:	e8 32 ed ff ff       	call   c496 <_strcpy>
    d764:	eb 23                	jmp    d789 <_int31api_file_io+0x1c4>
    d766:	8b 44 24 70          	mov    0x70(%esp),%eax
    d76a:	8b 40 34             	mov    0x34(%eax),%eax
    d76d:	89 44 24 04          	mov    %eax,0x4(%esp)
    d771:	8d 74 24 10          	lea    0x10(%esp),%esi
    d775:	89 34 24             	mov    %esi,(%esp)
    d778:	e8 19 ed ff ff       	call   c496 <_strcpy>
    d77d:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    d781:	89 34 24             	mov    %esi,(%esp)
    d784:	e8 30 ed ff ff       	call   c4b9 <_strcat>
    d789:	8d 44 24 10          	lea    0x10(%esp),%eax
    d78d:	89 04 24             	mov    %eax,(%esp)
    d790:	e8 81 0d 00 00       	call   e516 <_fopen>
    d795:	89 c6                	mov    %eax,%esi
    d797:	bb 00 00 00 00       	mov    $0x0,%ebx
    d79c:	85 c0                	test   %eax,%eax
    d79e:	0f 84 c4 00 00 00    	je     d868 <_int31api_file_io+0x2a3>
    d7a4:	8b 5c 24 74          	mov    0x74(%esp),%ebx
    d7a8:	03 9c 24 80 00 00 00 	add    0x80(%esp),%ebx
    d7af:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    d7b6:	8b 40 18             	mov    0x18(%eax),%eax
    d7b9:	89 43 08             	mov    %eax,0x8(%ebx)
    d7bc:	89 03                	mov    %eax,(%ebx)
    d7be:	89 34 24             	mov    %esi,(%esp)
    d7c1:	e8 c6 0d 00 00       	call   e58c <_filepos>
    d7c6:	89 43 0c             	mov    %eax,0xc(%ebx)
    d7c9:	89 f2                	mov    %esi,%edx
    d7cb:	c1 e2 08             	shl    $0x8,%edx
    d7ce:	0f be 06             	movsbl (%esi),%eax
    d7d1:	01 d0                	add    %edx,%eax
    d7d3:	83 c8 02             	or     $0x2,%eax
    d7d6:	89 43 10             	mov    %eax,0x10(%ebx)
    d7d9:	e9 8a 00 00 00       	jmp    d868 <_int31api_file_io+0x2a3>
    d7de:	83 fa 2c             	cmp    $0x2c,%edx
    d7e1:	75 55                	jne    d838 <_int31api_file_io+0x273>
    d7e3:	8b 44 24 74          	mov    0x74(%esp),%eax
    d7e7:	03 84 24 84 00 00 00 	add    0x84(%esp),%eax
    d7ee:	89 04 24             	mov    %eax,(%esp)
    d7f1:	e8 20 0d 00 00       	call   e516 <_fopen>
    d7f6:	89 c6                	mov    %eax,%esi
    d7f8:	bb 00 00 00 00       	mov    $0x0,%ebx
    d7fd:	85 c0                	test   %eax,%eax
    d7ff:	74 67                	je     d868 <_int31api_file_io+0x2a3>
    d801:	8b 5c 24 74          	mov    0x74(%esp),%ebx
    d805:	03 9c 24 80 00 00 00 	add    0x80(%esp),%ebx
    d80c:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
    d813:	8b 40 18             	mov    0x18(%eax),%eax
    d816:	89 43 08             	mov    %eax,0x8(%ebx)
    d819:	89 03                	mov    %eax,(%ebx)
    d81b:	89 34 24             	mov    %esi,(%esp)
    d81e:	e8 69 0d 00 00       	call   e58c <_filepos>
    d823:	89 43 0c             	mov    %eax,0xc(%ebx)
    d826:	89 f2                	mov    %esi,%edx
    d828:	c1 e2 08             	shl    $0x8,%edx
    d82b:	0f be 06             	movsbl (%esi),%eax
    d82e:	01 d0                	add    %edx,%eax
    d830:	83 c8 02             	or     $0x2,%eax
    d833:	89 43 10             	mov    %eax,0x10(%ebx)
    d836:	eb 30                	jmp    d868 <_int31api_file_io+0x2a3>
    d838:	bb 00 00 00 00       	mov    $0x0,%ebx
    d83d:	83 fa 44             	cmp    $0x44,%edx
    d840:	75 26                	jne    d868 <_int31api_file_io+0x2a3>
    d842:	8b 84 24 80 00 00 00 	mov    0x80(%esp),%eax
    d849:	89 44 24 08          	mov    %eax,0x8(%esp)
    d84d:	8b 44 24 7c          	mov    0x7c(%esp),%eax
    d851:	89 44 24 04          	mov    %eax,0x4(%esp)
    d855:	8b 44 24 74          	mov    0x74(%esp),%eax
    d859:	03 84 24 84 00 00 00 	add    0x84(%esp),%eax
    d860:	89 04 24             	mov    %eax,(%esp)
    d863:	e8 f9 0b 00 00       	call   e461 <_fcreate>
    d868:	89 d8                	mov    %ebx,%eax
    d86a:	83 c4 5c             	add    $0x5c,%esp
    d86d:	5b                   	pop    %ebx
    d86e:	5e                   	pop    %esi
    d86f:	5f                   	pop    %edi
    d870:	5d                   	pop    %ebp
    d871:	c3                   	ret    

0000d872 <_int31api_common_io>:
    d872:	57                   	push   %edi
    d873:	56                   	push   %esi
    d874:	53                   	push   %ebx
    d875:	83 ec 10             	sub    $0x10,%esp
    d878:	8b 54 24 28          	mov    0x28(%esp),%edx
    d87c:	83 fa 20             	cmp    $0x20,%edx
    d87f:	75 15                	jne    d896 <_int31api_common_io+0x24>
    d881:	8b 44 24 24          	mov    0x24(%esp),%eax
    d885:	03 44 24 34          	add    0x34(%esp),%eax
    d889:	89 04 24             	mov    %eax,(%esp)
    d88c:	e8 85 0c 00 00       	call   e516 <_fopen>
    d891:	e9 47 02 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d896:	83 fa 21             	cmp    $0x21,%edx
    d899:	75 11                	jne    d8ac <_int31api_common_io+0x3a>
    d89b:	8b 44 24 30          	mov    0x30(%esp),%eax
    d89f:	89 04 24             	mov    %eax,(%esp)
    d8a2:	e8 e5 0c 00 00       	call   e58c <_filepos>
    d8a7:	e9 31 02 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d8ac:	83 fa 22             	cmp    $0x22,%edx
    d8af:	75 1e                	jne    d8cf <_int31api_common_io+0x5d>
    d8b1:	c7 44 24 04 00 01 00 	movl   $0x100,0x4(%esp)
    d8b8:	00 
    d8b9:	8b 44 24 20          	mov    0x20(%esp),%eax
    d8bd:	89 04 24             	mov    %eax,(%esp)
    d8c0:	e8 37 f9 ff ff       	call   d1fc <_write_cache>
    d8c5:	b8 00 00 00 00       	mov    $0x0,%eax
    d8ca:	e9 0e 02 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d8cf:	83 fa 23             	cmp    $0x23,%edx
    d8d2:	75 16                	jne    d8ea <_int31api_common_io+0x78>
    d8d4:	8b 44 24 20          	mov    0x20(%esp),%eax
    d8d8:	89 04 24             	mov    %eax,(%esp)
    d8db:	e8 fc fa ff ff       	call   d3dc <_pop_cache>
    d8e0:	b8 00 00 00 00       	mov    $0x0,%eax
    d8e5:	e9 f3 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d8ea:	83 fa 24             	cmp    $0x24,%edx
    d8ed:	75 11                	jne    d900 <_int31api_common_io+0x8e>
    d8ef:	8b 44 24 20          	mov    0x20(%esp),%eax
    d8f3:	89 04 24             	mov    %eax,(%esp)
    d8f6:	e8 5b fa ff ff       	call   d356 <_front_cache>
    d8fb:	e9 dd 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d900:	83 fa 25             	cmp    $0x25,%edx
    d903:	75 11                	jne    d916 <_int31api_common_io+0xa4>
    d905:	8b 44 24 20          	mov    0x20(%esp),%eax
    d909:	89 04 24             	mov    %eax,(%esp)
    d90c:	e8 6e fa ff ff       	call   d37f <_front_cache_wait>
    d911:	e9 c7 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d916:	83 fa 2d             	cmp    $0x2d,%edx
    d919:	75 22                	jne    d93d <_int31api_common_io+0xcb>
    d91b:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d91f:	89 44 24 04          	mov    %eax,0x4(%esp)
    d923:	8b 44 24 24          	mov    0x24(%esp),%eax
    d927:	03 44 24 30          	add    0x30(%esp),%eax
    d92b:	89 04 24             	mov    %eax,(%esp)
    d92e:	e8 49 f9 ff ff       	call   d27c <_write_cache8>
    d933:	b8 00 00 00 00       	mov    $0x0,%eax
    d938:	e9 a0 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d93d:	83 fa 2e             	cmp    $0x2e,%edx
    d940:	75 15                	jne    d957 <_int31api_common_io+0xe5>
    d942:	8b 44 24 24          	mov    0x24(%esp),%eax
    d946:	03 44 24 30          	add    0x30(%esp),%eax
    d94a:	89 04 24             	mov    %eax,(%esp)
    d94d:	e8 e8 f8 ff ff       	call   d23a <_read_cache8>
    d952:	e9 86 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d957:	83 fa 2f             	cmp    $0x2f,%edx
    d95a:	75 15                	jne    d971 <_int31api_common_io+0xff>
    d95c:	8b 44 24 24          	mov    0x24(%esp),%eax
    d960:	03 44 24 30          	add    0x30(%esp),%eax
    d964:	89 04 24             	mov    %eax,(%esp)
    d967:	e8 ea f9 ff ff       	call   d356 <_front_cache>
    d96c:	e9 6c 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d971:	83 fa 30             	cmp    $0x30,%edx
    d974:	75 1a                	jne    d990 <_int31api_common_io+0x11e>
    d976:	8b 44 24 24          	mov    0x24(%esp),%eax
    d97a:	03 44 24 30          	add    0x30(%esp),%eax
    d97e:	89 04 24             	mov    %eax,(%esp)
    d981:	e8 56 fa ff ff       	call   d3dc <_pop_cache>
    d986:	b8 00 00 00 00       	mov    $0x0,%eax
    d98b:	e9 4d 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d990:	83 fa 31             	cmp    $0x31,%edx
    d993:	75 21                	jne    d9b6 <_int31api_common_io+0x144>
    d995:	8b 44 24 24          	mov    0x24(%esp),%eax
    d999:	8b 4c 24 30          	mov    0x30(%esp),%ecx
    d99d:	8b 44 08 10          	mov    0x10(%eax,%ecx,1),%eax
    d9a1:	c1 e8 08             	shr    $0x8,%eax
    d9a4:	89 04 24             	mov    %eax,(%esp)
    d9a7:	e8 e8 0b 00 00       	call   e594 <_fclose>
    d9ac:	b8 00 00 00 00       	mov    $0x0,%eax
    d9b1:	e9 27 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d9b6:	83 fa 32             	cmp    $0x32,%edx
    d9b9:	75 22                	jne    d9dd <_int31api_common_io+0x16b>
    d9bb:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    d9bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    d9c3:	8b 44 24 24          	mov    0x24(%esp),%eax
    d9c7:	03 44 24 30          	add    0x30(%esp),%eax
    d9cb:	89 04 24             	mov    %eax,(%esp)
    d9ce:	e8 4f f9 ff ff       	call   d322 <_write_cache_wait>
    d9d3:	b8 00 00 00 00       	mov    $0x0,%eax
    d9d8:	e9 00 01 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d9dd:	83 fa 33             	cmp    $0x33,%edx
    d9e0:	75 15                	jne    d9f7 <_int31api_common_io+0x185>
    d9e2:	8b 44 24 24          	mov    0x24(%esp),%eax
    d9e6:	03 44 24 30          	add    0x30(%esp),%eax
    d9ea:	89 04 24             	mov    %eax,(%esp)
    d9ed:	e8 04 f9 ff ff       	call   d2f6 <_read_cache_wait>
    d9f2:	e9 e6 00 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    d9f7:	83 fa 34             	cmp    $0x34,%edx
    d9fa:	75 15                	jne    da11 <_int31api_common_io+0x19f>
    d9fc:	8b 44 24 24          	mov    0x24(%esp),%eax
    da00:	03 44 24 30          	add    0x30(%esp),%eax
    da04:	89 04 24             	mov    %eax,(%esp)
    da07:	e8 73 f9 ff ff       	call   d37f <_front_cache_wait>
    da0c:	e9 cc 00 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    da11:	83 fa 35             	cmp    $0x35,%edx
    da14:	75 3c                	jne    da52 <_int31api_common_io+0x1e0>
    da16:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    da1a:	03 5c 24 38          	add    0x38(%esp),%ebx
    da1e:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
    da23:	0f 84 a8 00 00 00    	je     dad1 <_int31api_common_io+0x25f>
    da29:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    da2d:	8b 7c 24 24          	mov    0x24(%esp),%edi
    da31:	03 7c 24 30          	add    0x30(%esp),%edi
    da35:	83 c3 01             	add    $0x1,%ebx
    da38:	89 3c 24             	mov    %edi,(%esp)
    da3b:	e8 7a f7 ff ff       	call   d1ba <_read_cache>
    da40:	88 43 ff             	mov    %al,-0x1(%ebx)
    da43:	83 ee 01             	sub    $0x1,%esi
    da46:	75 ed                	jne    da35 <_int31api_common_io+0x1c3>
    da48:	b8 00 00 00 00       	mov    $0x0,%eax
    da4d:	e9 8b 00 00 00       	jmp    dadd <_int31api_common_io+0x26b>
    da52:	83 fa 36             	cmp    $0x36,%edx
    da55:	75 3a                	jne    da91 <_int31api_common_io+0x21f>
    da57:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    da5b:	03 5c 24 34          	add    0x34(%esp),%ebx
    da5f:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
    da64:	74 72                	je     dad8 <_int31api_common_io+0x266>
    da66:	8b 74 24 2c          	mov    0x2c(%esp),%esi
    da6a:	8b 7c 24 24          	mov    0x24(%esp),%edi
    da6e:	03 7c 24 30          	add    0x30(%esp),%edi
    da72:	83 c3 01             	add    $0x1,%ebx
    da75:	0f be 43 ff          	movsbl -0x1(%ebx),%eax
    da79:	89 44 24 04          	mov    %eax,0x4(%esp)
    da7d:	89 3c 24             	mov    %edi,(%esp)
    da80:	e8 77 f7 ff ff       	call   d1fc <_write_cache>
    da85:	83 ee 01             	sub    $0x1,%esi
    da88:	75 e8                	jne    da72 <_int31api_common_io+0x200>
    da8a:	b8 00 00 00 00       	mov    $0x0,%eax
    da8f:	eb 4c                	jmp    dadd <_int31api_common_io+0x26b>
    da91:	83 fa 42             	cmp    $0x42,%edx
    da94:	75 1f                	jne    dab5 <_int31api_common_io+0x243>
    da96:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    da9a:	89 44 24 04          	mov    %eax,0x4(%esp)
    da9e:	8b 44 24 24          	mov    0x24(%esp),%eax
    daa2:	03 44 24 30          	add    0x30(%esp),%eax
    daa6:	89 04 24             	mov    %eax,(%esp)
    daa9:	e8 4e f7 ff ff       	call   d1fc <_write_cache>
    daae:	b8 00 00 00 00       	mov    $0x0,%eax
    dab3:	eb 28                	jmp    dadd <_int31api_common_io+0x26b>
    dab5:	b8 00 00 00 00       	mov    $0x0,%eax
    daba:	83 fa 43             	cmp    $0x43,%edx
    dabd:	75 1e                	jne    dadd <_int31api_common_io+0x26b>
    dabf:	8b 44 24 24          	mov    0x24(%esp),%eax
    dac3:	03 44 24 30          	add    0x30(%esp),%eax
    dac7:	89 04 24             	mov    %eax,(%esp)
    daca:	e8 eb f6 ff ff       	call   d1ba <_read_cache>
    dacf:	eb 0c                	jmp    dadd <_int31api_common_io+0x26b>
    dad1:	b8 00 00 00 00       	mov    $0x0,%eax
    dad6:	eb 05                	jmp    dadd <_int31api_common_io+0x26b>
    dad8:	b8 00 00 00 00       	mov    $0x0,%eax
    dadd:	83 c4 10             	add    $0x10,%esp
    dae0:	5b                   	pop    %ebx
    dae1:	5e                   	pop    %esi
    dae2:	5f                   	pop    %edi
    dae3:	c3                   	ret    

0000dae4 <_int31api_memory>:
    dae4:	55                   	push   %ebp
    dae5:	57                   	push   %edi
    dae6:	56                   	push   %esi
    dae7:	53                   	push   %ebx
    dae8:	83 ec 2c             	sub    $0x2c,%esp
    daeb:	8b 5c 24 40          	mov    0x40(%esp),%ebx
    daef:	8b 54 24 4c          	mov    0x4c(%esp),%edx
    daf3:	0f b7 6b 05          	movzwl 0x5(%ebx),%ebp
    daf7:	0f b7 3b             	movzwl (%ebx),%edi
    dafa:	0f b6 4b 07          	movzbl 0x7(%ebx),%ecx
    dafe:	0f b6 43 04          	movzbl 0x4(%ebx),%eax
    db02:	0f b7 73 02          	movzwl 0x2(%ebx),%esi
    db06:	66 89 74 24 1a       	mov    %si,0x1a(%esp)
    db0b:	83 fa 15             	cmp    $0x15,%edx
    db0e:	75 7d                	jne    db8d <_int31api_memory+0xa9>
    db10:	a1 00 40 00 00       	mov    0x4000,%eax
    db15:	8b a8 94 01 00 00    	mov    0x194(%eax),%ebp
    db1b:	a1 2c 40 00 00       	mov    0x402c,%eax
    db20:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
    db24:	7e 3e                	jle    db64 <_int31api_memory+0x80>
    db26:	bb 00 00 00 00       	mov    $0x0,%ebx
    db2b:	bf 00 00 00 00       	mov    $0x0,%edi
    db30:	8b 00                	mov    (%eax),%eax
    db32:	8d 34 d8             	lea    (%eax,%ebx,8),%esi
    db35:	8b 46 04             	mov    0x4(%esi),%eax
    db38:	89 44 24 0c          	mov    %eax,0xc(%esp)
    db3c:	8b 06                	mov    (%esi),%eax
    db3e:	89 44 24 08          	mov    %eax,0x8(%esp)
    db42:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    db46:	c7 04 24 51 f5 00 00 	movl   $0xf551,(%esp)
    db4d:	e8 de f4 ff ff       	call   d030 <_printf>
    db52:	03 7e 04             	add    0x4(%esi),%edi
    db55:	83 c3 01             	add    $0x1,%ebx
    db58:	a1 2c 40 00 00       	mov    0x402c,%eax
    db5d:	39 58 04             	cmp    %ebx,0x4(%eax)
    db60:	7f ce                	jg     db30 <_int31api_memory+0x4c>
    db62:	eb 05                	jmp    db69 <_int31api_memory+0x85>
    db64:	bf 00 00 00 00       	mov    $0x0,%edi
    db69:	c1 ff 08             	sar    $0x8,%edi
    db6c:	89 7c 24 08          	mov    %edi,0x8(%esp)
    db70:	c1 fd 08             	sar    $0x8,%ebp
    db73:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    db77:	c7 04 24 5c f5 00 00 	movl   $0xf55c,(%esp)
    db7e:	e8 ad f4 ff ff       	call   d030 <_printf>
    db83:	b8 00 00 00 00       	mov    $0x0,%eax
    db88:	e9 b2 01 00 00       	jmp    dd3f <_int31api_memory+0x25b>
    db8d:	83 fa 16             	cmp    $0x16,%edx
    db90:	75 11                	jne    dba3 <_int31api_memory+0xbf>
    db92:	8b 44 24 54          	mov    0x54(%esp),%eax
    db96:	89 04 24             	mov    %eax,(%esp)
    db99:	e8 db e4 ff ff       	call   c079 <_malloc_page>
    db9e:	e9 9c 01 00 00       	jmp    dd3f <_int31api_memory+0x25b>
    dba3:	83 fa 17             	cmp    $0x17,%edx
    dba6:	75 1e                	jne    dbc6 <_int31api_memory+0xe2>
    dba8:	8b 44 24 50          	mov    0x50(%esp),%eax
    dbac:	89 44 24 04          	mov    %eax,0x4(%esp)
    dbb0:	8b 44 24 54          	mov    0x54(%esp),%eax
    dbb4:	89 04 24             	mov    %eax,(%esp)
    dbb7:	e8 6f 0b 00 00       	call   e72b <_push_page>
    dbbc:	b8 00 00 00 00       	mov    $0x0,%eax
    dbc1:	e9 79 01 00 00       	jmp    dd3f <_int31api_memory+0x25b>
    dbc6:	83 fa 26             	cmp    $0x26,%edx
    dbc9:	75 21                	jne    dbec <_int31api_memory+0x108>
    dbcb:	8b 44 24 54          	mov    0x54(%esp),%eax
    dbcf:	89 04 24             	mov    %eax,(%esp)
    dbd2:	e8 a2 e4 ff ff       	call   c079 <_malloc_page>
    dbd7:	8b 4c 24 54          	mov    0x54(%esp),%ecx
    dbdb:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    dbdf:	89 04 24             	mov    %eax,(%esp)
    dbe2:	e8 44 0b 00 00       	call   e72b <_push_page>
    dbe7:	e9 53 01 00 00       	jmp    dd3f <_int31api_memory+0x25b>
    dbec:	83 fa 27             	cmp    $0x27,%edx
    dbef:	75 19                	jne    dc0a <_int31api_memory+0x126>
    dbf1:	8b 44 24 54          	mov    0x54(%esp),%eax
    dbf5:	89 44 24 04          	mov    %eax,0x4(%esp)
    dbf9:	c7 04 24 0c 40 00 00 	movl   $0x400c,(%esp)
    dc00:	e8 d6 e3 ff ff       	call   bfdb <_alloc>
    dc05:	e9 35 01 00 00       	jmp    dd3f <_int31api_memory+0x25b>
    dc0a:	83 fa 28             	cmp    $0x28,%edx
    dc0d:	75 2e                	jne    dc3d <_int31api_memory+0x159>
    dc0f:	8b 44 24 5c          	mov    0x5c(%esp),%eax
    dc13:	89 44 24 0c          	mov    %eax,0xc(%esp)
    dc17:	8b 44 24 58          	mov    0x58(%esp),%eax
    dc1b:	89 44 24 08          	mov    %eax,0x8(%esp)
    dc1f:	8b 44 24 54          	mov    0x54(%esp),%eax
    dc23:	89 44 24 04          	mov    %eax,0x4(%esp)
    dc27:	8b 44 24 50          	mov    0x50(%esp),%eax
    dc2b:	89 04 24             	mov    %eax,(%esp)
    dc2e:	e8 0c 0c 00 00       	call   e83f <_set_segmdesc>
    dc33:	b8 00 00 00 00       	mov    $0x0,%eax
    dc38:	e9 02 01 00 00       	jmp    dd3f <_int31api_memory+0x25b>
    dc3d:	89 ee                	mov    %ebp,%esi
    dc3f:	81 e6 00 0f 00 00    	and    $0xf00,%esi
    dc45:	c1 e6 08             	shl    $0x8,%esi
    dc48:	89 74 24 1c          	mov    %esi,0x1c(%esp)
    dc4c:	0f bf f7             	movswl %di,%esi
    dc4f:	03 74 24 1c          	add    0x1c(%esp),%esi
    dc53:	c1 e1 18             	shl    $0x18,%ecx
    dc56:	0f b6 c0             	movzbl %al,%eax
    dc59:	c1 e0 10             	shl    $0x10,%eax
    dc5c:	01 c1                	add    %eax,%ecx
    dc5e:	0f b7 7c 24 1a       	movzwl 0x1a(%esp),%edi
    dc63:	01 cf                	add    %ecx,%edi
    dc65:	83 fa 29             	cmp    $0x29,%edx
    dc68:	75 2f                	jne    dc99 <_int31api_memory+0x1b5>
    dc6a:	81 e5 ff f0 00 00    	and    $0xf0ff,%ebp
    dc70:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    dc74:	03 74 24 50          	add    0x50(%esp),%esi
    dc78:	89 74 24 08          	mov    %esi,0x8(%esp)
    dc7c:	89 7c 24 04          	mov    %edi,0x4(%esp)
    dc80:	8b 44 24 44          	mov    0x44(%esp),%eax
    dc84:	c1 f8 03             	sar    $0x3,%eax
    dc87:	89 04 24             	mov    %eax,(%esp)
    dc8a:	e8 b0 0b 00 00       	call   e83f <_set_segmdesc>
    dc8f:	b8 00 00 00 00       	mov    $0x0,%eax
    dc94:	e9 a6 00 00 00       	jmp    dd3f <_int31api_memory+0x25b>
    dc99:	83 fa 2a             	cmp    $0x2a,%edx
    dc9c:	75 4e                	jne    dcec <_int31api_memory+0x208>
    dc9e:	8b 44 24 50          	mov    0x50(%esp),%eax
    dca2:	89 04 24             	mov    %eax,(%esp)
    dca5:	e8 cf e3 ff ff       	call   c079 <_malloc_page>
    dcaa:	8b 4c 24 50          	mov    0x50(%esp),%ecx
    dcae:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    dcb2:	89 04 24             	mov    %eax,(%esp)
    dcb5:	e8 71 0a 00 00       	call   e72b <_push_page>
    dcba:	89 c5                	mov    %eax,%ebp
    dcbc:	0f bf 43 05          	movswl 0x5(%ebx),%eax
    dcc0:	25 ff f0 00 00       	and    $0xf0ff,%eax
    dcc5:	89 44 24 0c          	mov    %eax,0xc(%esp)
    dcc9:	03 74 24 50          	add    0x50(%esp),%esi
    dccd:	89 74 24 08          	mov    %esi,0x8(%esp)
    dcd1:	89 7c 24 04          	mov    %edi,0x4(%esp)
    dcd5:	8b 44 24 44          	mov    0x44(%esp),%eax
    dcd9:	c1 f8 03             	sar    $0x3,%eax
    dcdc:	89 04 24             	mov    %eax,(%esp)
    dcdf:	e8 5b 0b 00 00       	call   e83f <_set_segmdesc>
    dce4:	89 e8                	mov    %ebp,%eax
    dce6:	2b 44 24 48          	sub    0x48(%esp),%eax
    dcea:	eb 53                	jmp    dd3f <_int31api_memory+0x25b>
    dcec:	b8 00 00 00 00       	mov    $0x0,%eax
    dcf1:	83 fa 2b             	cmp    $0x2b,%edx
    dcf4:	75 49                	jne    dd3f <_int31api_memory+0x25b>
    dcf6:	81 e5 ff f0 00 00    	and    $0xf0ff,%ebp
    dcfc:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    dd00:	2b 74 24 50          	sub    0x50(%esp),%esi
    dd04:	89 74 24 08          	mov    %esi,0x8(%esp)
    dd08:	89 7c 24 04          	mov    %edi,0x4(%esp)
    dd0c:	8b 44 24 44          	mov    0x44(%esp),%eax
    dd10:	c1 f8 03             	sar    $0x3,%eax
    dd13:	89 04 24             	mov    %eax,(%esp)
    dd16:	e8 24 0b 00 00       	call   e83f <_set_segmdesc>
    dd1b:	8b 44 24 50          	mov    0x50(%esp),%eax
    dd1f:	89 04 24             	mov    %eax,(%esp)
    dd22:	e8 a9 09 00 00       	call   e6d0 <_pop_page>
    dd27:	8b 4c 24 50          	mov    0x50(%esp),%ecx
    dd2b:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    dd2f:	c1 f8 0c             	sar    $0xc,%eax
    dd32:	89 04 24             	mov    %eax,(%esp)
    dd35:	e8 a3 e6 ff ff       	call   c3dd <_free_page>
    dd3a:	b8 00 00 00 00       	mov    $0x0,%eax
    dd3f:	83 c4 2c             	add    $0x2c,%esp
    dd42:	5b                   	pop    %ebx
    dd43:	5e                   	pop    %esi
    dd44:	5f                   	pop    %edi
    dd45:	5d                   	pop    %ebp
    dd46:	c3                   	ret    

0000dd47 <_int31api_exec>:
    dd47:	55                   	push   %ebp
    dd48:	57                   	push   %edi
    dd49:	56                   	push   %esi
    dd4a:	53                   	push   %ebx
    dd4b:	83 ec 6c             	sub    $0x6c,%esp
    dd4e:	8b bc 24 80 00 00 00 	mov    0x80(%esp),%edi
    dd55:	8b ac 24 84 00 00 00 	mov    0x84(%esp),%ebp
    dd5c:	8b 94 24 8c 00 00 00 	mov    0x8c(%esp),%edx
    dd63:	8b b4 24 90 00 00 00 	mov    0x90(%esp),%esi
    dd6a:	8b 9c 24 94 00 00 00 	mov    0x94(%esp),%ebx
    dd71:	83 fa 3c             	cmp    $0x3c,%edx
    dd74:	75 3e                	jne    ddb4 <_int31api_exec+0x6d>
    dd76:	8b 47 34             	mov    0x34(%edi),%eax
    dd79:	89 44 24 14          	mov    %eax,0x14(%esp)
    dd7d:	c7 44 24 10 04 00 00 	movl   $0x4,0x10(%esp)
    dd84:	00 
    dd85:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
    dd8c:	00 
    dd8d:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    dd94:	00 
    dd95:	03 9c 24 88 00 00 00 	add    0x88(%esp),%ebx
    dd9c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    dda0:	03 b4 24 88 00 00 00 	add    0x88(%esp),%esi
    dda7:	89 34 24             	mov    %esi,(%esp)
    ddaa:	e8 ce ec ff ff       	call   ca7d <_exec>
    ddaf:	e9 c3 01 00 00       	jmp    df77 <_int31api_exec+0x230>
    ddb4:	83 fa 19             	cmp    $0x19,%edx
    ddb7:	75 4d                	jne    de06 <_int31api_exec+0xbf>
    ddb9:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    ddbd:	c7 04 24 71 f5 00 00 	movl   $0xf571,(%esp)
    ddc4:	e8 67 f2 ff ff       	call   d030 <_printf>
    ddc9:	89 2c 24             	mov    %ebp,(%esp)
    ddcc:	e8 ae f5 ff ff       	call   d37f <_front_cache_wait>
    ddd1:	3d 00 01 00 00       	cmp    $0x100,%eax
    ddd6:	75 f1                	jne    ddc9 <_int31api_exec+0x82>
    ddd8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    dddf:	00 
    dde0:	89 2c 24             	mov    %ebp,(%esp)
    dde3:	e8 c3 f5 ff ff       	call   d3ab <_count_cache>
    dde8:	39 d8                	cmp    %ebx,%eax
    ddea:	75 dd                	jne    ddc9 <_int31api_exec+0x82>
    ddec:	e8 93 ed ff ff       	call   cb84 <_unexec>
    ddf1:	89 2c 24             	mov    %ebp,(%esp)
    ddf4:	e8 e3 f5 ff ff       	call   d3dc <_pop_cache>
    ddf9:	89 2c 24             	mov    %ebp,(%esp)
    ddfc:	e8 b9 f3 ff ff       	call   d1ba <_read_cache>
    de01:	e9 71 01 00 00       	jmp    df77 <_int31api_exec+0x230>
    de06:	83 fa 1a             	cmp    $0x1a,%edx
    de09:	75 30                	jne    de3b <_int31api_exec+0xf4>
    de0b:	eb 05                	jmp    de12 <_int31api_exec+0xcb>
    de0d:	e8 88 0e 00 00       	call   ec9a <_hlt>
    de12:	89 2c 24             	mov    %ebp,(%esp)
    de15:	e8 65 f5 ff ff       	call   d37f <_front_cache_wait>
    de1a:	3d 00 01 00 00       	cmp    $0x100,%eax
    de1f:	75 ec                	jne    de0d <_int31api_exec+0xc6>
    de21:	e8 5e ed ff ff       	call   cb84 <_unexec>
    de26:	89 2c 24             	mov    %ebp,(%esp)
    de29:	e8 ae f5 ff ff       	call   d3dc <_pop_cache>
    de2e:	89 2c 24             	mov    %ebp,(%esp)
    de31:	e8 84 f3 ff ff       	call   d1ba <_read_cache>
    de36:	e9 3c 01 00 00       	jmp    df77 <_int31api_exec+0x230>
    de3b:	83 fa 1b             	cmp    $0x1b,%edx
    de3e:	75 44                	jne    de84 <_int31api_exec+0x13d>
    de40:	eb 17                	jmp    de59 <_int31api_exec+0x112>
    de42:	89 1c 24             	mov    %ebx,(%esp)
    de45:	e8 bc ea ff ff       	call   c906 <_find_task>
    de4a:	89 74 24 04          	mov    %esi,0x4(%esp)
    de4e:	8b 40 28             	mov    0x28(%eax),%eax
    de51:	89 04 24             	mov    %eax,(%esp)
    de54:	e8 c9 f4 ff ff       	call   d322 <_write_cache_wait>
    de59:	89 2c 24             	mov    %ebp,(%esp)
    de5c:	e8 95 f4 ff ff       	call   d2f6 <_read_cache_wait>
    de61:	89 c6                	mov    %eax,%esi
    de63:	a9 ff fe ff ff       	test   $0xfffffeff,%eax
    de68:	75 d8                	jne    de42 <_int31api_exec+0xfb>
    de6a:	e8 15 ed ff ff       	call   cb84 <_unexec>
    de6f:	89 2c 24             	mov    %ebp,(%esp)
    de72:	e8 65 f5 ff ff       	call   d3dc <_pop_cache>
    de77:	89 2c 24             	mov    %ebp,(%esp)
    de7a:	e8 3b f3 ff ff       	call   d1ba <_read_cache>
    de7f:	e9 f3 00 00 00       	jmp    df77 <_int31api_exec+0x230>
    de84:	83 fa 1c             	cmp    $0x1c,%edx
    de87:	75 3b                	jne    dec4 <_int31api_exec+0x17d>
    de89:	89 2c 24             	mov    %ebp,(%esp)
    de8c:	e8 13 f3 ff ff       	call   d1a4 <_fifo_size>
    de91:	85 c0                	test   %eax,%eax
    de93:	7e 28                	jle    debd <_int31api_exec+0x176>
    de95:	89 2c 24             	mov    %ebp,(%esp)
    de98:	e8 1d f3 ff ff       	call   d1ba <_read_cache>
    de9d:	89 c6                	mov    %eax,%esi
    de9f:	3d 00 01 00 00       	cmp    $0x100,%eax
    dea4:	74 17                	je     debd <_int31api_exec+0x176>
    dea6:	89 1c 24             	mov    %ebx,(%esp)
    dea9:	e8 58 ea ff ff       	call   c906 <_find_task>
    deae:	89 74 24 04          	mov    %esi,0x4(%esp)
    deb2:	8b 40 28             	mov    0x28(%eax),%eax
    deb5:	89 04 24             	mov    %eax,(%esp)
    deb8:	e8 65 f4 ff ff       	call   d322 <_write_cache_wait>
    debd:	e8 d8 0d 00 00       	call   ec9a <_hlt>
    dec2:	eb c5                	jmp    de89 <_int31api_exec+0x142>
    dec4:	83 fa 1d             	cmp    $0x1d,%edx
    dec7:	75 0d                	jne    ded6 <_int31api_exec+0x18f>
    dec9:	89 1c 24             	mov    %ebx,(%esp)
    decc:	e8 35 ea ff ff       	call   c906 <_find_task>
    ded1:	e9 a1 00 00 00       	jmp    df77 <_int31api_exec+0x230>
    ded6:	83 fa 1e             	cmp    $0x1e,%edx
    ded9:	75 0d                	jne    dee8 <_int31api_exec+0x1a1>
    dedb:	89 1c 24             	mov    %ebx,(%esp)
    dede:	e8 23 ea ff ff       	call   c906 <_find_task>
    dee3:	e9 8f 00 00 00       	jmp    df77 <_int31api_exec+0x230>
    dee8:	83 fa 1f             	cmp    $0x1f,%edx
    deeb:	75 0a                	jne    def7 <_int31api_exec+0x1b0>
    deed:	e8 05 ea ff ff       	call   c8f7 <_task_now>
    def2:	e9 80 00 00 00       	jmp    df77 <_int31api_exec+0x230>
    def7:	b8 00 00 00 00       	mov    $0x0,%eax
    defc:	83 fa 18             	cmp    $0x18,%edx
    deff:	75 76                	jne    df77 <_int31api_exec+0x230>
    df01:	03 b4 24 88 00 00 00 	add    0x88(%esp),%esi
    df08:	80 3e 2f             	cmpb   $0x2f,(%esi)
    df0b:	75 15                	jne    df22 <_int31api_exec+0x1db>
    df0d:	83 c6 01             	add    $0x1,%esi
    df10:	89 74 24 04          	mov    %esi,0x4(%esp)
    df14:	8d 44 24 20          	lea    0x20(%esp),%eax
    df18:	89 04 24             	mov    %eax,(%esp)
    df1b:	e8 76 e5 ff ff       	call   c496 <_strcpy>
    df20:	eb 1f                	jmp    df41 <_int31api_exec+0x1fa>
    df22:	8b 47 34             	mov    0x34(%edi),%eax
    df25:	89 44 24 04          	mov    %eax,0x4(%esp)
    df29:	8d 6c 24 20          	lea    0x20(%esp),%ebp
    df2d:	89 2c 24             	mov    %ebp,(%esp)
    df30:	e8 61 e5 ff ff       	call   c496 <_strcpy>
    df35:	89 74 24 04          	mov    %esi,0x4(%esp)
    df39:	89 2c 24             	mov    %ebp,(%esp)
    df3c:	e8 78 e5 ff ff       	call   c4b9 <_strcat>
    df41:	8b 47 34             	mov    0x34(%edi),%eax
    df44:	89 44 24 14          	mov    %eax,0x14(%esp)
    df48:	c7 44 24 10 04 00 00 	movl   $0x4,0x10(%esp)
    df4f:	00 
    df50:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%esp)
    df57:	00 
    df58:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    df5f:	00 
    df60:	03 9c 24 88 00 00 00 	add    0x88(%esp),%ebx
    df67:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    df6b:	8d 44 24 20          	lea    0x20(%esp),%eax
    df6f:	89 04 24             	mov    %eax,(%esp)
    df72:	e8 06 eb ff ff       	call   ca7d <_exec>
    df77:	83 c4 6c             	add    $0x6c,%esp
    df7a:	5b                   	pop    %ebx
    df7b:	5e                   	pop    %esi
    df7c:	5f                   	pop    %edi
    df7d:	5d                   	pop    %ebp
    df7e:	c3                   	ret    

0000df7f <_int31api_adv_io>:
    df7f:	83 ec 1c             	sub    $0x1c,%esp
    df82:	8b 44 24 20          	mov    0x20(%esp),%eax
    df86:	83 f8 0f             	cmp    $0xf,%eax
    df89:	75 23                	jne    dfae <_int31api_adv_io+0x2f>
    df8b:	c7 05 4c 40 00 00 00 	movl   $0x0,0x404c
    df92:	00 00 00 
    df95:	c7 05 48 40 00 00 00 	movl   $0x0,0x4048
    df9c:	00 00 00 
    df9f:	c7 05 44 40 00 00 00 	movl   $0x0,0x4044
    dfa6:	00 00 00 
    dfa9:	e9 9d 00 00 00       	jmp    e04b <_int31api_adv_io+0xcc>
    dfae:	83 f8 10             	cmp    $0x10,%eax
    dfb1:	75 0a                	jne    dfbd <_int31api_adv_io+0x3e>
    dfb3:	e8 69 d8 ff ff       	call   b821 <_cls_bg>
    dfb8:	e9 8e 00 00 00       	jmp    e04b <_int31api_adv_io+0xcc>
    dfbd:	83 f8 11             	cmp    $0x11,%eax
    dfc0:	75 25                	jne    dfe7 <_int31api_adv_io+0x68>
    dfc2:	e8 5a d8 ff ff       	call   b821 <_cls_bg>
    dfc7:	c7 05 4c 40 00 00 00 	movl   $0x0,0x404c
    dfce:	00 00 00 
    dfd1:	c7 05 48 40 00 00 00 	movl   $0x0,0x4048
    dfd8:	00 00 00 
    dfdb:	c7 05 44 40 00 00 00 	movl   $0x0,0x4044
    dfe2:	00 00 00 
    dfe5:	eb 64                	jmp    e04b <_int31api_adv_io+0xcc>
    dfe7:	83 f8 12             	cmp    $0x12,%eax
    dfea:	75 32                	jne    e01e <_int31api_adv_io+0x9f>
    dfec:	83 7c 24 24 ff       	cmpl   $0xffffffff,0x24(%esp)
    dff1:	74 09                	je     dffc <_int31api_adv_io+0x7d>
    dff3:	8b 44 24 24          	mov    0x24(%esp),%eax
    dff7:	a3 44 40 00 00       	mov    %eax,0x4044
    dffc:	83 7c 24 28 ff       	cmpl   $0xffffffff,0x28(%esp)
    e001:	74 09                	je     e00c <_int31api_adv_io+0x8d>
    e003:	8b 44 24 28          	mov    0x28(%esp),%eax
    e007:	a3 48 40 00 00       	mov    %eax,0x4048
    e00c:	83 7c 24 2c ff       	cmpl   $0xffffffff,0x2c(%esp)
    e011:	74 38                	je     e04b <_int31api_adv_io+0xcc>
    e013:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    e017:	a3 4c 40 00 00       	mov    %eax,0x404c
    e01c:	eb 2d                	jmp    e04b <_int31api_adv_io+0xcc>
    e01e:	83 f8 45             	cmp    $0x45,%eax
    e021:	75 0e                	jne    e031 <_int31api_adv_io+0xb2>
    e023:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
    e02a:	e8 b1 ee ff ff       	call   cee0 <_putch>
    e02f:	eb 1a                	jmp    e04b <_int31api_adv_io+0xcc>
    e031:	83 f8 46             	cmp    $0x46,%eax
    e034:	75 07                	jne    e03d <_int31api_adv_io+0xbe>
    e036:	a1 1c 40 00 00       	mov    0x401c,%eax
    e03b:	eb 0e                	jmp    e04b <_int31api_adv_io+0xcc>
    e03d:	83 f8 47             	cmp    $0x47,%eax
    e040:	75 09                	jne    e04b <_int31api_adv_io+0xcc>
    e042:	8b 44 24 24          	mov    0x24(%esp),%eax
    e046:	a3 1c 40 00 00       	mov    %eax,0x401c
    e04b:	83 c4 1c             	add    $0x1c,%esp
    e04e:	c3                   	ret    

0000e04f <_int31api>:
    e04f:	57                   	push   %edi
    e050:	56                   	push   %esi
    e051:	53                   	push   %ebx
    e052:	83 ec 20             	sub    $0x20,%esp
    e055:	8b 74 24 30          	mov    0x30(%esp),%esi
    e059:	8b 5c 24 34          	mov    0x34(%esp),%ebx
    e05d:	8b 7e 0c             	mov    0xc(%esi),%edi
    e060:	e8 92 e8 ff ff       	call   c8f7 <_task_now>
    e065:	8b 48 28             	mov    0x28(%eax),%ecx
    e068:	8b 56 28             	mov    0x28(%esi),%edx
    e06b:	8d 43 ed             	lea    -0x13(%ebx),%eax
    e06e:	83 f8 01             	cmp    $0x1,%eax
    e071:	76 05                	jbe    e078 <_int31api+0x29>
    e073:	83 fb 0e             	cmp    $0xe,%ebx
    e076:	77 2d                	ja     e0a5 <_int31api+0x56>
    e078:	8b 44 24 44          	mov    0x44(%esp),%eax
    e07c:	89 44 24 14          	mov    %eax,0x14(%esp)
    e080:	8b 44 24 40          	mov    0x40(%esp),%eax
    e084:	89 44 24 10          	mov    %eax,0x10(%esp)
    e088:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    e08c:	89 44 24 0c          	mov    %eax,0xc(%esp)
    e090:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    e094:	89 54 24 04          	mov    %edx,0x4(%esp)
    e098:	89 0c 24             	mov    %ecx,(%esp)
    e09b:	e8 73 f3 ff ff       	call   d413 <_int31api_basic_io>
    e0a0:	e9 19 02 00 00       	jmp    e2be <_int31api+0x26f>
    e0a5:	8d 43 eb             	lea    -0x15(%ebx),%eax
    e0a8:	83 f8 02             	cmp    $0x2,%eax
    e0ab:	77 42                	ja     e0ef <_int31api+0xa0>
    e0ad:	8b 44 24 48          	mov    0x48(%esp),%eax
    e0b1:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    e0b5:	8b 44 24 44          	mov    0x44(%esp),%eax
    e0b9:	89 44 24 18          	mov    %eax,0x18(%esp)
    e0bd:	8b 44 24 40          	mov    0x40(%esp),%eax
    e0c1:	89 44 24 14          	mov    %eax,0x14(%esp)
    e0c5:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    e0c9:	89 44 24 10          	mov    %eax,0x10(%esp)
    e0cd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    e0d1:	89 54 24 08          	mov    %edx,0x8(%esp)
    e0d5:	89 7c 24 04          	mov    %edi,0x4(%esp)
    e0d9:	83 e7 f8             	and    $0xfffffff8,%edi
    e0dc:	81 c7 00 a0 00 00    	add    $0xa000,%edi
    e0e2:	89 3c 24             	mov    %edi,(%esp)
    e0e5:	e8 fa f9 ff ff       	call   dae4 <_int31api_memory>
    e0ea:	e9 cf 01 00 00       	jmp    e2be <_int31api+0x26f>
    e0ef:	8d 43 c9             	lea    -0x37(%ebx),%eax
    e0f2:	83 f8 01             	cmp    $0x1,%eax
    e0f5:	76 12                	jbe    e109 <_int31api+0xba>
    e0f7:	83 fb 2c             	cmp    $0x2c,%ebx
    e0fa:	74 0d                	je     e109 <_int31api+0xba>
    e0fc:	83 fb 44             	cmp    $0x44,%ebx
    e0ff:	74 08                	je     e109 <_int31api+0xba>
    e101:	8d 43 c1             	lea    -0x3f(%ebx),%eax
    e104:	83 f8 02             	cmp    $0x2,%eax
    e107:	77 2d                	ja     e136 <_int31api+0xe7>
    e109:	8b 44 24 44          	mov    0x44(%esp),%eax
    e10d:	89 44 24 14          	mov    %eax,0x14(%esp)
    e111:	8b 44 24 40          	mov    0x40(%esp),%eax
    e115:	89 44 24 10          	mov    %eax,0x10(%esp)
    e119:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    e11d:	89 44 24 0c          	mov    %eax,0xc(%esp)
    e121:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    e125:	89 54 24 04          	mov    %edx,0x4(%esp)
    e129:	89 34 24             	mov    %esi,(%esp)
    e12c:	e8 94 f4 ff ff       	call   d5c5 <_int31api_file_io>
    e131:	e9 88 01 00 00       	jmp    e2be <_int31api+0x26f>
    e136:	8d 43 e0             	lea    -0x20(%ebx),%eax
    e139:	83 f8 05             	cmp    $0x5,%eax
    e13c:	76 10                	jbe    e14e <_int31api+0xff>
    e13e:	8d 43 d4             	lea    -0x2c(%ebx),%eax
    e141:	83 f8 0a             	cmp    $0xa,%eax
    e144:	76 08                	jbe    e14e <_int31api+0xff>
    e146:	8d 43 be             	lea    -0x42(%ebx),%eax
    e149:	83 f8 01             	cmp    $0x1,%eax
    e14c:	77 35                	ja     e183 <_int31api+0x134>
    e14e:	8b 44 24 48          	mov    0x48(%esp),%eax
    e152:	89 44 24 18          	mov    %eax,0x18(%esp)
    e156:	8b 44 24 44          	mov    0x44(%esp),%eax
    e15a:	89 44 24 14          	mov    %eax,0x14(%esp)
    e15e:	8b 44 24 40          	mov    0x40(%esp),%eax
    e162:	89 44 24 10          	mov    %eax,0x10(%esp)
    e166:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    e16a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    e16e:	89 5c 24 08          	mov    %ebx,0x8(%esp)
    e172:	89 54 24 04          	mov    %edx,0x4(%esp)
    e176:	89 0c 24             	mov    %ecx,(%esp)
    e179:	e8 f4 f6 ff ff       	call   d872 <_int31api_common_io>
    e17e:	e9 3b 01 00 00       	jmp    e2be <_int31api+0x26f>
    e183:	8d 43 e8             	lea    -0x18(%ebx),%eax
    e186:	83 f8 07             	cmp    $0x7,%eax
    e189:	76 05                	jbe    e190 <_int31api+0x141>
    e18b:	83 fb 3c             	cmp    $0x3c,%ebx
    e18e:	75 29                	jne    e1b9 <_int31api+0x16a>
    e190:	8b 44 24 40          	mov    0x40(%esp),%eax
    e194:	89 44 24 14          	mov    %eax,0x14(%esp)
    e198:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    e19c:	89 44 24 10          	mov    %eax,0x10(%esp)
    e1a0:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
    e1a4:	89 54 24 08          	mov    %edx,0x8(%esp)
    e1a8:	89 4c 24 04          	mov    %ecx,0x4(%esp)
    e1ac:	89 34 24             	mov    %esi,(%esp)
    e1af:	e8 93 fb ff ff       	call   dd47 <_int31api_exec>
    e1b4:	e9 05 01 00 00       	jmp    e2be <_int31api+0x26f>
    e1b9:	8d 43 bb             	lea    -0x45(%ebx),%eax
    e1bc:	83 f8 02             	cmp    $0x2,%eax
    e1bf:	76 08                	jbe    e1c9 <_int31api+0x17a>
    e1c1:	8d 43 f1             	lea    -0xf(%ebx),%eax
    e1c4:	83 f8 03             	cmp    $0x3,%eax
    e1c7:	77 25                	ja     e1ee <_int31api+0x19f>
    e1c9:	8b 44 24 48          	mov    0x48(%esp),%eax
    e1cd:	89 44 24 0c          	mov    %eax,0xc(%esp)
    e1d1:	8b 44 24 44          	mov    0x44(%esp),%eax
    e1d5:	89 44 24 08          	mov    %eax,0x8(%esp)
    e1d9:	8b 44 24 40          	mov    0x40(%esp),%eax
    e1dd:	89 44 24 04          	mov    %eax,0x4(%esp)
    e1e1:	89 1c 24             	mov    %ebx,(%esp)
    e1e4:	e8 96 fd ff ff       	call   df7f <_int31api_adv_io>
    e1e9:	e9 d0 00 00 00       	jmp    e2be <_int31api+0x26f>
    e1ee:	83 fb 39             	cmp    $0x39,%ebx
    e1f1:	75 1d                	jne    e210 <_int31api+0x1c1>
    e1f3:	03 54 24 44          	add    0x44(%esp),%edx
    e1f7:	89 54 24 04          	mov    %edx,0x4(%esp)
    e1fb:	8b 46 34             	mov    0x34(%esi),%eax
    e1fe:	89 04 24             	mov    %eax,(%esp)
    e201:	e8 90 e2 ff ff       	call   c496 <_strcpy>
    e206:	b8 00 00 00 00       	mov    $0x0,%eax
    e20b:	e9 ae 00 00 00       	jmp    e2be <_int31api+0x26f>
    e210:	83 fb 3a             	cmp    $0x3a,%ebx
    e213:	75 1d                	jne    e232 <_int31api+0x1e3>
    e215:	03 54 24 44          	add    0x44(%esp),%edx
    e219:	89 54 24 04          	mov    %edx,0x4(%esp)
    e21d:	8b 46 34             	mov    0x34(%esi),%eax
    e220:	89 04 24             	mov    %eax,(%esp)
    e223:	e8 91 e2 ff ff       	call   c4b9 <_strcat>
    e228:	b8 00 00 00 00       	mov    $0x0,%eax
    e22d:	e9 8c 00 00 00       	jmp    e2be <_int31api+0x26f>
    e232:	83 fb 3b             	cmp    $0x3b,%ebx
    e235:	75 3d                	jne    e274 <_int31api+0x225>
    e237:	8b 4e 34             	mov    0x34(%esi),%ecx
    e23a:	0f b6 11             	movzbl (%ecx),%edx
    e23d:	84 d2                	test   %dl,%dl
    e23f:	74 22                	je     e263 <_int31api+0x214>
    e241:	be 00 00 00 00       	mov    $0x0,%esi
    e246:	b3 00                	mov    $0x0,%bl
    e248:	b8 00 00 00 00       	mov    $0x0,%eax
    e24d:	80 fa 2f             	cmp    $0x2f,%dl
    e250:	75 04                	jne    e256 <_int31api+0x207>
    e252:	89 de                	mov    %ebx,%esi
    e254:	89 c3                	mov    %eax,%ebx
    e256:	83 c0 01             	add    $0x1,%eax
    e259:	0f b6 14 01          	movzbl (%ecx,%eax,1),%edx
    e25d:	84 d2                	test   %dl,%dl
    e25f:	75 ec                	jne    e24d <_int31api+0x1fe>
    e261:	eb 05                	jmp    e268 <_int31api+0x219>
    e263:	be 00 00 00 00       	mov    $0x0,%esi
    e268:	c6 44 31 01 00       	movb   $0x0,0x1(%ecx,%esi,1)
    e26d:	b8 00 00 00 00       	mov    $0x0,%eax
    e272:	eb 4a                	jmp    e2be <_int31api+0x26f>
    e274:	83 fb 3d             	cmp    $0x3d,%ebx
    e277:	75 36                	jne    e2af <_int31api+0x260>
    e279:	03 54 24 44          	add    0x44(%esp),%edx
    e27d:	89 54 24 04          	mov    %edx,0x4(%esp)
    e281:	8b 46 34             	mov    0x34(%esi),%eax
    e284:	89 04 24             	mov    %eax,(%esp)
    e287:	e8 2d e2 ff ff       	call   c4b9 <_strcat>
    e28c:	8b 56 34             	mov    0x34(%esi),%edx
    e28f:	89 d7                	mov    %edx,%edi
    e291:	b8 00 00 00 00       	mov    $0x0,%eax
    e296:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    e29b:	f2 ae                	repnz scas %es:(%edi),%al
    e29d:	89 c8                	mov    %ecx,%eax
    e29f:	f7 d0                	not    %eax
    e2a1:	66 c7 44 02 ff 2f 00 	movw   $0x2f,-0x1(%edx,%eax,1)
    e2a8:	b8 00 00 00 00       	mov    $0x0,%eax
    e2ad:	eb 0f                	jmp    e2be <_int31api+0x26f>
    e2af:	b8 00 00 00 00       	mov    $0x0,%eax
    e2b4:	83 fb 3e             	cmp    $0x3e,%ebx
    e2b7:	75 05                	jne    e2be <_int31api+0x26f>
    e2b9:	8b 46 34             	mov    0x34(%esi),%eax
    e2bc:	29 d0                	sub    %edx,%eax
    e2be:	83 c4 20             	add    $0x20,%esp
    e2c1:	5b                   	pop    %ebx
    e2c2:	5e                   	pop    %esi
    e2c3:	5f                   	pop    %edi
    e2c4:	c3                   	ret    

0000e2c5 <_apideliv>:
    e2c5:	83 ec 2c             	sub    $0x2c,%esp
    e2c8:	8b 44 24 30          	mov    0x30(%esp),%eax
    e2cc:	fb                   	sti    
    e2cd:	83 f8 30             	cmp    $0x30,%eax
    e2d0:	75 07                	jne    e2d9 <_apideliv+0x14>
    e2d2:	e8 29 f1 ff ff       	call   d400 <_int30api>
    e2d7:	eb 43                	jmp    e31c <_apideliv+0x57>
    e2d9:	83 f8 31             	cmp    $0x31,%eax
    e2dc:	75 3e                	jne    e31c <_apideliv+0x57>
    e2de:	8b 44 24 34          	mov    0x34(%esp),%eax
    e2e2:	89 44 24 18          	mov    %eax,0x18(%esp)
    e2e6:	8b 44 24 38          	mov    0x38(%esp),%eax
    e2ea:	89 44 24 14          	mov    %eax,0x14(%esp)
    e2ee:	8b 44 24 48          	mov    0x48(%esp),%eax
    e2f2:	89 44 24 10          	mov    %eax,0x10(%esp)
    e2f6:	8b 44 24 4c          	mov    0x4c(%esp),%eax
    e2fa:	89 44 24 0c          	mov    %eax,0xc(%esp)
    e2fe:	8b 44 24 44          	mov    0x44(%esp),%eax
    e302:	89 44 24 08          	mov    %eax,0x8(%esp)
    e306:	8b 44 24 50          	mov    0x50(%esp),%eax
    e30a:	89 44 24 04          	mov    %eax,0x4(%esp)
    e30e:	8b 44 24 44          	mov    0x44(%esp),%eax
    e312:	89 04 24             	mov    %eax,(%esp)
    e315:	e8 35 fd ff ff       	call   e04f <_int31api>
    e31a:	eb 00                	jmp    e31c <_apideliv+0x57>
    e31c:	83 c4 2c             	add    $0x2c,%esp
    e31f:	c3                   	ret    

0000e320 <_init_fs>:
    e320:	53                   	push   %ebx
    e321:	83 ec 18             	sub    $0x18,%esp
    e324:	c7 04 24 60 00 00 00 	movl   $0x60,(%esp)
    e32b:	e8 62 e0 ff ff       	call   c392 <_sbh_alloc>
    e330:	89 c3                	mov    %eax,%ebx
    e332:	66 c7 40 01 2e 00    	movw   $0x2e,0x1(%eax)
    e338:	c7 40 18 03 00 00 00 	movl   $0x3,0x18(%eax)
    e33f:	c6 00 08             	movb   $0x8,(%eax)
    e342:	89 43 1c             	mov    %eax,0x1c(%ebx)
    e345:	c7 40 21 72 6f 66 73 	movl   $0x73666f72,0x21(%eax)
    e34c:	c6 40 25 00          	movb   $0x0,0x25(%eax)
    e350:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
    e357:	c6 40 20 08          	movb   $0x8,0x20(%eax)
    e35b:	c7 40 3c 00 20 01 00 	movl   $0x12000,0x3c(%eax)
    e362:	c7 40 41 72 74 66 73 	movl   $0x73667472,0x41(%eax)
    e369:	c6 40 45 00          	movb   $0x0,0x45(%eax)
    e36d:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
    e374:	c6 40 40 08          	movb   $0x8,0x40(%eax)
    e378:	c7 04 24 00 02 00 00 	movl   $0x200,(%esp)
    e37f:	e8 0e e0 ff ff       	call   c392 <_sbh_alloc>
    e384:	89 43 5c             	mov    %eax,0x5c(%ebx)
    e387:	66 c7 40 01 2e 00    	movw   $0x2e,0x1(%eax)
    e38d:	c7 40 18 02 00 00 00 	movl   $0x2,0x18(%eax)
    e394:	c6 00 08             	movb   $0x8,(%eax)
    e397:	89 40 1c             	mov    %eax,0x1c(%eax)
    e39a:	66 c7 40 21 2e 2e    	movw   $0x2e2e,0x21(%eax)
    e3a0:	c6 40 23 00          	movb   $0x0,0x23(%eax)
    e3a4:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
    e3ab:	c6 40 20 08          	movb   $0x8,0x20(%eax)
    e3af:	89 58 3c             	mov    %ebx,0x3c(%eax)
    e3b2:	c7 05 58 40 00 00 03 	movl   $0x3,0x4058
    e3b9:	00 00 00 
    e3bc:	89 1d 5c 40 00 00    	mov    %ebx,0x405c
    e3c2:	83 c4 18             	add    $0x18,%esp
    e3c5:	5b                   	pop    %ebx
    e3c6:	c3                   	ret    

0000e3c7 <_fnew>:
    e3c7:	53                   	push   %ebx
    e3c8:	83 ec 18             	sub    $0x18,%esp
    e3cb:	8b 44 24 20          	mov    0x20(%esp),%eax
    e3cf:	8b 58 18             	mov    0x18(%eax),%ebx
    e3d2:	8d 53 01             	lea    0x1(%ebx),%edx
    e3d5:	89 50 18             	mov    %edx,0x18(%eax)
    e3d8:	c1 e3 05             	shl    $0x5,%ebx
    e3db:	01 c3                	add    %eax,%ebx
    e3dd:	8b 44 24 28          	mov    0x28(%esp),%eax
    e3e1:	88 03                	mov    %al,(%ebx)
    e3e3:	8b 44 24 2c          	mov    0x2c(%esp),%eax
    e3e7:	89 43 18             	mov    %eax,0x18(%ebx)
    e3ea:	8b 44 24 30          	mov    0x30(%esp),%eax
    e3ee:	89 43 1c             	mov    %eax,0x1c(%ebx)
    e3f1:	8b 44 24 24          	mov    0x24(%esp),%eax
    e3f5:	89 44 24 04          	mov    %eax,0x4(%esp)
    e3f9:	8d 43 01             	lea    0x1(%ebx),%eax
    e3fc:	89 04 24             	mov    %eax,(%esp)
    e3ff:	e8 92 e0 ff ff       	call   c496 <_strcpy>
    e404:	89 d8                	mov    %ebx,%eax
    e406:	83 c4 18             	add    $0x18,%esp
    e409:	5b                   	pop    %ebx
    e40a:	c3                   	ret    

0000e40b <_ffind>:
    e40b:	55                   	push   %ebp
    e40c:	57                   	push   %edi
    e40d:	56                   	push   %esi
    e40e:	53                   	push   %ebx
    e40f:	83 ec 2c             	sub    $0x2c,%esp
    e412:	8b 5c 24 40          	mov    0x40(%esp),%ebx
    e416:	8b 6c 24 44          	mov    0x44(%esp),%ebp
    e41a:	8b 7b 18             	mov    0x18(%ebx),%edi
    e41d:	85 ff                	test   %edi,%edi
    e41f:	7e 2d                	jle    e44e <_ffind+0x43>
    e421:	be 00 00 00 00       	mov    $0x0,%esi
    e426:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
    e42a:	89 6c 24 04          	mov    %ebp,0x4(%esp)
    e42e:	8d 43 01             	lea    0x1(%ebx),%eax
    e431:	89 04 24             	mov    %eax,(%esp)
    e434:	e8 5b e2 ff ff       	call   c694 <_strcmp>
    e439:	85 c0                	test   %eax,%eax
    e43b:	74 18                	je     e455 <_ffind+0x4a>
    e43d:	83 c6 01             	add    $0x1,%esi
    e440:	83 c3 20             	add    $0x20,%ebx
    e443:	39 fe                	cmp    %edi,%esi
    e445:	75 df                	jne    e426 <_ffind+0x1b>
    e447:	b8 00 00 00 00       	mov    $0x0,%eax
    e44c:	eb 0b                	jmp    e459 <_ffind+0x4e>
    e44e:	b8 00 00 00 00       	mov    $0x0,%eax
    e453:	eb 04                	jmp    e459 <_ffind+0x4e>
    e455:	8b 44 24 1c          	mov    0x1c(%esp),%eax
    e459:	83 c4 2c             	add    $0x2c,%esp
    e45c:	5b                   	pop    %ebx
    e45d:	5e                   	pop    %esi
    e45e:	5f                   	pop    %edi
    e45f:	5d                   	pop    %ebp
    e460:	c3                   	ret    

0000e461 <_fcreate>:
    e461:	55                   	push   %ebp
    e462:	57                   	push   %edi
    e463:	56                   	push   %esi
    e464:	53                   	push   %ebx
    e465:	83 ec 2c             	sub    $0x2c,%esp
    e468:	8b 74 24 40          	mov    0x40(%esp),%esi
    e46c:	8b 6c 24 48          	mov    0x48(%esp),%ebp
    e470:	89 34 24             	mov    %esi,(%esp)
    e473:	e8 b2 ea ff ff       	call   cf2a <_puts>
    e478:	8b 3d 5c 40 00 00    	mov    0x405c,%edi
    e47e:	0f b6 06             	movzbl (%esi),%eax
    e481:	84 c0                	test   %al,%al
    e483:	74 3d                	je     e4c2 <_fcreate+0x61>
    e485:	bb 01 00 00 00       	mov    $0x1,%ebx
    e48a:	ba 00 00 00 00       	mov    $0x0,%edx
    e48f:	3c 2f                	cmp    $0x2f,%al
    e491:	75 21                	jne    e4b4 <_fcreate+0x53>
    e493:	c6 44 1e ff 00       	movb   $0x0,-0x1(%esi,%ebx,1)
    e498:	01 f2                	add    %esi,%edx
    e49a:	89 54 24 04          	mov    %edx,0x4(%esp)
    e49e:	89 3c 24             	mov    %edi,(%esp)
    e4a1:	e8 65 ff ff ff       	call   e40b <_ffind>
    e4a6:	85 c0                	test   %eax,%eax
    e4a8:	74 5f                	je     e509 <_fcreate+0xa8>
    e4aa:	c6 44 1e ff 2f       	movb   $0x2f,-0x1(%esi,%ebx,1)
    e4af:	8b 78 1c             	mov    0x1c(%eax),%edi
    e4b2:	89 da                	mov    %ebx,%edx
    e4b4:	83 c3 01             	add    $0x1,%ebx
    e4b7:	0f b6 44 1e ff       	movzbl -0x1(%esi,%ebx,1),%eax
    e4bc:	84 c0                	test   %al,%al
    e4be:	75 cf                	jne    e48f <_fcreate+0x2e>
    e4c0:	eb 05                	jmp    e4c7 <_fcreate+0x66>
    e4c2:	ba 00 00 00 00       	mov    $0x0,%edx
    e4c7:	01 d6                	add    %edx,%esi
    e4c9:	89 34 24             	mov    %esi,(%esp)
    e4cc:	e8 59 ea ff ff       	call   cf2a <_puts>
    e4d1:	89 2c 24             	mov    %ebp,(%esp)
    e4d4:	e8 b9 de ff ff       	call   c392 <_sbh_alloc>
    e4d9:	89 c3                	mov    %eax,%ebx
    e4db:	89 44 24 04          	mov    %eax,0x4(%esp)
    e4df:	c7 04 24 78 f5 00 00 	movl   $0xf578,(%esp)
    e4e6:	e8 45 eb ff ff       	call   d030 <_printf>
    e4eb:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    e4ef:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
    e4f3:	8b 44 24 44          	mov    0x44(%esp),%eax
    e4f7:	89 44 24 08          	mov    %eax,0x8(%esp)
    e4fb:	89 74 24 04          	mov    %esi,0x4(%esp)
    e4ff:	89 3c 24             	mov    %edi,(%esp)
    e502:	e8 c0 fe ff ff       	call   e3c7 <_fnew>
    e507:	eb 05                	jmp    e50e <_fcreate+0xad>
    e509:	b8 00 00 00 00       	mov    $0x0,%eax
    e50e:	83 c4 2c             	add    $0x2c,%esp
    e511:	5b                   	pop    %ebx
    e512:	5e                   	pop    %esi
    e513:	5f                   	pop    %edi
    e514:	5d                   	pop    %ebp
    e515:	c3                   	ret    

0000e516 <_fopen>:
    e516:	56                   	push   %esi
    e517:	53                   	push   %ebx
    e518:	83 ec 14             	sub    $0x14,%esp
    e51b:	8b 74 24 20          	mov    0x20(%esp),%esi
    e51f:	8b 0d 5c 40 00 00    	mov    0x405c,%ecx
    e525:	0f b6 06             	movzbl (%esi),%eax
    e528:	84 c0                	test   %al,%al
    e52a:	74 3d                	je     e569 <_fopen+0x53>
    e52c:	bb 01 00 00 00       	mov    $0x1,%ebx
    e531:	ba 00 00 00 00       	mov    $0x0,%edx
    e536:	3c 2f                	cmp    $0x2f,%al
    e538:	75 21                	jne    e55b <_fopen+0x45>
    e53a:	c6 44 1e ff 00       	movb   $0x0,-0x1(%esi,%ebx,1)
    e53f:	01 f2                	add    %esi,%edx
    e541:	89 54 24 04          	mov    %edx,0x4(%esp)
    e545:	89 0c 24             	mov    %ecx,(%esp)
    e548:	e8 be fe ff ff       	call   e40b <_ffind>
    e54d:	85 c0                	test   %eax,%eax
    e54f:	74 30                	je     e581 <_fopen+0x6b>
    e551:	c6 44 1e ff 2f       	movb   $0x2f,-0x1(%esi,%ebx,1)
    e556:	8b 48 1c             	mov    0x1c(%eax),%ecx
    e559:	89 da                	mov    %ebx,%edx
    e55b:	83 c3 01             	add    $0x1,%ebx
    e55e:	0f b6 44 1e ff       	movzbl -0x1(%esi,%ebx,1),%eax
    e563:	84 c0                	test   %al,%al
    e565:	75 cf                	jne    e536 <_fopen+0x20>
    e567:	eb 05                	jmp    e56e <_fopen+0x58>
    e569:	ba 00 00 00 00       	mov    $0x0,%edx
    e56e:	01 d6                	add    %edx,%esi
    e570:	89 74 24 04          	mov    %esi,0x4(%esp)
    e574:	89 0c 24             	mov    %ecx,(%esp)
    e577:	e8 8f fe ff ff       	call   e40b <_ffind>
    e57c:	80 08 20             	orb    $0x20,(%eax)
    e57f:	eb 05                	jmp    e586 <_fopen+0x70>
    e581:	b8 00 00 00 00       	mov    $0x0,%eax
    e586:	83 c4 14             	add    $0x14,%esp
    e589:	5b                   	pop    %ebx
    e58a:	5e                   	pop    %esi
    e58b:	c3                   	ret    

0000e58c <_filepos>:
    e58c:	8b 44 24 04          	mov    0x4(%esp),%eax
    e590:	8b 40 1c             	mov    0x1c(%eax),%eax
    e593:	c3                   	ret    

0000e594 <_fclose>:
    e594:	8b 44 24 04          	mov    0x4(%esp),%eax
    e598:	80 20 df             	andb   $0xdf,(%eax)
    e59b:	c3                   	ret    

0000e59c <_set_gatedesc>:
    e59c:	8b 4c 24 04          	mov    0x4(%esp),%ecx
    e5a0:	8b 54 24 08          	mov    0x8(%esp),%edx
    e5a4:	8d 04 cd 00 a8 00 00 	lea    0xa800(,%ecx,8),%eax
    e5ab:	66 89 14 cd 00 a8 00 	mov    %dx,0xa800(,%ecx,8)
    e5b2:	00 
    e5b3:	c1 fa 10             	sar    $0x10,%edx
    e5b6:	66 89 50 06          	mov    %dx,0x6(%eax)
    e5ba:	8b 54 24 0c          	mov    0xc(%esp),%edx
    e5be:	66 89 50 02          	mov    %dx,0x2(%eax)
    e5c2:	8b 54 24 10          	mov    0x10(%esp),%edx
    e5c6:	88 50 04             	mov    %dl,0x4(%eax)
    e5c9:	8b 54 24 14          	mov    0x14(%esp),%edx
    e5cd:	88 50 05             	mov    %dl,0x5(%eax)
    e5d0:	c3                   	ret    

0000e5d1 <_int21>:
    e5d1:	83 ec 1c             	sub    $0x1c,%esp
    e5d4:	8b 44 24 20          	mov    0x20(%esp),%eax
    e5d8:	89 44 24 04          	mov    %eax,0x4(%esp)
    e5dc:	a1 64 40 00 00       	mov    0x4064,%eax
    e5e1:	89 04 24             	mov    %eax,(%esp)
    e5e4:	e8 13 ec ff ff       	call   d1fc <_write_cache>
    e5e9:	83 c4 1c             	add    $0x1c,%esp
    e5ec:	c3                   	ret    

0000e5ed <_int20>:
    e5ed:	a1 60 40 00 00       	mov    0x4060,%eax
    e5f2:	83 c0 01             	add    $0x1,%eax
    e5f5:	a3 60 40 00 00       	mov    %eax,0x4060
    e5fa:	a8 01                	test   $0x1,%al
    e5fc:	75 0b                	jne    e609 <_int20+0x1c>
    e5fe:	83 ec 0c             	sub    $0xc,%esp
    e601:	e8 0c e3 ff ff       	call   c912 <_schedule>
    e606:	83 c4 0c             	add    $0xc,%esp
    e609:	f3 c3                	repz ret 

0000e60b <_enable_pic>:
    e60b:	53                   	push   %ebx
    e60c:	83 ec 18             	sub    $0x18,%esp
    e60f:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    e613:	0f b6 c3             	movzbl %bl,%eax
    e616:	89 44 24 04          	mov    %eax,0x4(%esp)
    e61a:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
    e621:	e8 76 06 00 00       	call   ec9c <_out8>
    e626:	0f b6 df             	movzbl %bh,%ebx
    e629:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    e62d:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
    e634:	e8 63 06 00 00       	call   ec9c <_out8>
    e639:	83 c4 18             	add    $0x18,%esp
    e63c:	5b                   	pop    %ebx
    e63d:	c3                   	ret    

0000e63e <_init_pit>:
    e63e:	83 ec 1c             	sub    $0x1c,%esp
    e641:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
    e648:	00 
    e649:	c7 04 24 43 00 00 00 	movl   $0x43,(%esp)
    e650:	e8 47 06 00 00       	call   ec9c <_out8>
    e655:	c7 44 24 04 a9 00 00 	movl   $0xa9,0x4(%esp)
    e65c:	00 
    e65d:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
    e664:	e8 33 06 00 00       	call   ec9c <_out8>
    e669:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
    e670:	00 
    e671:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
    e678:	e8 1f 06 00 00       	call   ec9c <_out8>
    e67d:	83 c4 1c             	add    $0x1c,%esp
    e680:	c3                   	ret    

0000e681 <_global_page>:
    e681:	57                   	push   %edi
    e682:	56                   	push   %esi
    e683:	53                   	push   %ebx
    e684:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    e688:	e8 6a e2 ff ff       	call   c8f7 <_task_now>
    e68d:	89 de                	mov    %ebx,%esi
    e68f:	03 74 24 18          	add    0x18(%esp),%esi
    e693:	39 f3                	cmp    %esi,%ebx
    e695:	7d 2a                	jge    e6c1 <_global_page+0x40>
    e697:	8d 14 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edx
    e69e:	89 d9                	mov    %ebx,%ecx
    e6a0:	c1 e1 0c             	shl    $0xc,%ecx
    e6a3:	8b 7c 24 10          	mov    0x10(%esp),%edi
    e6a7:	8d 4c 0f 03          	lea    0x3(%edi,%ecx,1),%ecx
    e6ab:	c1 e6 02             	shl    $0x2,%esi
    e6ae:	8b 78 20             	mov    0x20(%eax),%edi
    e6b1:	89 0c 17             	mov    %ecx,(%edi,%edx,1)
    e6b4:	83 c2 04             	add    $0x4,%edx
    e6b7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
    e6bd:	39 f2                	cmp    %esi,%edx
    e6bf:	75 ed                	jne    e6ae <_global_page+0x2d>
    e6c1:	8b 40 14             	mov    0x14(%eax),%eax
    e6c4:	c1 e0 0a             	shl    $0xa,%eax
    e6c7:	01 d8                	add    %ebx,%eax
    e6c9:	c1 e0 0c             	shl    $0xc,%eax
    e6cc:	5b                   	pop    %ebx
    e6cd:	5e                   	pop    %esi
    e6ce:	5f                   	pop    %edi
    e6cf:	c3                   	ret    

0000e6d0 <_pop_page>:
    e6d0:	56                   	push   %esi
    e6d1:	53                   	push   %ebx
    e6d2:	83 ec 14             	sub    $0x14,%esp
    e6d5:	8b 5c 24 20          	mov    0x20(%esp),%ebx
    e6d9:	e8 19 e2 ff ff       	call   c8f7 <_task_now>
    e6de:	8b 50 20             	mov    0x20(%eax),%edx
    e6e1:	f6 02 01             	testb  $0x1,(%edx)
    e6e4:	74 10                	je     e6f6 <_pop_page+0x26>
    e6e6:	b8 00 00 00 00       	mov    $0x0,%eax
    e6eb:	83 c0 01             	add    $0x1,%eax
    e6ee:	f6 04 82 01          	testb  $0x1,(%edx,%eax,4)
    e6f2:	75 f7                	jne    e6eb <_pop_page+0x1b>
    e6f4:	eb 05                	jmp    e6fb <_pop_page+0x2b>
    e6f6:	b8 00 00 00 00       	mov    $0x0,%eax
    e6fb:	29 d8                	sub    %ebx,%eax
    e6fd:	8d 04 82             	lea    (%edx,%eax,4),%eax
    e700:	8b 30                	mov    (%eax),%esi
    e702:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    e708:	8d 14 9d 04 00 00 00 	lea    0x4(,%ebx,4),%edx
    e70f:	89 54 24 08          	mov    %edx,0x8(%esp)
    e713:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    e71a:	00 
    e71b:	89 04 24             	mov    %eax,(%esp)
    e71e:	e8 99 07 00 00       	call   eebc <_memset>
    e723:	89 f0                	mov    %esi,%eax
    e725:	83 c4 14             	add    $0x14,%esp
    e728:	5b                   	pop    %ebx
    e729:	5e                   	pop    %esi
    e72a:	c3                   	ret    

0000e72b <_push_page>:
    e72b:	57                   	push   %edi
    e72c:	56                   	push   %esi
    e72d:	53                   	push   %ebx
    e72e:	8b 74 24 10          	mov    0x10(%esp),%esi
    e732:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    e736:	e8 bc e1 ff ff       	call   c8f7 <_task_now>
    e73b:	8b 50 20             	mov    0x20(%eax),%edx
    e73e:	83 3a 00             	cmpl   $0x0,(%edx)
    e741:	74 10                	je     e753 <_push_page+0x28>
    e743:	b9 00 00 00 00       	mov    $0x0,%ecx
    e748:	83 c1 01             	add    $0x1,%ecx
    e74b:	83 3c 8a 00          	cmpl   $0x0,(%edx,%ecx,4)
    e74f:	75 f7                	jne    e748 <_push_page+0x1d>
    e751:	eb 05                	jmp    e758 <_push_page+0x2d>
    e753:	b9 00 00 00 00       	mov    $0x0,%ecx
    e758:	85 db                	test   %ebx,%ebx
    e75a:	74 24                	je     e780 <_push_page+0x55>
    e75c:	8d 3c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edi
    e763:	8d 56 03             	lea    0x3(%esi),%edx
    e766:	c1 e3 0c             	shl    $0xc,%ebx
    e769:	8d 74 1e 03          	lea    0x3(%esi,%ebx,1),%esi
    e76d:	8b 58 20             	mov    0x20(%eax),%ebx
    e770:	89 14 3b             	mov    %edx,(%ebx,%edi,1)
    e773:	83 c7 04             	add    $0x4,%edi
    e776:	81 c2 00 10 00 00    	add    $0x1000,%edx
    e77c:	39 f2                	cmp    %esi,%edx
    e77e:	75 ed                	jne    e76d <_push_page+0x42>
    e780:	8b 40 14             	mov    0x14(%eax),%eax
    e783:	c1 e0 0a             	shl    $0xa,%eax
    e786:	01 c8                	add    %ecx,%eax
    e788:	c1 e0 0c             	shl    $0xc,%eax
    e78b:	5b                   	pop    %ebx
    e78c:	5e                   	pop    %esi
    e78d:	5f                   	pop    %edi
    e78e:	c3                   	ret    

0000e78f <_push_task_page>:
    e78f:	57                   	push   %edi
    e790:	56                   	push   %esi
    e791:	53                   	push   %ebx
    e792:	8b 5c 24 10          	mov    0x10(%esp),%ebx
    e796:	8b 7c 24 14          	mov    0x14(%esp),%edi
    e79a:	8b 74 24 18          	mov    0x18(%esp),%esi
    e79e:	8b 43 20             	mov    0x20(%ebx),%eax
    e7a1:	83 38 00             	cmpl   $0x0,(%eax)
    e7a4:	74 10                	je     e7b6 <_push_task_page+0x27>
    e7a6:	b9 00 00 00 00       	mov    $0x0,%ecx
    e7ab:	83 c1 01             	add    $0x1,%ecx
    e7ae:	83 3c 88 00          	cmpl   $0x0,(%eax,%ecx,4)
    e7b2:	75 f7                	jne    e7ab <_push_task_page+0x1c>
    e7b4:	eb 05                	jmp    e7bb <_push_task_page+0x2c>
    e7b6:	b9 00 00 00 00       	mov    $0x0,%ecx
    e7bb:	85 f6                	test   %esi,%esi
    e7bd:	74 24                	je     e7e3 <_push_task_page+0x54>
    e7bf:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
    e7c6:	8d 57 03             	lea    0x3(%edi),%edx
    e7c9:	c1 e6 0c             	shl    $0xc,%esi
    e7cc:	8d 74 37 03          	lea    0x3(%edi,%esi,1),%esi
    e7d0:	8b 7b 20             	mov    0x20(%ebx),%edi
    e7d3:	89 14 07             	mov    %edx,(%edi,%eax,1)
    e7d6:	83 c0 04             	add    $0x4,%eax
    e7d9:	81 c2 00 10 00 00    	add    $0x1000,%edx
    e7df:	39 f2                	cmp    %esi,%edx
    e7e1:	75 ed                	jne    e7d0 <_push_task_page+0x41>
    e7e3:	8b 43 14             	mov    0x14(%ebx),%eax
    e7e6:	c1 e0 0a             	shl    $0xa,%eax
    e7e9:	01 c8                	add    %ecx,%eax
    e7eb:	c1 e0 0c             	shl    $0xc,%eax
    e7ee:	5b                   	pop    %ebx
    e7ef:	5e                   	pop    %esi
    e7f0:	5f                   	pop    %edi
    e7f1:	c3                   	ret    

0000e7f2 <_local_page>:
    e7f2:	57                   	push   %edi
    e7f3:	56                   	push   %esi
    e7f4:	53                   	push   %ebx
    e7f5:	8b 5c 24 18          	mov    0x18(%esp),%ebx
    e7f9:	8b 7c 24 20          	mov    0x20(%esp),%edi
    e7fd:	8b 74 24 24          	mov    0x24(%esp),%esi
    e801:	8b 44 24 14          	mov    0x14(%esp),%eax
    e805:	83 c0 03             	add    $0x3,%eax
    e808:	8b 54 24 10          	mov    0x10(%esp),%edx
    e80c:	89 04 ba             	mov    %eax,(%edx,%edi,4)
    e80f:	89 f0                	mov    %esi,%eax
    e811:	03 44 24 28          	add    0x28(%esp),%eax
    e815:	39 c6                	cmp    %eax,%esi
    e817:	7d 19                	jge    e832 <_local_page+0x40>
    e819:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
    e81d:	83 c1 03             	add    $0x3,%ecx
    e820:	89 f2                	mov    %esi,%edx
    e822:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
    e825:	83 c2 01             	add    $0x1,%edx
    e828:	81 c1 00 10 00 00    	add    $0x1000,%ecx
    e82e:	39 c2                	cmp    %eax,%edx
    e830:	75 f0                	jne    e822 <_local_page+0x30>
    e832:	c1 e7 0a             	shl    $0xa,%edi
    e835:	8d 04 37             	lea    (%edi,%esi,1),%eax
    e838:	c1 e0 0c             	shl    $0xc,%eax
    e83b:	5b                   	pop    %ebx
    e83c:	5e                   	pop    %esi
    e83d:	5f                   	pop    %edi
    e83e:	c3                   	ret    

0000e83f <_set_segmdesc>:
    e83f:	57                   	push   %edi
    e840:	56                   	push   %esi
    e841:	53                   	push   %ebx
    e842:	8b 74 24 10          	mov    0x10(%esp),%esi
    e846:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    e84a:	8b 44 24 18          	mov    0x18(%esp),%eax
    e84e:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
    e852:	3d ff 0f 00 00       	cmp    $0xfff,%eax
    e857:	76 09                	jbe    e862 <_set_segmdesc+0x23>
    e859:	81 cf 00 80 00 00    	or     $0x8000,%edi
    e85f:	c1 f8 0c             	sar    $0xc,%eax
    e862:	8d 1c f5 00 a0 00 00 	lea    0xa000(,%esi,8),%ebx
    e869:	66 89 04 f5 00 a0 00 	mov    %ax,0xa000(,%esi,8)
    e870:	00 
    e871:	66 89 4b 02          	mov    %cx,0x2(%ebx)
    e875:	89 ce                	mov    %ecx,%esi
    e877:	c1 fe 10             	sar    $0x10,%esi
    e87a:	89 f2                	mov    %esi,%edx
    e87c:	88 53 04             	mov    %dl,0x4(%ebx)
    e87f:	c1 f8 08             	sar    $0x8,%eax
    e882:	66 25 00 0f          	and    $0xf00,%ax
    e886:	89 fa                	mov    %edi,%edx
    e888:	80 e6 f0             	and    $0xf0,%dh
    e88b:	09 d0                	or     %edx,%eax
    e88d:	66 89 43 05          	mov    %ax,0x5(%ebx)
    e891:	c1 e9 18             	shr    $0x18,%ecx
    e894:	88 4b 07             	mov    %cl,0x7(%ebx)
    e897:	5b                   	pop    %ebx
    e898:	5e                   	pop    %esi
    e899:	5f                   	pop    %edi
    e89a:	c3                   	ret    

0000e89b <_init_idt>:
    e89b:	b8 00 ee 00 00       	mov    $0xee00,%eax
    e8a0:	66 a3 00 a8 00 00    	mov    %ax,0xa800
    e8a6:	c1 f8 10             	sar    $0x10,%eax
    e8a9:	66 a3 06 a8 00 00    	mov    %ax,0xa806
    e8af:	66 c7 05 02 a8 00 00 	movw   $0x10,0xa802
    e8b6:	10 00 
    e8b8:	c6 05 04 a8 00 00 00 	movb   $0x0,0xa804
    e8bf:	c6 05 05 a8 00 00 8e 	movb   $0x8e,0xa805
    e8c6:	b8 18 f0 00 00       	mov    $0xf018,%eax
    e8cb:	66 a3 08 a8 00 00    	mov    %ax,0xa808
    e8d1:	c1 f8 10             	sar    $0x10,%eax
    e8d4:	66 a3 0e a8 00 00    	mov    %ax,0xa80e
    e8da:	66 c7 05 0a a8 00 00 	movw   $0x10,0xa80a
    e8e1:	10 00 
    e8e3:	c6 05 0c a8 00 00 00 	movb   $0x0,0xa80c
    e8ea:	c6 05 0d a8 00 00 8e 	movb   $0x8e,0xa80d
    e8f1:	b8 2e f0 00 00       	mov    $0xf02e,%eax
    e8f6:	66 a3 18 a8 00 00    	mov    %ax,0xa818
    e8fc:	c1 f8 10             	sar    $0x10,%eax
    e8ff:	66 a3 1e a8 00 00    	mov    %ax,0xa81e
    e905:	66 c7 05 1a a8 00 00 	movw   $0x10,0xa81a
    e90c:	10 00 
    e90e:	c6 05 1c a8 00 00 00 	movb   $0x0,0xa81c
    e915:	c6 05 1d a8 00 00 8e 	movb   $0x8e,0xa81d
    e91c:	b8 44 f0 00 00       	mov    $0xf044,%eax
    e921:	66 a3 20 a8 00 00    	mov    %ax,0xa820
    e927:	c1 f8 10             	sar    $0x10,%eax
    e92a:	66 a3 26 a8 00 00    	mov    %ax,0xa826
    e930:	66 c7 05 22 a8 00 00 	movw   $0x10,0xa822
    e937:	10 00 
    e939:	c6 05 24 a8 00 00 00 	movb   $0x0,0xa824
    e940:	c6 05 25 a8 00 00 8e 	movb   $0x8e,0xa825
    e947:	b8 5a f0 00 00       	mov    $0xf05a,%eax
    e94c:	66 a3 28 a8 00 00    	mov    %ax,0xa828
    e952:	c1 f8 10             	sar    $0x10,%eax
    e955:	66 a3 2e a8 00 00    	mov    %ax,0xa82e
    e95b:	66 c7 05 2a a8 00 00 	movw   $0x10,0xa82a
    e962:	10 00 
    e964:	c6 05 2c a8 00 00 00 	movb   $0x0,0xa82c
    e96b:	c6 05 2d a8 00 00 8e 	movb   $0x8e,0xa82d
    e972:	b8 70 f0 00 00       	mov    $0xf070,%eax
    e977:	66 a3 30 a8 00 00    	mov    %ax,0xa830
    e97d:	c1 f8 10             	sar    $0x10,%eax
    e980:	66 a3 36 a8 00 00    	mov    %ax,0xa836
    e986:	66 c7 05 32 a8 00 00 	movw   $0x10,0xa832
    e98d:	10 00 
    e98f:	c6 05 34 a8 00 00 00 	movb   $0x0,0xa834
    e996:	c6 05 35 a8 00 00 8e 	movb   $0x8e,0xa835
    e99d:	b8 86 f0 00 00       	mov    $0xf086,%eax
    e9a2:	66 a3 38 a8 00 00    	mov    %ax,0xa838
    e9a8:	c1 f8 10             	sar    $0x10,%eax
    e9ab:	66 a3 3e a8 00 00    	mov    %ax,0xa83e
    e9b1:	66 c7 05 3a a8 00 00 	movw   $0x10,0xa83a
    e9b8:	10 00 
    e9ba:	c6 05 3c a8 00 00 00 	movb   $0x0,0xa83c
    e9c1:	c6 05 3d a8 00 00 8e 	movb   $0x8e,0xa83d
    e9c8:	b8 9c f0 00 00       	mov    $0xf09c,%eax
    e9cd:	66 a3 40 a8 00 00    	mov    %ax,0xa840
    e9d3:	c1 f8 10             	sar    $0x10,%eax
    e9d6:	66 a3 46 a8 00 00    	mov    %ax,0xa846
    e9dc:	66 c7 05 42 a8 00 00 	movw   $0x10,0xa842
    e9e3:	10 00 
    e9e5:	c6 05 44 a8 00 00 00 	movb   $0x0,0xa844
    e9ec:	c6 05 45 a8 00 00 8e 	movb   $0x8e,0xa845
    e9f3:	b8 db f0 00 00       	mov    $0xf0db,%eax
    e9f8:	66 a3 50 a8 00 00    	mov    %ax,0xa850
    e9fe:	c1 f8 10             	sar    $0x10,%eax
    ea01:	66 a3 56 a8 00 00    	mov    %ax,0xa856
    ea07:	66 c7 05 52 a8 00 00 	movw   $0x10,0xa852
    ea0e:	10 00 
    ea10:	c6 05 54 a8 00 00 00 	movb   $0x0,0xa854
    ea17:	c6 05 55 a8 00 00 8e 	movb   $0x8e,0xa855
    ea1e:	b8 72 ed 00 00       	mov    $0xed72,%eax
    ea23:	66 a3 58 a8 00 00    	mov    %ax,0xa858
    ea29:	c1 f8 10             	sar    $0x10,%eax
    ea2c:	66 a3 5e a8 00 00    	mov    %ax,0xa85e
    ea32:	66 c7 05 5a a8 00 00 	movw   $0x10,0xa85a
    ea39:	10 00 
    ea3b:	c6 05 5c a8 00 00 00 	movb   $0x0,0xa85c
    ea42:	c6 05 5d a8 00 00 8e 	movb   $0x8e,0xa85d
    ea49:	b8 b8 ed 00 00       	mov    $0xedb8,%eax
    ea4e:	66 a3 60 a8 00 00    	mov    %ax,0xa860
    ea54:	c1 f8 10             	sar    $0x10,%eax
    ea57:	66 a3 66 a8 00 00    	mov    %ax,0xa866
    ea5d:	66 c7 05 62 a8 00 00 	movw   $0x10,0xa862
    ea64:	10 00 
    ea66:	c6 05 64 a8 00 00 00 	movb   $0x0,0xa864
    ea6d:	c6 05 65 a8 00 00 8e 	movb   $0x8e,0xa865
    ea74:	b8 0e ed 00 00       	mov    $0xed0e,%eax
    ea79:	66 a3 68 a8 00 00    	mov    %ax,0xa868
    ea7f:	c1 f8 10             	sar    $0x10,%eax
    ea82:	66 a3 6e a8 00 00    	mov    %ax,0xa86e
    ea88:	66 c7 05 6a a8 00 00 	movw   $0x10,0xa86a
    ea8f:	10 00 
    ea91:	c6 05 6c a8 00 00 00 	movb   $0x0,0xa86c
    ea98:	c6 05 6d a8 00 00 8e 	movb   $0x8e,0xa86d
    ea9f:	b8 a6 ec 00 00       	mov    $0xeca6,%eax
    eaa4:	66 a3 70 a8 00 00    	mov    %ax,0xa870
    eaaa:	c1 f8 10             	sar    $0x10,%eax
    eaad:	66 a3 76 a8 00 00    	mov    %ax,0xa876
    eab3:	66 c7 05 72 a8 00 00 	movw   $0x10,0xa872
    eaba:	10 00 
    eabc:	c6 05 74 a8 00 00 00 	movb   $0x0,0xa874
    eac3:	c6 05 75 a8 00 00 8e 	movb   $0x8e,0xa875
    eaca:	b8 ef f0 00 00       	mov    $0xf0ef,%eax
    eacf:	66 a3 80 a8 00 00    	mov    %ax,0xa880
    ead5:	c1 f8 10             	sar    $0x10,%eax
    ead8:	66 a3 86 a8 00 00    	mov    %ax,0xa886
    eade:	66 c7 05 82 a8 00 00 	movw   $0x10,0xa882
    eae5:	10 00 
    eae7:	c6 05 84 a8 00 00 00 	movb   $0x0,0xa884
    eaee:	c6 05 85 a8 00 00 8e 	movb   $0x8e,0xa885
    eaf5:	b8 05 f1 00 00       	mov    $0xf105,%eax
    eafa:	66 a3 88 a8 00 00    	mov    %ax,0xa888
    eb00:	c1 f8 10             	sar    $0x10,%eax
    eb03:	66 a3 8e a8 00 00    	mov    %ax,0xa88e
    eb09:	66 c7 05 8a a8 00 00 	movw   $0x10,0xa88a
    eb10:	10 00 
    eb12:	c6 05 8c a8 00 00 00 	movb   $0x0,0xa88c
    eb19:	c6 05 8d a8 00 00 8e 	movb   $0x8e,0xa88d
    eb20:	b8 19 f1 00 00       	mov    $0xf119,%eax
    eb25:	66 a3 90 a8 00 00    	mov    %ax,0xa890
    eb2b:	c1 f8 10             	sar    $0x10,%eax
    eb2e:	66 a3 96 a8 00 00    	mov    %ax,0xa896
    eb34:	66 c7 05 92 a8 00 00 	movw   $0x10,0xa892
    eb3b:	10 00 
    eb3d:	c6 05 94 a8 00 00 00 	movb   $0x0,0xa894
    eb44:	c6 05 95 a8 00 00 8e 	movb   $0x8e,0xa895
    eb4b:	b8 2f f1 00 00       	mov    $0xf12f,%eax
    eb50:	66 a3 98 a8 00 00    	mov    %ax,0xa898
    eb56:	c1 f8 10             	sar    $0x10,%eax
    eb59:	66 a3 9e a8 00 00    	mov    %ax,0xa89e
    eb5f:	66 c7 05 9a a8 00 00 	movw   $0x10,0xa89a
    eb66:	10 00 
    eb68:	c6 05 9c a8 00 00 00 	movb   $0x0,0xa89c
    eb6f:	c6 05 9d a8 00 00 8e 	movb   $0x8e,0xa89d
    eb76:	b8 5f ee 00 00       	mov    $0xee5f,%eax
    eb7b:	66 a3 00 a9 00 00    	mov    %ax,0xa900
    eb81:	c1 f8 10             	sar    $0x10,%eax
    eb84:	66 a3 06 a9 00 00    	mov    %ax,0xa906
    eb8a:	66 c7 05 02 a9 00 00 	movw   $0x10,0xa902
    eb91:	10 00 
    eb93:	c6 05 04 a9 00 00 00 	movb   $0x0,0xa904
    eb9a:	c6 05 05 a9 00 00 8e 	movb   $0x8e,0xa905
    eba1:	b8 85 ec 00 00       	mov    $0xec85,%eax
    eba6:	66 a3 08 a9 00 00    	mov    %ax,0xa908
    ebac:	c1 f8 10             	sar    $0x10,%eax
    ebaf:	66 a3 0e a9 00 00    	mov    %ax,0xa90e
    ebb5:	66 c7 05 0a a9 00 00 	movw   $0x10,0xa90a
    ebbc:	10 00 
    ebbe:	c6 05 0c a9 00 00 00 	movb   $0x0,0xa90c
    ebc5:	c6 05 0d a9 00 00 8e 	movb   $0x8e,0xa90d
    ebcc:	b8 80 ef 00 00       	mov    $0xef80,%eax
    ebd1:	66 a3 80 a9 00 00    	mov    %ax,0xa980
    ebd7:	c1 f8 10             	sar    $0x10,%eax
    ebda:	66 a3 86 a9 00 00    	mov    %ax,0xa986
    ebe0:	66 c7 05 82 a9 00 00 	movw   $0x10,0xa982
    ebe7:	10 00 
    ebe9:	c6 05 84 a9 00 00 00 	movb   $0x0,0xa984
    ebf0:	c6 05 85 a9 00 00 8e 	movb   $0x8e,0xa985
    ebf7:	b8 9c ef 00 00       	mov    $0xef9c,%eax
    ebfc:	66 a3 88 a9 00 00    	mov    %ax,0xa988
    ec02:	c1 f8 10             	sar    $0x10,%eax
    ec05:	66 a3 8e a9 00 00    	mov    %ax,0xa98e
    ec0b:	66 c7 05 8a a9 00 00 	movw   $0x10,0xa98a
    ec12:	10 00 
    ec14:	c6 05 8c a9 00 00 00 	movb   $0x0,0xa98c
    ec1b:	c6 05 8d a9 00 00 8e 	movb   $0x8e,0xa98d
    ec22:	c3                   	ret    

0000ec23 <_init_gdt>:
    ec23:	83 ec 1c             	sub    $0x1c,%esp
    ec26:	c7 05 06 40 00 00 00 	movl   $0xa000,0x4006
    ec2d:	a0 00 00 
    ec30:	66 c7 05 04 40 00 00 	movw   $0x3ff,0x4004
    ec37:	ff 03 
    ec39:	0f 01 15 04 40 00 00 	lgdtl  0x4004
    ec40:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
    ec47:	e8 2d d4 ff ff       	call   c079 <_malloc_page>
    ec4c:	a3 0c 40 00 00       	mov    %eax,0x400c
    ec51:	c7 05 10 40 00 00 01 	movl   $0x1,0x4010
    ec58:	00 00 00 
    ec5b:	c7 05 14 40 00 00 80 	movl   $0x80,0x4014
    ec62:	00 00 00 
    ec65:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
    ec6b:	c7 40 04 7b 00 00 00 	movl   $0x7b,0x4(%eax)
    ec72:	83 c4 1c             	add    $0x1c,%esp
    ec75:	c3                   	ret    
    ec76:	90                   	nop
    ec77:	90                   	nop
	...
    ec80:	b0 20                	mov    $0x20,%al
    ec82:	e6 20                	out    %al,$0x20
    ec84:	c3                   	ret    

0000ec85 <_int21_asm>:
    ec85:	60                   	pusha  
    ec86:	31 c0                	xor    %eax,%eax
    ec88:	e4 60                	in     $0x60,%al
    ec8a:	50                   	push   %eax
    ec8b:	e8 41 f9 ff ff       	call   e5d1 <_int21>
    ec90:	e8 eb ff ff ff       	call   ec80 <_init_gdt+0x5d>
    ec95:	83 c4 04             	add    $0x4,%esp
    ec98:	61                   	popa   
    ec99:	cf                   	iret   

0000ec9a <_hlt>:
    ec9a:	f4                   	hlt    
    ec9b:	c3                   	ret    

0000ec9c <_out8>:
    ec9c:	8b 44 24 08          	mov    0x8(%esp),%eax
    eca0:	8b 54 24 04          	mov    0x4(%esp),%edx
    eca4:	ee                   	out    %al,(%dx)
    eca5:	c3                   	ret    

0000eca6 <_int0e_asm>:
    eca6:	60                   	pusha  
    eca7:	1e                   	push   %ds
    eca8:	06                   	push   %es
    eca9:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    ecad:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    ecb1:	8b 54 24 28          	mov    0x28(%esp),%edx
    ecb5:	66 8c d8             	mov    %ds,%ax
    ecb8:	be 01 00 00 00       	mov    $0x1,%esi
    ecbd:	66 83 f8 08          	cmp    $0x8,%ax
    ecc1:	74 15                	je     ecd8 <_int0e_asm+0x32>
    ecc3:	66 b8 08 00          	mov    $0x8,%ax
    ecc7:	8e d8                	mov    %eax,%ds
    ecc9:	8e c0                	mov    %eax,%es
    eccb:	8e d0                	mov    %eax,%ss
    eccd:	81 c4 00 00 40 00    	add    $0x400000,%esp
    ecd3:	be 00 00 00 00       	mov    $0x0,%esi
    ecd8:	56                   	push   %esi
    ecd9:	53                   	push   %ebx
    ecda:	51                   	push   %ecx
    ecdb:	52                   	push   %edx
    ecdc:	0f 20 d0             	mov    %cr2,%eax
    ecdf:	50                   	push   %eax
    ece0:	e8 03 05 00 00       	call   f1e8 <_int0d>
    ece5:	83 c4 10             	add    $0x10,%esp
    ece8:	58                   	pop    %eax
    ece9:	83 f8 01             	cmp    $0x1,%eax
    ecec:	74 1c                	je     ed0a <_int0e_asm+0x64>
    ecee:	81 ec 00 00 40 00    	sub    $0x400000,%esp
    ecf4:	8e 15 0c 10 00 00    	mov    0x100c,%ss
    ecfa:	8b 2d 2c 10 00 00    	mov    0x102c,%ebp
    ed00:	07                   	pop    %es
    ed01:	1f                   	pop    %ds
    ed02:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    ed06:	61                   	popa   
    ed07:	89 ec                	mov    %ebp,%esp
    ed09:	cb                   	lret   
    ed0a:	07                   	pop    %es
    ed0b:	1f                   	pop    %ds
    ed0c:	61                   	popa   
    ed0d:	cf                   	iret   

0000ed0e <_int0d_asm>:
    ed0e:	60                   	pusha  
    ed0f:	1e                   	push   %ds
    ed10:	06                   	push   %es
    ed11:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    ed15:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    ed19:	8b 54 24 28          	mov    0x28(%esp),%edx
    ed1d:	66 8c d8             	mov    %ds,%ax
    ed20:	be 01 00 00 00       	mov    $0x1,%esi
    ed25:	66 83 f8 08          	cmp    $0x8,%ax
    ed29:	74 15                	je     ed40 <_int0d_asm+0x32>
    ed2b:	66 b8 08 00          	mov    $0x8,%ax
    ed2f:	8e d8                	mov    %eax,%ds
    ed31:	8e c0                	mov    %eax,%es
    ed33:	8e d0                	mov    %eax,%ss
    ed35:	81 c4 00 00 40 00    	add    $0x400000,%esp
    ed3b:	be 00 00 00 00       	mov    $0x0,%esi
    ed40:	56                   	push   %esi
    ed41:	53                   	push   %ebx
    ed42:	51                   	push   %ecx
    ed43:	52                   	push   %edx
    ed44:	e8 9f 04 00 00       	call   f1e8 <_int0d>
    ed49:	83 c4 0c             	add    $0xc,%esp
    ed4c:	58                   	pop    %eax
    ed4d:	83 f8 01             	cmp    $0x1,%eax
    ed50:	74 1c                	je     ed6e <_int0d_asm+0x60>
    ed52:	81 ec 00 00 40 00    	sub    $0x400000,%esp
    ed58:	8e 15 0c 10 00 00    	mov    0x100c,%ss
    ed5e:	8b 2d 2c 10 00 00    	mov    0x102c,%ebp
    ed64:	07                   	pop    %es
    ed65:	1f                   	pop    %ds
    ed66:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    ed6a:	61                   	popa   
    ed6b:	89 ec                	mov    %ebp,%esp
    ed6d:	cb                   	lret   
    ed6e:	07                   	pop    %es
    ed6f:	1f                   	pop    %ds
    ed70:	61                   	popa   
    ed71:	cf                   	iret   

0000ed72 <_int0b_asm>:
    ed72:	60                   	pusha  
    ed73:	1e                   	push   %ds
    ed74:	06                   	push   %es
    ed75:	66 b8 08 00          	mov    $0x8,%ax
    ed79:	8e d8                	mov    %eax,%ds
    ed7b:	8e c0                	mov    %eax,%es
    ed7d:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    ed81:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    ed85:	8b 54 24 28          	mov    0x28(%esp),%edx
    ed89:	8e d0                	mov    %eax,%ss
    ed8b:	81 c4 00 00 40 00    	add    $0x400000,%esp
    ed91:	53                   	push   %ebx
    ed92:	51                   	push   %ecx
    ed93:	52                   	push   %edx
    ed94:	e8 d2 04 00 00       	call   f26b <_int0b>
    ed99:	83 c4 0c             	add    $0xc,%esp
    ed9c:	81 ec 00 00 40 00    	sub    $0x400000,%esp
    eda2:	8e 15 0c 10 00 00    	mov    0x100c,%ss
    eda8:	8b 2d 2c 10 00 00    	mov    0x102c,%ebp
    edae:	07                   	pop    %es
    edaf:	1f                   	pop    %ds
    edb0:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    edb4:	61                   	popa   
    edb5:	89 ec                	mov    %ebp,%esp
    edb7:	cb                   	lret   

0000edb8 <_int0c_asm>:
    edb8:	60                   	pusha  
    edb9:	1e                   	push   %ds
    edba:	06                   	push   %es
    edbb:	66 b8 08 00          	mov    $0x8,%ax
    edbf:	8e d8                	mov    %eax,%ds
    edc1:	8e c0                	mov    %eax,%es
    edc3:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    edc7:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    edcb:	8b 54 24 28          	mov    0x28(%esp),%edx
    edcf:	8e d0                	mov    %eax,%ss
    edd1:	81 c4 00 00 40 00    	add    $0x400000,%esp
    edd7:	16                   	push   %ss
    edd8:	54                   	push   %esp
    edd9:	53                   	push   %ebx
    edda:	51                   	push   %ecx
    eddb:	52                   	push   %edx
    eddc:	e8 3e 04 00 00       	call   f21f <_int0c>
    ede1:	83 c4 12             	add    $0x12,%esp
    ede4:	81 ec 00 00 40 00    	sub    $0x400000,%esp
    edea:	8e 15 0c 10 00 00    	mov    0x100c,%ss
    edf0:	8b 2d 2c 10 00 00    	mov    0x102c,%ebp
    edf6:	07                   	pop    %es
    edf7:	1f                   	pop    %ds
    edf8:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    edfc:	61                   	popa   
    edfd:	89 ec                	mov    %ebp,%esp
    edff:	cb                   	lret   

0000ee00 <_int00_asm>:
    ee00:	60                   	pusha  
    ee01:	1e                   	push   %ds
    ee02:	06                   	push   %es
    ee03:	66 b8 08 00          	mov    $0x8,%ax
    ee07:	8e d8                	mov    %eax,%ds
    ee09:	8e c0                	mov    %eax,%es
    ee0b:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
    ee0f:	8b 54 24 28          	mov    0x28(%esp),%edx
    ee13:	8e d0                	mov    %eax,%ss
    ee15:	81 c4 00 00 40 00    	add    $0x400000,%esp
    ee1b:	51                   	push   %ecx
    ee1c:	52                   	push   %edx
    ee1d:	e8 80 04 00 00       	call   f2a2 <_int00>
    ee22:	83 c4 08             	add    $0x8,%esp
    ee25:	81 ec 00 00 40 00    	sub    $0x400000,%esp
    ee2b:	8e 15 0c 10 00 00    	mov    0x100c,%ss
    ee31:	8b 2d 2c 10 00 00    	mov    0x102c,%ebp
    ee37:	07                   	pop    %es
    ee38:	1f                   	pop    %ds
    ee39:	89 6c 24 08          	mov    %ebp,0x8(%esp)
    ee3d:	61                   	popa   
    ee3e:	89 ec                	mov    %ebp,%esp
    ee40:	cb                   	lret   

0000ee41 <_cpuid>:
    ee41:	57                   	push   %edi
    ee42:	53                   	push   %ebx
    ee43:	51                   	push   %ecx
    ee44:	52                   	push   %edx
    ee45:	8b 44 24 14          	mov    0x14(%esp),%eax
    ee49:	0f a2                	cpuid  
    ee4b:	8b 7c 24 18          	mov    0x18(%esp),%edi
    ee4f:	89 07                	mov    %eax,(%edi)
    ee51:	89 5f 04             	mov    %ebx,0x4(%edi)
    ee54:	89 4f 08             	mov    %ecx,0x8(%edi)
    ee57:	89 57 0c             	mov    %edx,0xc(%edi)
    ee5a:	5a                   	pop    %edx
    ee5b:	59                   	pop    %ecx
    ee5c:	5b                   	pop    %ebx
    ee5d:	5f                   	pop    %edi
    ee5e:	c3                   	ret    

0000ee5f <_int20_asm>:
    ee5f:	60                   	pusha  
    ee60:	e8 1b fe ff ff       	call   ec80 <_init_gdt+0x5d>
    ee65:	e8 83 f7 ff ff       	call   e5ed <_int20>
    ee6a:	61                   	popa   
    ee6b:	cf                   	iret   

0000ee6c <_restart>:
    ee6c:	83 ec 0c             	sub    $0xc,%esp
    ee6f:	60                   	pusha  
    ee70:	8b 5c 24 30          	mov    0x30(%esp),%ebx
    ee74:	0f a8                	push   %gs
    ee76:	0f a0                	push   %fs
    ee78:	06                   	push   %es
    ee79:	1e                   	push   %ds
    ee7a:	9c                   	pushf  
    ee7b:	58                   	pop    %eax
    ee7c:	89 44 24 38          	mov    %eax,0x38(%esp)
    ee80:	66 8c c8             	mov    %cs,%ax
    ee83:	66 89 44 24 34       	mov    %ax,0x34(%esp)
    ee88:	c7 44 24 30 bb ee 00 	movl   $0xeebb,0x30(%esp)
    ee8f:	00 
    ee90:	66 b8 08 00          	mov    $0x8,%ax
    ee94:	8e d8                	mov    %eax,%ds
    ee96:	0f 20 d8             	mov    %cr3,%eax
    ee99:	89 43 08             	mov    %eax,0x8(%ebx)
    ee9c:	8c 53 04             	mov    %ss,0x4(%ebx)
    ee9f:	89 23                	mov    %esp,(%ebx)
    eea1:	83 c4 3c             	add    $0x3c,%esp
    eea4:	8b 5c 24 08          	mov    0x8(%esp),%ebx
    eea8:	8b 23                	mov    (%ebx),%esp
    eeaa:	8e 53 04             	mov    0x4(%ebx),%ss
    eead:	8b 43 08             	mov    0x8(%ebx),%eax
    eeb0:	0f 22 d8             	mov    %eax,%cr3
    eeb3:	1f                   	pop    %ds
    eeb4:	07                   	pop    %es
    eeb5:	0f a1                	pop    %fs
    eeb7:	0f a9                	pop    %gs
    eeb9:	61                   	popa   
    eeba:	cf                   	iret   
    eebb:	c3                   	ret    

0000eebc <_memset>:
    eebc:	57                   	push   %edi
    eebd:	51                   	push   %ecx
    eebe:	8b 7c 24 0c          	mov    0xc(%esp),%edi
    eec2:	8b 44 24 10          	mov    0x10(%esp),%eax
    eec6:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    eeca:	f3 aa                	rep stos %al,%es:(%edi)
    eecc:	59                   	pop    %ecx
    eecd:	5f                   	pop    %edi
    eece:	c3                   	ret    

0000eecf <_read_cr3>:
    eecf:	0f 20 d8             	mov    %cr3,%eax
    eed2:	c3                   	ret    

0000eed3 <_read_eflags>:
    eed3:	9c                   	pushf  
    eed4:	58                   	pop    %eax
    eed5:	c3                   	ret    

0000eed6 <_delay>:
    eed6:	51                   	push   %ecx
    eed7:	8b 4c 24 08          	mov    0x8(%esp),%ecx
    eedb:	c1 e1 13             	shl    $0x13,%ecx
    eede:	e2 fe                	loop   eede <_delay+0x8>
    eee0:	59                   	pop    %ecx
    eee1:	c3                   	ret    

0000eee2 <_farcall>:
    eee2:	ff 5c 24 04          	lcall  *0x4(%esp)
    eee6:	c3                   	ret    

0000eee7 <_app_startup_asm>:
    eee7:	60                   	pusha  
    eee8:	8b 5c 24 24          	mov    0x24(%esp),%ebx
    eeec:	8b 7c 24 28          	mov    0x28(%esp),%edi
    eef0:	89 63 10             	mov    %esp,0x10(%ebx)
    eef3:	8c 53 14             	mov    %ss,0x14(%ebx)
    eef6:	8b 63 08             	mov    0x8(%ebx),%esp
    eef9:	8e 53 0c             	mov    0xc(%ebx),%ss
    eefc:	8b 13                	mov    (%ebx),%edx
    eefe:	8b 4b 04             	mov    0x4(%ebx),%ecx
    ef01:	8c d0                	mov    %ss,%eax
    ef03:	89 c6                	mov    %eax,%esi
    ef05:	8e c0                	mov    %eax,%es
    ef07:	8e e0                	mov    %eax,%fs
    ef09:	8e e8                	mov    %eax,%gs
    ef0b:	89 e0                	mov    %esp,%eax
    ef0d:	83 e8 18             	sub    $0x18,%eax
    ef10:	89 43 2c             	mov    %eax,0x2c(%ebx)
    ef13:	8b 43 20             	mov    0x20(%ebx),%eax
    ef16:	0f 22 d8             	mov    %eax,%cr3
    ef19:	89 f0                	mov    %esi,%eax
    ef1b:	8e d8                	mov    %eax,%ds
    ef1d:	51                   	push   %ecx
    ef1e:	52                   	push   %edx
    ef1f:	53                   	push   %ebx
    ef20:	57                   	push   %edi
    ef21:	ff 5c 24 08          	lcall  *0x8(%esp)
    ef25:	83 c4 04             	add    $0x4,%esp
    ef28:	5b                   	pop    %ebx
    ef29:	83 c4 08             	add    $0x8,%esp
    ef2c:	b8 08 00 00 00       	mov    $0x8,%eax
    ef31:	8e d8                	mov    %eax,%ds
    ef33:	8e c0                	mov    %eax,%es
    ef35:	8e e0                	mov    %eax,%fs
    ef37:	8e e8                	mov    %eax,%gs
    ef39:	b8 00 80 00 00       	mov    $0x8000,%eax
    ef3e:	0f 22 d8             	mov    %eax,%cr3
    ef41:	8b 63 10             	mov    0x10(%ebx),%esp
    ef44:	8e 53 14             	mov    0x14(%ebx),%ss
    ef47:	61                   	popa   
    ef48:	c3                   	ret    

0000ef49 <_destart>:
    ef49:	66 b8 08 00          	mov    $0x8,%ax
    ef4d:	8e d8                	mov    %eax,%ds
    ef4f:	8b 5c 24 04          	mov    0x4(%esp),%ebx
    ef53:	8b 23                	mov    (%ebx),%esp
    ef55:	8e 53 04             	mov    0x4(%ebx),%ss
    ef58:	8b 43 08             	mov    0x8(%ebx),%eax
    ef5b:	0f 22 d8             	mov    %eax,%cr3
    ef5e:	1f                   	pop    %ds
    ef5f:	07                   	pop    %es
    ef60:	0f a1                	pop    %fs
    ef62:	0f a9                	pop    %gs
    ef64:	61                   	popa   
    ef65:	cf                   	iret   
    ef66:	c3                   	ret    

0000ef67 <_cr3_kernel>:
    ef67:	b8 00 80 00 00       	mov    $0x8000,%eax
    ef6c:	0f 22 d8             	mov    %eax,%cr3
    ef6f:	c3                   	ret    

0000ef70 <_cr3_user>:
    ef70:	8b 44 24 04          	mov    0x4(%esp),%eax
    ef74:	0f 22 d8             	mov    %eax,%cr3
    ef77:	c3                   	ret    
	...

0000ef80 <_int30_asm>:
    ef80:	1e                   	push   %ds
    ef81:	06                   	push   %es
    ef82:	60                   	pusha  
    ef83:	50                   	push   %eax
    ef84:	66 b8 08 00          	mov    $0x8,%ax
    ef88:	8e d8                	mov    %eax,%ds
    ef8a:	8e c0                	mov    %eax,%es
    ef8c:	58                   	pop    %eax
    ef8d:	60                   	pusha  
    ef8e:	6a 30                	push   $0x30
    ef90:	e8 30 f3 ff ff       	call   e2c5 <_apideliv>
    ef95:	83 c4 24             	add    $0x24,%esp
    ef98:	61                   	popa   
    ef99:	07                   	pop    %es
    ef9a:	1f                   	pop    %ds
    ef9b:	cf                   	iret   

0000ef9c <_int31_asm>:
    ef9c:	1e                   	push   %ds
    ef9d:	06                   	push   %es
    ef9e:	53                   	push   %ebx
    ef9f:	50                   	push   %eax
    efa0:	b8 08 00 00 00       	mov    $0x8,%eax
    efa5:	8e d8                	mov    %eax,%ds
    efa7:	8e c0                	mov    %eax,%es
    efa9:	58                   	pop    %eax
    efaa:	89 25 08 10 00 00    	mov    %esp,0x1008
    efb0:	8c 15 0c 10 00 00    	mov    %ss,0x100c
    efb6:	8b 25 10 10 00 00    	mov    0x1010,%esp
    efbc:	8e 15 14 10 00 00    	mov    0x1014,%ss
    efc2:	0f 20 db             	mov    %cr3,%ebx
    efc5:	89 1d 20 10 00 00    	mov    %ebx,0x1020
    efcb:	8b 1d 24 10 00 00    	mov    0x1024,%ebx
    efd1:	89 dd                	mov    %ebx,%ebp
    efd3:	bb 00 80 00 00       	mov    $0x8000,%ebx
    efd8:	0f 22 db             	mov    %ebx,%cr3
    efdb:	89 eb                	mov    %ebp,%ebx
    efdd:	60                   	pusha  
    efde:	83 ec 20             	sub    $0x20,%esp
    efe1:	60                   	pusha  
    efe2:	6a 31                	push   $0x31
    efe4:	e8 dc f2 ff ff       	call   e2c5 <_apideliv>
    efe9:	83 c4 24             	add    $0x24,%esp
    efec:	83 c4 20             	add    $0x20,%esp
    efef:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    eff3:	61                   	popa   
    eff4:	89 dd                	mov    %ebx,%ebp
    eff6:	8b 5b 20             	mov    0x20(%ebx),%ebx
    eff9:	0f 22 db             	mov    %ebx,%cr3
    effc:	89 25 10 10 00 00    	mov    %esp,0x1010
    f002:	8c 15 14 10 00 00    	mov    %ss,0x1014
    f008:	8b 25 08 10 00 00    	mov    0x1008,%esp
    f00e:	8e 15 0c 10 00 00    	mov    0x100c,%ss
    f014:	5b                   	pop    %ebx
    f015:	07                   	pop    %es
    f016:	1f                   	pop    %ds
    f017:	cf                   	iret   

0000f018 <_interr01>:
    f018:	b8 08 00 00 00       	mov    $0x8,%eax
    f01d:	8e d8                	mov    %eax,%ds
    f01f:	8e d0                	mov    %eax,%ss
    f021:	6a 00                	push   $0x0
    f023:	6a 01                	push   $0x1
    f025:	e8 44 01 00 00       	call   f16e <_interrdeliv>
    f02a:	83 c4 08             	add    $0x8,%esp
    f02d:	cf                   	iret   

0000f02e <_interr03>:
    f02e:	b8 08 00 00 00       	mov    $0x8,%eax
    f033:	8e d8                	mov    %eax,%ds
    f035:	8e d0                	mov    %eax,%ss
    f037:	6a 00                	push   $0x0
    f039:	6a 03                	push   $0x3
    f03b:	e8 2e 01 00 00       	call   f16e <_interrdeliv>
    f040:	83 c4 08             	add    $0x8,%esp
    f043:	cf                   	iret   

0000f044 <_interr04>:
    f044:	b8 08 00 00 00       	mov    $0x8,%eax
    f049:	8e d8                	mov    %eax,%ds
    f04b:	8e d0                	mov    %eax,%ss
    f04d:	6a 00                	push   $0x0
    f04f:	6a 04                	push   $0x4
    f051:	e8 18 01 00 00       	call   f16e <_interrdeliv>
    f056:	83 c4 08             	add    $0x8,%esp
    f059:	cf                   	iret   

0000f05a <_interr05>:
    f05a:	b8 08 00 00 00       	mov    $0x8,%eax
    f05f:	8e d8                	mov    %eax,%ds
    f061:	8e d0                	mov    %eax,%ss
    f063:	6a 00                	push   $0x0
    f065:	6a 05                	push   $0x5
    f067:	e8 02 01 00 00       	call   f16e <_interrdeliv>
    f06c:	83 c4 08             	add    $0x8,%esp
    f06f:	cf                   	iret   

0000f070 <_interr06>:
    f070:	b8 08 00 00 00       	mov    $0x8,%eax
    f075:	8e d8                	mov    %eax,%ds
    f077:	8e d0                	mov    %eax,%ss
    f079:	6a 00                	push   $0x0
    f07b:	6a 06                	push   $0x6
    f07d:	e8 ec 00 00 00       	call   f16e <_interrdeliv>
    f082:	83 c4 08             	add    $0x8,%esp
    f085:	cf                   	iret   

0000f086 <_interr07>:
    f086:	b8 08 00 00 00       	mov    $0x8,%eax
    f08b:	8e d8                	mov    %eax,%ds
    f08d:	8e d0                	mov    %eax,%ss
    f08f:	6a 00                	push   $0x0
    f091:	6a 07                	push   $0x7
    f093:	e8 d6 00 00 00       	call   f16e <_interrdeliv>
    f098:	83 c4 08             	add    $0x8,%esp
    f09b:	cf                   	iret   

0000f09c <_interr08>:
    f09c:	b8 08 00 00 00       	mov    $0x8,%eax
    f0a1:	8e d8                	mov    %eax,%ds
    f0a3:	8e c0                	mov    %eax,%es
    f0a5:	bf 00 80 0b 00       	mov    $0xb8000,%edi
    f0aa:	b8 00 1f 00 00       	mov    $0x1f00,%eax
    f0af:	b9 d0 07 00 00       	mov    $0x7d0,%ecx
    f0b4:	f3 66 ab             	rep stos %ax,%es:(%edi)
    f0b7:	bf c2 87 0b 00       	mov    $0xb87c2,%edi
    f0bc:	be cd f0 00 00       	mov    $0xf0cd,%esi
    f0c1:	b9 0e 00 00 00       	mov    $0xe,%ecx
    f0c6:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    f0c7:	47                   	inc    %edi
    f0c8:	e2 fc                	loop   f0c6 <_interr08+0x2a>
    f0ca:	fa                   	cli    
    f0cb:	f4                   	hlt    
    f0cc:	cf                   	iret   
    f0cd:	49                   	dec    %ecx
    f0ce:	4e                   	dec    %esi
    f0cf:	54                   	push   %esp
    f0d0:	20 30                	and    %dh,(%eax)
    f0d2:	78 30                	js     f104 <_interr10+0x15>
    f0d4:	38 20                	cmp    %ah,(%eax)
    f0d6:	41                   	inc    %ecx
    f0d7:	42                   	inc    %edx
    f0d8:	4f                   	dec    %edi
    f0d9:	52                   	push   %edx
    f0da:	54                   	push   %esp

0000f0db <_interr0a>:
    f0db:	b8 08 00 00 00       	mov    $0x8,%eax
    f0e0:	8e d8                	mov    %eax,%ds
    f0e2:	8e d0                	mov    %eax,%ss
    f0e4:	6a 0a                	push   $0xa
    f0e6:	e8 83 00 00 00       	call   f16e <_interrdeliv>
    f0eb:	83 c4 08             	add    $0x8,%esp
    f0ee:	cf                   	iret   

0000f0ef <_interr10>:
    f0ef:	b8 08 00 00 00       	mov    $0x8,%eax
    f0f4:	8e d8                	mov    %eax,%ds
    f0f6:	8e d0                	mov    %eax,%ss
    f0f8:	6a 00                	push   $0x0
    f0fa:	6a 10                	push   $0x10
    f0fc:	e8 6d 00 00 00       	call   f16e <_interrdeliv>
    f101:	83 c4 08             	add    $0x8,%esp
    f104:	cf                   	iret   

0000f105 <_interr11>:
    f105:	b8 08 00 00 00       	mov    $0x8,%eax
    f10a:	8e d8                	mov    %eax,%ds
    f10c:	8e d0                	mov    %eax,%ss
    f10e:	6a 11                	push   $0x11
    f110:	e8 59 00 00 00       	call   f16e <_interrdeliv>
    f115:	83 c4 08             	add    $0x8,%esp
    f118:	cf                   	iret   

0000f119 <_interr12>:
    f119:	b8 08 00 00 00       	mov    $0x8,%eax
    f11e:	8e d8                	mov    %eax,%ds
    f120:	8e d0                	mov    %eax,%ss
    f122:	6a 00                	push   $0x0
    f124:	6a 12                	push   $0x12
    f126:	e8 43 00 00 00       	call   f16e <_interrdeliv>
    f12b:	83 c4 08             	add    $0x8,%esp
    f12e:	cf                   	iret   

0000f12f <_interr13>:
    f12f:	b8 08 00 00 00       	mov    $0x8,%eax
    f134:	8e d8                	mov    %eax,%ds
    f136:	8e d0                	mov    %eax,%ss
    f138:	6a 00                	push   $0x0
    f13a:	6a 13                	push   $0x13
    f13c:	e8 2d 00 00 00       	call   f16e <_interrdeliv>
    f141:	83 c4 08             	add    $0x8,%esp
    f144:	cf                   	iret   
    f145:	00 00                	add    %al,(%eax)
	...

0000f148 <_error>:
    f148:	83 ec 1c             	sub    $0x1c,%esp
    f14b:	8b 44 24 20          	mov    0x20(%esp),%eax
    f14f:	8b 14 85 4c f7 00 00 	mov    0xf74c(,%eax,4),%edx
    f156:	89 54 24 08          	mov    %edx,0x8(%esp)
    f15a:	89 44 24 04          	mov    %eax,0x4(%esp)
    f15e:	c7 04 24 7c f5 00 00 	movl   $0xf57c,(%esp)
    f165:	e8 c6 de ff ff       	call   d030 <_printf>
    f16a:	83 c4 1c             	add    $0x1c,%esp
    f16d:	c3                   	ret    

0000f16e <_interrdeliv>:
    f16e:	83 ec 2c             	sub    $0x2c,%esp
    f171:	8b 44 24 38          	mov    0x38(%esp),%eax
    f175:	89 44 24 14          	mov    %eax,0x14(%esp)
    f179:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    f17d:	89 44 24 10          	mov    %eax,0x10(%esp)
    f181:	8b 44 24 40          	mov    0x40(%esp),%eax
    f185:	89 44 24 0c          	mov    %eax,0xc(%esp)
    f189:	8b 44 24 34          	mov    0x34(%esp),%eax
    f18d:	89 44 24 08          	mov    %eax,0x8(%esp)
    f191:	8b 44 24 30          	mov    0x30(%esp),%eax
    f195:	89 44 24 04          	mov    %eax,0x4(%esp)
    f199:	c7 04 24 8c f5 00 00 	movl   $0xf58c,(%esp)
    f1a0:	e8 8b de ff ff       	call   d030 <_printf>
    f1a5:	83 c4 2c             	add    $0x2c,%esp
    f1a8:	c3                   	ret    

0000f1a9 <_int0e>:
    f1a9:	83 ec 2c             	sub    $0x2c,%esp
    f1ac:	c7 04 24 a6 f5 00 00 	movl   $0xf5a6,(%esp)
    f1b3:	e8 44 dd ff ff       	call   cefc <_putstr>
    f1b8:	8b 44 24 38          	mov    0x38(%esp),%eax
    f1bc:	89 44 24 10          	mov    %eax,0x10(%esp)
    f1c0:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    f1c4:	89 44 24 0c          	mov    %eax,0xc(%esp)
    f1c8:	8b 44 24 30          	mov    0x30(%esp),%eax
    f1cc:	89 44 24 08          	mov    %eax,0x8(%esp)
    f1d0:	8b 44 24 34          	mov    0x34(%esp),%eax
    f1d4:	89 44 24 04          	mov    %eax,0x4(%esp)
    f1d8:	c7 04 24 b4 f5 00 00 	movl   $0xf5b4,(%esp)
    f1df:	e8 4c de ff ff       	call   d030 <_printf>
    f1e4:	83 c4 2c             	add    $0x2c,%esp
    f1e7:	c3                   	ret    

0000f1e8 <_int0d>:
    f1e8:	83 ec 1c             	sub    $0x1c,%esp
    f1eb:	c7 04 24 db f5 00 00 	movl   $0xf5db,(%esp)
    f1f2:	e8 05 dd ff ff       	call   cefc <_putstr>
    f1f7:	8b 44 24 24          	mov    0x24(%esp),%eax
    f1fb:	89 44 24 0c          	mov    %eax,0xc(%esp)
    f1ff:	8b 44 24 28          	mov    0x28(%esp),%eax
    f203:	89 44 24 08          	mov    %eax,0x8(%esp)
    f207:	8b 44 24 20          	mov    0x20(%esp),%eax
    f20b:	89 44 24 04          	mov    %eax,0x4(%esp)
    f20f:	c7 04 24 f0 f5 00 00 	movl   $0xf5f0,(%esp)
    f216:	e8 15 de ff ff       	call   d030 <_printf>
    f21b:	83 c4 1c             	add    $0x1c,%esp
    f21e:	c3                   	ret    

0000f21f <_int0c>:
    f21f:	53                   	push   %ebx
    f220:	83 ec 28             	sub    $0x28,%esp
    f223:	8b 5c 24 40          	mov    0x40(%esp),%ebx
    f227:	c7 04 24 10 f6 00 00 	movl   $0xf610,(%esp)
    f22e:	e8 c9 dc ff ff       	call   cefc <_putstr>
    f233:	8b 44 24 3c          	mov    0x3c(%esp),%eax
    f237:	89 44 24 14          	mov    %eax,0x14(%esp)
    f23b:	0f bf db             	movswl %bx,%ebx
    f23e:	89 5c 24 10          	mov    %ebx,0x10(%esp)
    f242:	8b 44 24 34          	mov    0x34(%esp),%eax
    f246:	89 44 24 0c          	mov    %eax,0xc(%esp)
    f24a:	8b 44 24 38          	mov    0x38(%esp),%eax
    f24e:	89 44 24 08          	mov    %eax,0x8(%esp)
    f252:	8b 44 24 30          	mov    0x30(%esp),%eax
    f256:	89 44 24 04          	mov    %eax,0x4(%esp)
    f25a:	c7 04 24 20 f6 00 00 	movl   $0xf620,(%esp)
    f261:	e8 ca dd ff ff       	call   d030 <_printf>
    f266:	83 c4 28             	add    $0x28,%esp
    f269:	5b                   	pop    %ebx
    f26a:	c3                   	ret    

0000f26b <_int0b>:
    f26b:	83 ec 1c             	sub    $0x1c,%esp
    f26e:	c7 04 24 4c f6 00 00 	movl   $0xf64c,(%esp)
    f275:	e8 82 dc ff ff       	call   cefc <_putstr>
    f27a:	8b 44 24 24          	mov    0x24(%esp),%eax
    f27e:	89 44 24 0c          	mov    %eax,0xc(%esp)
    f282:	8b 44 24 28          	mov    0x28(%esp),%eax
    f286:	89 44 24 08          	mov    %eax,0x8(%esp)
    f28a:	8b 44 24 20          	mov    0x20(%esp),%eax
    f28e:	89 44 24 04          	mov    %eax,0x4(%esp)
    f292:	c7 04 24 f0 f5 00 00 	movl   $0xf5f0,(%esp)
    f299:	e8 92 dd ff ff       	call   d030 <_printf>
    f29e:	83 c4 1c             	add    $0x1c,%esp
    f2a1:	c3                   	ret    

0000f2a2 <_int00>:
    f2a2:	83 ec 1c             	sub    $0x1c,%esp
    f2a5:	c7 04 24 61 f6 00 00 	movl   $0xf661,(%esp)
    f2ac:	e8 4b dc ff ff       	call   cefc <_putstr>
    f2b1:	8b 44 24 20          	mov    0x20(%esp),%eax
    f2b5:	89 44 24 08          	mov    %eax,0x8(%esp)
    f2b9:	8b 44 24 24          	mov    0x24(%esp),%eax
    f2bd:	89 44 24 04          	mov    %eax,0x4(%esp)
    f2c1:	c7 04 24 70 f6 00 00 	movl   $0xf670,(%esp)
    f2c8:	e8 63 dd ff ff       	call   d030 <_printf>
    f2cd:	83 c4 1c             	add    $0x1c,%esp
    f2d0:	c3                   	ret    
    f2d1:	90                   	nop
    f2d2:	90                   	nop
    f2d3:	90                   	nop
