
desc.o:     file format pe-i386


Disassembly of section .text:

00000000 <_set_gatedesc>:
   0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   4:	8b 54 24 08          	mov    0x8(%esp),%edx
   8:	8d 04 cd 00 a8 00 00 	lea    0xa800(,%ecx,8),%eax
   f:	66 89 14 cd 00 a8 00 	mov    %dx,0xa800(,%ecx,8)
  16:	00 
  17:	c1 fa 10             	sar    $0x10,%edx
  1a:	66 89 50 06          	mov    %dx,0x6(%eax)
  1e:	8b 54 24 0c          	mov    0xc(%esp),%edx
  22:	66 89 50 02          	mov    %dx,0x2(%eax)
  26:	8b 54 24 10          	mov    0x10(%esp),%edx
  2a:	88 50 04             	mov    %dl,0x4(%eax)
  2d:	8b 54 24 14          	mov    0x14(%esp),%edx
  31:	88 50 05             	mov    %dl,0x5(%eax)
  34:	c3                   	ret    

00000035 <_int21>:
  35:	83 ec 1c             	sub    $0x1c,%esp
  38:	8b 44 24 20          	mov    0x20(%esp),%eax
  3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  40:	a1 00 00 00 00       	mov    0x0,%eax
  45:	89 04 24             	mov    %eax,(%esp)
  48:	e8 00 00 00 00       	call   4d <_int21+0x18>
  4d:	83 c4 1c             	add    $0x1c,%esp
  50:	c3                   	ret    

00000051 <_int3>:
  51:	83 ec 1c             	sub    $0x1c,%esp
  54:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  5b:	e8 00 00 00 00       	call   60 <_int3+0xf>
  60:	a1 00 00 00 00       	mov    0x0,%eax
  65:	89 04 24             	mov    %eax,(%esp)
  68:	e8 00 00 00 00       	call   6d <_int3+0x1c>
  6d:	85 c0                	test   %eax,%eax
  6f:	74 ef                	je     60 <_int3+0xf>
  71:	83 c4 1c             	add    $0x1c,%esp
  74:	c3                   	ret    

00000075 <_int0e>:
  75:	83 ec 1c             	sub    $0x1c,%esp
  78:	c7 04 24 13 00 00 00 	movl   $0x13,(%esp)
  7f:	e8 00 00 00 00       	call   84 <_int0e+0xf>
  84:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
  8b:	00 
  8c:	8b 44 24 20          	mov    0x20(%esp),%eax
  90:	89 04 24             	mov    %eax,(%esp)
  93:	e8 00 00 00 00       	call   98 <_int0e+0x23>
  98:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  9f:	e8 00 00 00 00       	call   a4 <_int0e+0x2f>
  a4:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
  ab:	00 
  ac:	8b 44 24 24          	mov    0x24(%esp),%eax
  b0:	89 04 24             	mov    %eax,(%esp)
  b3:	e8 00 00 00 00       	call   b8 <_int0e+0x43>
  b8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  bf:	e8 00 00 00 00       	call   c4 <_int0e+0x4f>
  c4:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
  cb:	00 
  cc:	8b 44 24 28          	mov    0x28(%esp),%eax
  d0:	89 04 24             	mov    %eax,(%esp)
  d3:	e8 00 00 00 00       	call   d8 <_int0e+0x63>
  d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  df:	e8 00 00 00 00       	call   e4 <_int0e+0x6f>
  e4:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
  eb:	00 
  ec:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  f0:	89 04 24             	mov    %eax,(%esp)
  f3:	e8 00 00 00 00       	call   f8 <_int0e+0x83>
  f8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  ff:	e8 00 00 00 00       	call   104 <_int0e+0x8f>
 104:	e8 00 00 00 00       	call   109 <_int0e+0x94>
 109:	eb f9                	jmp    104 <_int0e+0x8f>

0000010b <_int0d>:
 10b:	83 ec 1c             	sub    $0x1c,%esp
 10e:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
 115:	e8 00 00 00 00       	call   11a <_int0d+0xf>
 11a:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 121:	00 
 122:	8b 44 24 20          	mov    0x20(%esp),%eax
 126:	89 04 24             	mov    %eax,(%esp)
 129:	e8 00 00 00 00       	call   12e <_int0d+0x23>
 12e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 135:	e8 00 00 00 00       	call   13a <_int0d+0x2f>
 13a:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 141:	00 
 142:	8b 44 24 24          	mov    0x24(%esp),%eax
 146:	89 04 24             	mov    %eax,(%esp)
 149:	e8 00 00 00 00       	call   14e <_int0d+0x43>
 14e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 155:	e8 00 00 00 00       	call   15a <_int0d+0x4f>
 15a:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 161:	00 
 162:	8b 44 24 28          	mov    0x28(%esp),%eax
 166:	89 04 24             	mov    %eax,(%esp)
 169:	e8 00 00 00 00       	call   16e <_int0d+0x63>
 16e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
 175:	e8 00 00 00 00       	call   17a <_int0d+0x6f>
 17a:	e8 00 00 00 00       	call   17f <_int0d+0x74>
 17f:	eb f9                	jmp    17a <_int0d+0x6f>

00000181 <_int20>:
 181:	a1 00 00 00 00       	mov    0x0,%eax
 186:	83 c0 01             	add    $0x1,%eax
 189:	a3 00 00 00 00       	mov    %eax,0x0
 18e:	a8 01                	test   $0x1,%al
 190:	75 0b                	jne    19d <_int20+0x1c>
 192:	83 ec 0c             	sub    $0xc,%esp
 195:	e8 00 00 00 00       	call   19a <_int20+0x19>
 19a:	83 c4 0c             	add    $0xc,%esp
 19d:	f3 c3                	repz ret 

0000019f <_enable_pic>:
 19f:	53                   	push   %ebx
 1a0:	83 ec 18             	sub    $0x18,%esp
 1a3:	8b 5c 24 20          	mov    0x20(%esp),%ebx
 1a7:	0f b6 c3             	movzbl %bl,%eax
 1aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ae:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
 1b5:	e8 00 00 00 00       	call   1ba <_enable_pic+0x1b>
 1ba:	0f b6 df             	movzbl %bh,%ebx
 1bd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 1c1:	c7 04 24 a1 00 00 00 	movl   $0xa1,(%esp)
 1c8:	e8 00 00 00 00       	call   1cd <_enable_pic+0x2e>
 1cd:	83 c4 18             	add    $0x18,%esp
 1d0:	5b                   	pop    %ebx
 1d1:	c3                   	ret    

000001d2 <_init_pit>:
 1d2:	83 ec 1c             	sub    $0x1c,%esp
 1d5:	c7 44 24 04 34 00 00 	movl   $0x34,0x4(%esp)
 1dc:	00 
 1dd:	c7 04 24 43 00 00 00 	movl   $0x43,(%esp)
 1e4:	e8 00 00 00 00       	call   1e9 <_init_pit+0x17>
 1e9:	c7 44 24 04 a9 00 00 	movl   $0xa9,0x4(%esp)
 1f0:	00 
 1f1:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
 1f8:	e8 00 00 00 00       	call   1fd <_init_pit+0x2b>
 1fd:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 204:	00 
 205:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
 20c:	e8 00 00 00 00       	call   211 <_init_pit+0x3f>
 211:	83 c4 1c             	add    $0x1c,%esp
 214:	c3                   	ret    

00000215 <_global_page>:
 215:	57                   	push   %edi
 216:	56                   	push   %esi
 217:	53                   	push   %ebx
 218:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 21c:	e8 00 00 00 00       	call   221 <_global_page+0xc>
 221:	89 de                	mov    %ebx,%esi
 223:	03 74 24 18          	add    0x18(%esp),%esi
 227:	39 f3                	cmp    %esi,%ebx
 229:	7d 2a                	jge    255 <_global_page+0x40>
 22b:	8d 14 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edx
 232:	89 d9                	mov    %ebx,%ecx
 234:	c1 e1 0c             	shl    $0xc,%ecx
 237:	8b 7c 24 10          	mov    0x10(%esp),%edi
 23b:	8d 4c 0f 03          	lea    0x3(%edi,%ecx,1),%ecx
 23f:	c1 e6 02             	shl    $0x2,%esi
 242:	8b 78 1c             	mov    0x1c(%eax),%edi
 245:	89 0c 17             	mov    %ecx,(%edi,%edx,1)
 248:	83 c2 04             	add    $0x4,%edx
 24b:	81 c1 00 10 00 00    	add    $0x1000,%ecx
 251:	39 f2                	cmp    %esi,%edx
 253:	75 ed                	jne    242 <_global_page+0x2d>
 255:	8b 40 10             	mov    0x10(%eax),%eax
 258:	c1 e0 0a             	shl    $0xa,%eax
 25b:	01 d8                	add    %ebx,%eax
 25d:	c1 e0 0c             	shl    $0xc,%eax
 260:	5b                   	pop    %ebx
 261:	5e                   	pop    %esi
 262:	5f                   	pop    %edi
 263:	c3                   	ret    

00000264 <_pop_page>:
 264:	53                   	push   %ebx
 265:	83 ec 08             	sub    $0x8,%esp
 268:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 26c:	e8 00 00 00 00       	call   271 <_pop_page+0xd>
 271:	85 db                	test   %ebx,%ebx
 273:	74 1a                	je     28f <_pop_page+0x2b>
 275:	f7 d3                	not    %ebx
 277:	ba ff ff ff ff       	mov    $0xffffffff,%edx
 27c:	8b 48 1c             	mov    0x1c(%eax),%ecx
 27f:	c7 04 91 00 00 00 00 	movl   $0x0,(%ecx,%edx,4)
 286:	83 ea 01             	sub    $0x1,%edx
 289:	39 da                	cmp    %ebx,%edx
 28b:	75 ef                	jne    27c <_pop_page+0x18>
 28d:	eb 05                	jmp    294 <_pop_page+0x30>
 28f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
 294:	8b 40 10             	mov    0x10(%eax),%eax
 297:	c1 e0 0a             	shl    $0xa,%eax
 29a:	01 d8                	add    %ebx,%eax
 29c:	c1 e0 0c             	shl    $0xc,%eax
 29f:	83 c4 08             	add    $0x8,%esp
 2a2:	5b                   	pop    %ebx
 2a3:	c3                   	ret    

000002a4 <_push_page>:
 2a4:	55                   	push   %ebp
 2a5:	57                   	push   %edi
 2a6:	56                   	push   %esi
 2a7:	53                   	push   %ebx
 2a8:	83 ec 2c             	sub    $0x2c,%esp
 2ab:	e8 00 00 00 00       	call   2b0 <_push_page+0xc>
 2b0:	89 c5                	mov    %eax,%ebp
 2b2:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 2b9:	e8 00 00 00 00       	call   2be <_push_page+0x1a>
 2be:	c7 04 24 61 00 00 00 	movl   $0x61,(%esp)
 2c5:	e8 00 00 00 00       	call   2ca <_push_page+0x26>
 2ca:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 2d1:	e8 00 00 00 00       	call   2d6 <_push_page+0x32>
 2d6:	c7 04 24 62 00 00 00 	movl   $0x62,(%esp)
 2dd:	e8 00 00 00 00       	call   2e2 <_push_page+0x3e>
 2e2:	8b 45 1c             	mov    0x1c(%ebp),%eax
 2e5:	83 38 00             	cmpl   $0x0,(%eax)
 2e8:	74 2b                	je     315 <_push_page+0x71>
 2ea:	bb 00 00 00 00       	mov    $0x0,%ebx
 2ef:	c7 04 24 72 00 00 00 	movl   $0x72,(%esp)
 2f6:	e8 00 00 00 00       	call   2fb <_push_page+0x57>
 2fb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 302:	e8 00 00 00 00       	call   307 <_push_page+0x63>
 307:	83 c3 01             	add    $0x1,%ebx
 30a:	8b 45 1c             	mov    0x1c(%ebp),%eax
 30d:	83 3c 98 00          	cmpl   $0x0,(%eax,%ebx,4)
 311:	75 dc                	jne    2ef <_push_page+0x4b>
 313:	eb 05                	jmp    31a <_push_page+0x76>
 315:	bb 00 00 00 00       	mov    $0x0,%ebx
 31a:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 321:	e8 00 00 00 00       	call   326 <_push_page+0x82>
 326:	c7 44 24 04 08 00 00 	movl   $0x8,0x4(%esp)
 32d:	00 
 32e:	89 1c 24             	mov    %ebx,(%esp)
 331:	e8 00 00 00 00       	call   336 <_push_page+0x92>
 336:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 33d:	e8 00 00 00 00       	call   342 <_push_page+0x9e>
 342:	c7 04 24 63 00 00 00 	movl   $0x63,(%esp)
 349:	e8 00 00 00 00       	call   34e <_push_page+0xaa>
 34e:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 355:	e8 00 00 00 00       	call   35a <_push_page+0xb6>
 35a:	83 7c 24 44 00       	cmpl   $0x0,0x44(%esp)
 35f:	74 4a                	je     3ab <_push_page+0x107>
 361:	8d 3c 9d 00 00 00 00 	lea    0x0(,%ebx,4),%edi
 368:	89 d8                	mov    %ebx,%eax
 36a:	c1 e0 0c             	shl    $0xc,%eax
 36d:	8b 54 24 40          	mov    0x40(%esp),%edx
 371:	8d 74 02 03          	lea    0x3(%edx,%eax,1),%esi
 375:	8b 44 24 44          	mov    0x44(%esp),%eax
 379:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 37d:	8b 45 1c             	mov    0x1c(%ebp),%eax
 380:	89 34 38             	mov    %esi,(%eax,%edi,1)
 383:	c7 04 24 6d 00 00 00 	movl   $0x6d,(%esp)
 38a:	e8 00 00 00 00       	call   38f <_push_page+0xeb>
 38f:	c7 04 24 16 00 00 00 	movl   $0x16,(%esp)
 396:	e8 00 00 00 00       	call   39b <_push_page+0xf7>
 39b:	83 c7 04             	add    $0x4,%edi
 39e:	81 c6 00 10 00 00    	add    $0x1000,%esi
 3a4:	83 6c 24 1c 01       	subl   $0x1,0x1c(%esp)
 3a9:	75 d2                	jne    37d <_push_page+0xd9>
 3ab:	c7 04 24 1c 00 00 00 	movl   $0x1c,(%esp)
 3b2:	e8 00 00 00 00       	call   3b7 <_push_page+0x113>
 3b7:	8b 45 10             	mov    0x10(%ebp),%eax
 3ba:	c1 e0 0a             	shl    $0xa,%eax
 3bd:	01 d8                	add    %ebx,%eax
 3bf:	c1 e0 0c             	shl    $0xc,%eax
 3c2:	83 c4 2c             	add    $0x2c,%esp
 3c5:	5b                   	pop    %ebx
 3c6:	5e                   	pop    %esi
 3c7:	5f                   	pop    %edi
 3c8:	5d                   	pop    %ebp
 3c9:	c3                   	ret    

000003ca <_local_page>:
 3ca:	57                   	push   %edi
 3cb:	56                   	push   %esi
 3cc:	53                   	push   %ebx
 3cd:	8b 5c 24 14          	mov    0x14(%esp),%ebx
 3d1:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 3d5:	8b 74 24 20          	mov    0x20(%esp),%esi
 3d9:	8d 53 0c             	lea    0xc(%ebx),%edx
 3dc:	8b 44 24 10          	mov    0x10(%esp),%eax
 3e0:	89 14 b8             	mov    %edx,(%eax,%edi,4)
 3e3:	89 f0                	mov    %esi,%eax
 3e5:	03 44 24 24          	add    0x24(%esp),%eax
 3e9:	39 c6                	cmp    %eax,%esi
 3eb:	7d 1f                	jge    40c <_local_page+0x42>
 3ed:	89 f2                	mov    %esi,%edx
 3ef:	c1 e2 0c             	shl    $0xc,%edx
 3f2:	8b 4c 24 18          	mov    0x18(%esp),%ecx
 3f6:	8d 4c 11 03          	lea    0x3(%ecx,%edx,1),%ecx
 3fa:	89 f2                	mov    %esi,%edx
 3fc:	89 0c 93             	mov    %ecx,(%ebx,%edx,4)
 3ff:	83 c2 01             	add    $0x1,%edx
 402:	81 c1 00 10 00 00    	add    $0x1000,%ecx
 408:	39 c2                	cmp    %eax,%edx
 40a:	75 f0                	jne    3fc <_local_page+0x32>
 40c:	c1 e7 0a             	shl    $0xa,%edi
 40f:	8d 04 37             	lea    (%edi,%esi,1),%eax
 412:	c1 e0 0c             	shl    $0xc,%eax
 415:	5b                   	pop    %ebx
 416:	5e                   	pop    %esi
 417:	5f                   	pop    %edi
 418:	c3                   	ret    

00000419 <_set_segmdesc>:
 419:	57                   	push   %edi
 41a:	56                   	push   %esi
 41b:	53                   	push   %ebx
 41c:	8b 74 24 10          	mov    0x10(%esp),%esi
 420:	8b 4c 24 14          	mov    0x14(%esp),%ecx
 424:	8b 44 24 18          	mov    0x18(%esp),%eax
 428:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
 42c:	3d ff 0f 00 00       	cmp    $0xfff,%eax
 431:	76 09                	jbe    43c <_set_segmdesc+0x23>
 433:	81 cf 00 80 00 00    	or     $0x8000,%edi
 439:	c1 f8 0c             	sar    $0xc,%eax
 43c:	8d 1c f5 00 a0 00 00 	lea    0xa000(,%esi,8),%ebx
 443:	66 89 04 f5 00 a0 00 	mov    %ax,0xa000(,%esi,8)
 44a:	00 
 44b:	66 89 4b 02          	mov    %cx,0x2(%ebx)
 44f:	89 ce                	mov    %ecx,%esi
 451:	c1 fe 10             	sar    $0x10,%esi
 454:	89 f2                	mov    %esi,%edx
 456:	88 53 04             	mov    %dl,0x4(%ebx)
 459:	c1 f8 08             	sar    $0x8,%eax
 45c:	66 25 00 0f          	and    $0xf00,%ax
 460:	89 fa                	mov    %edi,%edx
 462:	80 e6 f0             	and    $0xf0,%dh
 465:	09 d0                	or     %edx,%eax
 467:	66 89 43 05          	mov    %ax,0x5(%ebx)
 46b:	c1 e9 18             	shr    $0x18,%ecx
 46e:	88 4b 07             	mov    %cl,0x7(%ebx)
 471:	5b                   	pop    %ebx
 472:	5e                   	pop    %esi
 473:	5f                   	pop    %edi
 474:	c3                   	ret    
 475:	90                   	nop
 476:	90                   	nop
 477:	90                   	nop
