
/media/psf/share/qCore-os/user/build/riscv64/matrix:     file format elf64-littleriscv


Disassembly of section .startup:

0000000080400000 <_start>:
.text
.globl _start
_start:
    mv a0, sp
    80400000:	850a                	mv	a0,sp
    tail __start_main
    80400002:	0040006f          	j	80400006 <__start_main>

Disassembly of section .text:

0000000080400006 <__start_main>:
#include <unistd.h>

extern int main();

int __start_main(long* p)
{
    80400006:	1141                	addi	sp,sp,-16
    80400008:	e406                	sd	ra,8(sp)
    exit(main());
    8040000a:	281000ef          	jal	ra,80400a8a <main>
    8040000e:	223000ef          	jal	ra,80400a30 <exit>
    return 0;
}
    80400012:	60a2                	ld	ra,8(sp)
    80400014:	4501                	li	a0,0
    80400016:	0141                	addi	sp,sp,16
    80400018:	8082                	ret

000000008040001a <getchar>:
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int getchar() {
    8040001a:	1101                	addi	sp,sp,-32
    char byte = 0;
    read(stdin, &byte, 1);
    8040001c:	00f10593          	addi	a1,sp,15
    80400020:	4605                	li	a2,1
    80400022:	4501                	li	a0,0
int getchar() {
    80400024:	ec06                	sd	ra,24(sp)
    char byte = 0;
    80400026:	000107a3          	sb	zero,15(sp)
    read(stdin, &byte, 1);
    8040002a:	1cf000ef          	jal	ra,804009f8 <read>
    return byte;
}
    8040002e:	60e2                	ld	ra,24(sp)
    80400030:	00f14503          	lbu	a0,15(sp)
    80400034:	6105                	addi	sp,sp,32
    80400036:	8082                	ret

0000000080400038 <putchar>:

int putchar(int c)
{
    80400038:	1101                	addi	sp,sp,-32
    8040003a:	87aa                	mv	a5,a0
    char byte = c;
    return write(stdout, &byte, 1);
    8040003c:	00f10593          	addi	a1,sp,15
    80400040:	4605                	li	a2,1
    80400042:	4501                	li	a0,0
{
    80400044:	ec06                	sd	ra,24(sp)
    char byte = c;
    80400046:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    8040004a:	1b9000ef          	jal	ra,80400a02 <write>
}
    8040004e:	60e2                	ld	ra,24(sp)
    80400050:	2501                	sext.w	a0,a0
    80400052:	6105                	addi	sp,sp,32
    80400054:	8082                	ret

0000000080400056 <puts>:

int puts(const char* s)
{
    80400056:	1101                	addi	sp,sp,-32
    80400058:	e822                	sd	s0,16(sp)
    8040005a:	ec06                	sd	ra,24(sp)
    8040005c:	842a                	mv	s0,a0
    int r;
    r = -(write(stdout, s, strlen(s)) < 0 || putchar('\n') < 0);
    8040005e:	5dc000ef          	jal	ra,8040063a <strlen>
    80400062:	862a                	mv	a2,a0
    80400064:	85a2                	mv	a1,s0
    80400066:	4501                	li	a0,0
    80400068:	19b000ef          	jal	ra,80400a02 <write>
    8040006c:	00055763          	bgez	a0,8040007a <puts+0x24>
    return r;
}
    80400070:	60e2                	ld	ra,24(sp)
    80400072:	6442                	ld	s0,16(sp)
    80400074:	557d                	li	a0,-1
    80400076:	6105                	addi	sp,sp,32
    80400078:	8082                	ret
    return write(stdout, &byte, 1);
    8040007a:	00f10593          	addi	a1,sp,15
    char byte = c;
    8040007e:	47a9                	li	a5,10
    return write(stdout, &byte, 1);
    80400080:	4605                	li	a2,1
    80400082:	4501                	li	a0,0
    char byte = c;
    80400084:	00f107a3          	sb	a5,15(sp)
    return write(stdout, &byte, 1);
    80400088:	17b000ef          	jal	ra,80400a02 <write>
}
    8040008c:	60e2                	ld	ra,24(sp)
    8040008e:	6442                	ld	s0,16(sp)
    80400090:	41f5551b          	sraiw	a0,a0,0x1f
    80400094:	6105                	addi	sp,sp,32
    80400096:	8082                	ret

0000000080400098 <printf>:
    for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
        putchar(digits[x >> (sizeof(uint64) * 8 - 4)]);
}

// Print to the console. only understands %d, %x, %p, %s.
void printf(const char* fmt, ...) {
    80400098:	7131                	addi	sp,sp,-192
    8040009a:	fc86                	sd	ra,120(sp)
    8040009c:	f8a2                	sd	s0,112(sp)
    8040009e:	f4a6                	sd	s1,104(sp)
    804000a0:	f0ca                	sd	s2,96(sp)
    804000a2:	ecce                	sd	s3,88(sp)
    804000a4:	e8d2                	sd	s4,80(sp)
    804000a6:	e4d6                	sd	s5,72(sp)
    804000a8:	e0da                	sd	s6,64(sp)
    804000aa:	fc5e                	sd	s7,56(sp)
    804000ac:	f862                	sd	s8,48(sp)
    804000ae:	f466                	sd	s9,40(sp)
    va_list ap;
    int i, c;
    char *s;

    va_start(ap, fmt);
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    804000b0:	00054303          	lbu	t1,0(a0)
void printf(const char* fmt, ...) {
    804000b4:	f53e                	sd	a5,168(sp)
    va_start(ap, fmt);
    804000b6:	013c                	addi	a5,sp,136
void printf(const char* fmt, ...) {
    804000b8:	e52e                	sd	a1,136(sp)
    804000ba:	e932                	sd	a2,144(sp)
    804000bc:	ed36                	sd	a3,152(sp)
    804000be:	f13a                	sd	a4,160(sp)
    804000c0:	f942                	sd	a6,176(sp)
    804000c2:	fd46                	sd	a7,184(sp)
    va_start(ap, fmt);
    804000c4:	e43e                	sd	a5,8(sp)
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    804000c6:	0e030363          	beqz	t1,804001ac <printf+0x114>
    804000ca:	89aa                	mv	s3,a0
    804000cc:	0003071b          	sext.w	a4,t1
    804000d0:	4481                	li	s1,0
        if (c != '%') {
    804000d2:	02500a13          	li	s4,37
            continue;
        }
        c = fmt[++i] & 0xff;
        if (c == 0)
            break;
        switch (c) {
    804000d6:	07000b13          	li	s6,112
    char byte = c;
    804000da:	03000c13          	li	s8,48
    804000de:	07800b93          	li	s7,120
    804000e2:	00002a97          	auipc	s5,0x2
    804000e6:	a86a8a93          	addi	s5,s5,-1402 # 80401b68 <digits>
        if (c != '%') {
    804000ea:	0014879b          	addiw	a5,s1,1
    804000ee:	00f98933          	add	s2,s3,a5
    804000f2:	15471b63          	bne	a4,s4,80400248 <printf+0x1b0>
        c = fmt[++i] & 0xff;
    804000f6:	00094403          	lbu	s0,0(s2)
        if (c == 0)
    804000fa:	c84d                	beqz	s0,804001ac <printf+0x114>
        switch (c) {
    804000fc:	2489                	addiw	s1,s1,2
    804000fe:	00998933          	add	s2,s3,s1
    80400102:	19640a63          	beq	s0,s6,80400296 <printf+0x1fe>
    80400106:	0c8b6063          	bltu	s6,s0,804001c6 <printf+0x12e>
    8040010a:	21440863          	beq	s0,s4,8040031a <printf+0x282>
    8040010e:	06400793          	li	a5,100
    80400112:	1cf41d63          	bne	s0,a5,804002ec <printf+0x254>
            case 'd':
                printint(va_arg(ap, int), 10, 1);
    80400116:	67a2                	ld	a5,8(sp)
    80400118:	4394                	lw	a3,0(a5)
    8040011a:	07a1                	addi	a5,a5,8
    8040011c:	e43e                	sd	a5,8(sp)
    8040011e:	0ff6f793          	andi	a5,a3,255
    if (sign && (sign = xx < 0))
    80400122:	0006d663          	bgez	a3,8040012e <printf+0x96>
        x = -xx;
    80400126:	40f007bb          	negw	a5,a5
    8040012a:	0ff7f793          	andi	a5,a5,255
        buf[i++] = digits[x % base];
    8040012e:	4729                	li	a4,10
    80400130:	02e7e63b          	remw	a2,a5,a4
    } while ((x /= base) != 0);
    80400134:	02e7c43b          	divw	s0,a5,a4
        buf[i++] = digits[x % base];
    80400138:	9656                	add	a2,a2,s5
    8040013a:	00064603          	lbu	a2,0(a2)
    8040013e:	00c10823          	sb	a2,16(sp)
    } while ((x /= base) != 0);
    80400142:	22040163          	beqz	s0,80400364 <printf+0x2cc>
        buf[i++] = digits[x % base];
    80400146:	02e4663b          	remw	a2,s0,a4
    } while ((x /= base) != 0);
    8040014a:	02e447bb          	divw	a5,s0,a4
        buf[i++] = digits[x % base];
    8040014e:	00ca8733          	add	a4,s5,a2
    80400152:	00074703          	lbu	a4,0(a4)
    80400156:	00e108a3          	sb	a4,17(sp)
    } while ((x /= base) != 0);
    8040015a:	20078763          	beqz	a5,80400368 <printf+0x2d0>
        buf[i++] = digits[x % base];
    8040015e:	97d6                	add	a5,a5,s5
    80400160:	0007c703          	lbu	a4,0(a5)
    80400164:	4409                	li	s0,2
    80400166:	478d                	li	a5,3
    80400168:	00e10923          	sb	a4,18(sp)
    if (sign)
    8040016c:	0006d963          	bgez	a3,8040017e <printf+0xe6>
        buf[i++] = '-';
    80400170:	1018                	addi	a4,sp,32
    80400172:	973e                	add	a4,a4,a5
    80400174:	02d00693          	li	a3,45
    80400178:	fed70823          	sb	a3,-16(a4)
        buf[i++] = digits[x % base];
    8040017c:	843e                	mv	s0,a5
    while (--i >= 0)
    8040017e:	081c                	addi	a5,sp,16
    80400180:	943e                	add	s0,s0,a5
    80400182:	00f10c93          	addi	s9,sp,15
    char byte = c;
    80400186:	00044783          	lbu	a5,0(s0)
    return write(stdout, &byte, 1);
    8040018a:	4605                	li	a2,1
    8040018c:	147d                	addi	s0,s0,-1
    8040018e:	00710593          	addi	a1,sp,7
    80400192:	4501                	li	a0,0
    char byte = c;
    80400194:	00f103a3          	sb	a5,7(sp)
    return write(stdout, &byte, 1);
    80400198:	06b000ef          	jal	ra,80400a02 <write>
    while (--i >= 0)
    8040019c:	ff9415e3          	bne	s0,s9,80400186 <printf+0xee>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    804001a0:	00094303          	lbu	t1,0(s2)
    804001a4:	0003071b          	sext.w	a4,t1
    804001a8:	f40311e3          	bnez	t1,804000ea <printf+0x52>
                putchar(c);
                break;
        }
    }
    va_end(ap);
    804001ac:	70e6                	ld	ra,120(sp)
    804001ae:	7446                	ld	s0,112(sp)
    804001b0:	74a6                	ld	s1,104(sp)
    804001b2:	7906                	ld	s2,96(sp)
    804001b4:	69e6                	ld	s3,88(sp)
    804001b6:	6a46                	ld	s4,80(sp)
    804001b8:	6aa6                	ld	s5,72(sp)
    804001ba:	6b06                	ld	s6,64(sp)
    804001bc:	7be2                	ld	s7,56(sp)
    804001be:	7c42                	ld	s8,48(sp)
    804001c0:	7ca2                	ld	s9,40(sp)
    804001c2:	6129                	addi	sp,sp,192
    804001c4:	8082                	ret
        switch (c) {
    804001c6:	07300793          	li	a5,115
    804001ca:	08f40e63          	beq	s0,a5,80400266 <printf+0x1ce>
    804001ce:	07800793          	li	a5,120
    804001d2:	10f41d63          	bne	s0,a5,804002ec <printf+0x254>
                printint(va_arg(ap, int), 16, 1);
    804001d6:	67a2                	ld	a5,8(sp)
    804001d8:	4398                	lw	a4,0(a5)
    804001da:	07a1                	addi	a5,a5,8
    804001dc:	e43e                	sd	a5,8(sp)
    804001de:	0ff77793          	andi	a5,a4,255
    if (sign && (sign = xx < 0))
    804001e2:	14074a63          	bltz	a4,80400336 <printf+0x29e>
        buf[i++] = digits[x % base];
    804001e6:	8bbd                	andi	a5,a5,15
    804001e8:	97d6                	add	a5,a5,s5
    804001ea:	0007c783          	lbu	a5,0(a5)
    } while ((x /= base) != 0);
    804001ee:	4047541b          	sraiw	s0,a4,0x4
    804001f2:	883d                	andi	s0,s0,15
        buf[i++] = digits[x % base];
    804001f4:	00f10823          	sb	a5,16(sp)
    } while ((x /= base) != 0);
    804001f8:	c005                	beqz	s0,80400218 <printf+0x180>
        buf[i++] = digits[x % base];
    804001fa:	9456                	add	s0,s0,s5
    804001fc:	00044783          	lbu	a5,0(s0)
    80400200:	4405                	li	s0,1
    80400202:	00f108a3          	sb	a5,17(sp)
    if (sign)
    80400206:	00075963          	bgez	a4,80400218 <printf+0x180>
        buf[i++] = digits[x % base];
    8040020a:	4409                	li	s0,2
        buf[i++] = '-';
    8040020c:	101c                	addi	a5,sp,32
    8040020e:	02d00713          	li	a4,45
    80400212:	97a2                	add	a5,a5,s0
    80400214:	fee78823          	sb	a4,-16(a5)
    while (--i >= 0)
    80400218:	081c                	addi	a5,sp,16
    8040021a:	943e                	add	s0,s0,a5
    8040021c:	00f10c93          	addi	s9,sp,15
    char byte = c;
    80400220:	00044783          	lbu	a5,0(s0)
    return write(stdout, &byte, 1);
    80400224:	4605                	li	a2,1
    80400226:	147d                	addi	s0,s0,-1
    80400228:	00710593          	addi	a1,sp,7
    8040022c:	4501                	li	a0,0
    char byte = c;
    8040022e:	00f103a3          	sb	a5,7(sp)
    return write(stdout, &byte, 1);
    80400232:	7d0000ef          	jal	ra,80400a02 <write>
    while (--i >= 0)
    80400236:	ff9415e3          	bne	s0,s9,80400220 <printf+0x188>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    8040023a:	00094303          	lbu	t1,0(s2)
    8040023e:	0003071b          	sext.w	a4,t1
    80400242:	ea0314e3          	bnez	t1,804000ea <printf+0x52>
    80400246:	b79d                	j	804001ac <printf+0x114>
    return write(stdout, &byte, 1);
    80400248:	4605                	li	a2,1
    8040024a:	080c                	addi	a1,sp,16
    8040024c:	4501                	li	a0,0
    char byte = c;
    8040024e:	00610823          	sb	t1,16(sp)
            continue;
    80400252:	84be                	mv	s1,a5
    return write(stdout, &byte, 1);
    80400254:	7ae000ef          	jal	ra,80400a02 <write>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    80400258:	00094303          	lbu	t1,0(s2)
    8040025c:	0003071b          	sext.w	a4,t1
    80400260:	e80315e3          	bnez	t1,804000ea <printf+0x52>
    80400264:	b7a1                	j	804001ac <printf+0x114>
                if ((s = va_arg(ap, char *)) == 0)
    80400266:	67a2                	ld	a5,8(sp)
    80400268:	6380                	ld	s0,0(a5)
    8040026a:	07a1                	addi	a5,a5,8
    8040026c:	e43e                	sd	a5,8(sp)
    8040026e:	e811                	bnez	s0,80400282 <printf+0x1ea>
    80400270:	a0dd                	j	80400356 <printf+0x2be>
    return write(stdout, &byte, 1);
    80400272:	4605                	li	a2,1
    80400274:	080c                	addi	a1,sp,16
    80400276:	4501                	li	a0,0
                for (; *s; s++)
    80400278:	0405                	addi	s0,s0,1
    char byte = c;
    8040027a:	00f10823          	sb	a5,16(sp)
    return write(stdout, &byte, 1);
    8040027e:	784000ef          	jal	ra,80400a02 <write>
                for (; *s; s++)
    80400282:	00044783          	lbu	a5,0(s0)
    80400286:	f7f5                	bnez	a5,80400272 <printf+0x1da>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    80400288:	00094303          	lbu	t1,0(s2)
    8040028c:	0003071b          	sext.w	a4,t1
    80400290:	e4031de3          	bnez	t1,804000ea <printf+0x52>
    80400294:	bf21                	j	804001ac <printf+0x114>
                printptr(va_arg(ap, uint64));
    80400296:	67a2                	ld	a5,8(sp)
    return write(stdout, &byte, 1);
    80400298:	4605                	li	a2,1
    8040029a:	080c                	addi	a1,sp,16
                printptr(va_arg(ap, uint64));
    8040029c:	00878713          	addi	a4,a5,8
    return write(stdout, &byte, 1);
    804002a0:	4501                	li	a0,0
                printptr(va_arg(ap, uint64));
    804002a2:	0007bc83          	ld	s9,0(a5)
    804002a6:	e43a                	sd	a4,8(sp)
    char byte = c;
    804002a8:	01810823          	sb	s8,16(sp)
    return write(stdout, &byte, 1);
    804002ac:	756000ef          	jal	ra,80400a02 <write>
    804002b0:	4605                	li	a2,1
    804002b2:	080c                	addi	a1,sp,16
    804002b4:	4501                	li	a0,0
    char byte = c;
    804002b6:	01710823          	sb	s7,16(sp)
    return write(stdout, &byte, 1);
    804002ba:	4441                	li	s0,16
    804002bc:	746000ef          	jal	ra,80400a02 <write>
        putchar(digits[x >> (sizeof(uint64) * 8 - 4)]);
    804002c0:	03ccd793          	srli	a5,s9,0x3c
    804002c4:	97d6                	add	a5,a5,s5
    char byte = c;
    804002c6:	0007c783          	lbu	a5,0(a5)
    804002ca:	347d                	addiw	s0,s0,-1
    return write(stdout, &byte, 1);
    804002cc:	4605                	li	a2,1
    804002ce:	080c                	addi	a1,sp,16
    804002d0:	4501                	li	a0,0
    char byte = c;
    804002d2:	00f10823          	sb	a5,16(sp)
    for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    804002d6:	0c92                	slli	s9,s9,0x4
    return write(stdout, &byte, 1);
    804002d8:	72a000ef          	jal	ra,80400a02 <write>
    for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    804002dc:	f075                	bnez	s0,804002c0 <printf+0x228>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    804002de:	00094303          	lbu	t1,0(s2)
    804002e2:	0003071b          	sext.w	a4,t1
    804002e6:	e00312e3          	bnez	t1,804000ea <printf+0x52>
    804002ea:	b5c9                	j	804001ac <printf+0x114>
    char byte = c;
    804002ec:	02500793          	li	a5,37
    return write(stdout, &byte, 1);
    804002f0:	4605                	li	a2,1
    804002f2:	080c                	addi	a1,sp,16
    804002f4:	4501                	li	a0,0
    char byte = c;
    804002f6:	00f10823          	sb	a5,16(sp)
    return write(stdout, &byte, 1);
    804002fa:	708000ef          	jal	ra,80400a02 <write>
    804002fe:	4605                	li	a2,1
    80400300:	080c                	addi	a1,sp,16
    80400302:	4501                	li	a0,0
    char byte = c;
    80400304:	00810823          	sb	s0,16(sp)
    return write(stdout, &byte, 1);
    80400308:	6fa000ef          	jal	ra,80400a02 <write>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    8040030c:	00094303          	lbu	t1,0(s2)
    80400310:	0003071b          	sext.w	a4,t1
    80400314:	dc031be3          	bnez	t1,804000ea <printf+0x52>
    80400318:	bd51                	j	804001ac <printf+0x114>
    return write(stdout, &byte, 1);
    8040031a:	4605                	li	a2,1
    8040031c:	080c                	addi	a1,sp,16
    8040031e:	4501                	li	a0,0
    char byte = c;
    80400320:	01410823          	sb	s4,16(sp)
    return write(stdout, &byte, 1);
    80400324:	6de000ef          	jal	ra,80400a02 <write>
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
    80400328:	00094303          	lbu	t1,0(s2)
    8040032c:	0003071b          	sext.w	a4,t1
    80400330:	da031de3          	bnez	t1,804000ea <printf+0x52>
    80400334:	bda5                	j	804001ac <printf+0x114>
        x = -xx;
    80400336:	40f007bb          	negw	a5,a5
        buf[i++] = digits[x % base];
    8040033a:	00f7f693          	andi	a3,a5,15
    8040033e:	96d6                	add	a3,a3,s5
    80400340:	0006c683          	lbu	a3,0(a3)
        x = -xx;
    80400344:	0ff7f413          	andi	s0,a5,255
    } while ((x /= base) != 0);
    80400348:	8011                	srli	s0,s0,0x4
        buf[i++] = digits[x % base];
    8040034a:	00d10823          	sb	a3,16(sp)
    } while ((x /= base) != 0);
    8040034e:	ea0416e3          	bnez	s0,804001fa <printf+0x162>
        buf[i++] = digits[x % base];
    80400352:	4405                	li	s0,1
    80400354:	bd65                	j	8040020c <printf+0x174>
                s = "(null)";
    80400356:	00001417          	auipc	s0,0x1
    8040035a:	7f240413          	addi	s0,s0,2034 # 80401b48 <main+0x10be>
                for (; *s; s++)
    8040035e:	02800793          	li	a5,40
    80400362:	bf01                	j	80400272 <printf+0x1da>
        buf[i++] = digits[x % base];
    80400364:	4785                	li	a5,1
    80400366:	b519                	j	8040016c <printf+0xd4>
    80400368:	4789                	li	a5,2
    8040036a:	4405                	li	s0,1
    8040036c:	b501                	j	8040016c <printf+0xd4>

000000008040036e <isspace>:
#define HIGHS      (ONES * (UCHAR_MAX / 2 + 1))
#define HASZERO(x) (((x)-ONES) & ~(x) & HIGHS)

int isspace(int c)
{
    return c == ' ' || (unsigned)c - '\t' < 5;
    8040036e:	02000793          	li	a5,32
    80400372:	00f50663          	beq	a0,a5,8040037e <isspace+0x10>
    80400376:	355d                	addiw	a0,a0,-9
    80400378:	00553513          	sltiu	a0,a0,5
    8040037c:	8082                	ret
    8040037e:	4505                	li	a0,1
}
    80400380:	8082                	ret

0000000080400382 <isdigit>:

int isdigit(int c)
{
    return (unsigned)c - '0' < 10;
    80400382:	fd05051b          	addiw	a0,a0,-48
}
    80400386:	00a53513          	sltiu	a0,a0,10
    8040038a:	8082                	ret

000000008040038c <atoi>:
    return c == ' ' || (unsigned)c - '\t' < 5;
    8040038c:	02000613          	li	a2,32
    80400390:	4591                	li	a1,4

int atoi(const char* s)
{
    int n = 0, neg = 0;
    while (isspace(*s))
    80400392:	00054703          	lbu	a4,0(a0)
    return c == ' ' || (unsigned)c - '\t' < 5;
    80400396:	ff77069b          	addiw	a3,a4,-9
    8040039a:	04c70d63          	beq	a4,a2,804003f4 <atoi+0x68>
    8040039e:	0007079b          	sext.w	a5,a4
    804003a2:	04d5f963          	bgeu	a1,a3,804003f4 <atoi+0x68>
        s++;
    switch (*s) {
    804003a6:	02b00693          	li	a3,43
    804003aa:	04d70a63          	beq	a4,a3,804003fe <atoi+0x72>
    804003ae:	02d00693          	li	a3,45
    804003b2:	06d70463          	beq	a4,a3,8040041a <atoi+0x8e>
        neg = 1;
    case '+':
        s++;
    }
    /* Compute n as a negative number to avoid overflow on INT_MIN */
    while (isdigit(*s))
    804003b6:	fd07859b          	addiw	a1,a5,-48
    804003ba:	4625                	li	a2,9
    804003bc:	873e                	mv	a4,a5
    804003be:	86aa                	mv	a3,a0
    int n = 0, neg = 0;
    804003c0:	4e01                	li	t3,0
    while (isdigit(*s))
    804003c2:	04b66a63          	bltu	a2,a1,80400416 <atoi+0x8a>
    int n = 0, neg = 0;
    804003c6:	4501                	li	a0,0
    while (isdigit(*s))
    804003c8:	4825                	li	a6,9
    804003ca:	0016c603          	lbu	a2,1(a3)
        n = 10 * n - (*s++ - '0');
    804003ce:	0025179b          	slliw	a5,a0,0x2
    804003d2:	9d3d                	addw	a0,a0,a5
    804003d4:	fd07031b          	addiw	t1,a4,-48
    804003d8:	0015189b          	slliw	a7,a0,0x1
    while (isdigit(*s))
    804003dc:	fd06059b          	addiw	a1,a2,-48
        n = 10 * n - (*s++ - '0');
    804003e0:	0685                	addi	a3,a3,1
    804003e2:	4068853b          	subw	a0,a7,t1
    while (isdigit(*s))
    804003e6:	0006071b          	sext.w	a4,a2
    804003ea:	feb870e3          	bgeu	a6,a1,804003ca <atoi+0x3e>
    return neg ? n : -n;
    804003ee:	000e0563          	beqz	t3,804003f8 <atoi+0x6c>
}
    804003f2:	8082                	ret
        s++;
    804003f4:	0505                	addi	a0,a0,1
    804003f6:	bf71                	j	80400392 <atoi+0x6>
    804003f8:	4113053b          	subw	a0,t1,a7
    804003fc:	8082                	ret
    while (isdigit(*s))
    804003fe:	00154783          	lbu	a5,1(a0)
    80400402:	4625                	li	a2,9
        s++;
    80400404:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    80400408:	fd07859b          	addiw	a1,a5,-48
    8040040c:	0007871b          	sext.w	a4,a5
    int n = 0, neg = 0;
    80400410:	4e01                	li	t3,0
    while (isdigit(*s))
    80400412:	fab67ae3          	bgeu	a2,a1,804003c6 <atoi+0x3a>
    80400416:	4501                	li	a0,0
}
    80400418:	8082                	ret
    while (isdigit(*s))
    8040041a:	00154783          	lbu	a5,1(a0)
    8040041e:	4625                	li	a2,9
        s++;
    80400420:	00150693          	addi	a3,a0,1
    while (isdigit(*s))
    80400424:	fd07859b          	addiw	a1,a5,-48
    80400428:	0007871b          	sext.w	a4,a5
    8040042c:	feb665e3          	bltu	a2,a1,80400416 <atoi+0x8a>
        neg = 1;
    80400430:	4e05                	li	t3,1
    80400432:	bf51                	j	804003c6 <atoi+0x3a>

0000000080400434 <memset>:

void* memset(void* dest, int c, size_t n)
{
    char* p = dest;
    for(int i = 0; i < n; ++i, *(p++) = c);
    80400434:	16060d63          	beqz	a2,804005ae <memset+0x17a>
    80400438:	40a007b3          	neg	a5,a0
    8040043c:	8b9d                	andi	a5,a5,7
    8040043e:	00778713          	addi	a4,a5,7
    80400442:	482d                	li	a6,11
    80400444:	0ff5f593          	andi	a1,a1,255
    80400448:	fff60693          	addi	a3,a2,-1
    8040044c:	17076263          	bltu	a4,a6,804005b0 <memset+0x17c>
    80400450:	16e6ea63          	bltu	a3,a4,804005c4 <memset+0x190>
    80400454:	16078563          	beqz	a5,804005be <memset+0x18a>
    80400458:	00b50023          	sb	a1,0(a0)
    8040045c:	4705                	li	a4,1
    8040045e:	00150e93          	addi	t4,a0,1
    80400462:	14e78c63          	beq	a5,a4,804005ba <memset+0x186>
    80400466:	00b500a3          	sb	a1,1(a0)
    8040046a:	4709                	li	a4,2
    8040046c:	00250e93          	addi	t4,a0,2
    80400470:	14e78d63          	beq	a5,a4,804005ca <memset+0x196>
    80400474:	00b50123          	sb	a1,2(a0)
    80400478:	470d                	li	a4,3
    8040047a:	00350e93          	addi	t4,a0,3
    8040047e:	12e78b63          	beq	a5,a4,804005b4 <memset+0x180>
    80400482:	00b501a3          	sb	a1,3(a0)
    80400486:	4711                	li	a4,4
    80400488:	00450e93          	addi	t4,a0,4
    8040048c:	14e78163          	beq	a5,a4,804005ce <memset+0x19a>
    80400490:	00b50223          	sb	a1,4(a0)
    80400494:	4715                	li	a4,5
    80400496:	00550e93          	addi	t4,a0,5
    8040049a:	12e78c63          	beq	a5,a4,804005d2 <memset+0x19e>
    8040049e:	00b502a3          	sb	a1,5(a0)
    804004a2:	471d                	li	a4,7
    804004a4:	00650e93          	addi	t4,a0,6
    804004a8:	12e79763          	bne	a5,a4,804005d6 <memset+0x1a2>
    804004ac:	00750e93          	addi	t4,a0,7
    804004b0:	00b50323          	sb	a1,6(a0)
    804004b4:	4f1d                	li	t5,7
    804004b6:	00859713          	slli	a4,a1,0x8
    804004ba:	8f4d                	or	a4,a4,a1
    804004bc:	01059e13          	slli	t3,a1,0x10
    804004c0:	01c76e33          	or	t3,a4,t3
    804004c4:	01859313          	slli	t1,a1,0x18
    804004c8:	006e6333          	or	t1,t3,t1
    804004cc:	02059893          	slli	a7,a1,0x20
    804004d0:	011368b3          	or	a7,t1,a7
    804004d4:	02859813          	slli	a6,a1,0x28
    804004d8:	40f60333          	sub	t1,a2,a5
    804004dc:	0108e833          	or	a6,a7,a6
    804004e0:	03059693          	slli	a3,a1,0x30
    804004e4:	00d866b3          	or	a3,a6,a3
    804004e8:	03859713          	slli	a4,a1,0x38
    804004ec:	97aa                	add	a5,a5,a0
    804004ee:	ff837813          	andi	a6,t1,-8
    804004f2:	8f55                	or	a4,a4,a3
    804004f4:	00f806b3          	add	a3,a6,a5
    804004f8:	e398                	sd	a4,0(a5)
    804004fa:	07a1                	addi	a5,a5,8
    804004fc:	fed79ee3          	bne	a5,a3,804004f8 <memset+0xc4>
    80400500:	ff837693          	andi	a3,t1,-8
    80400504:	00de87b3          	add	a5,t4,a3
    80400508:	01e6873b          	addw	a4,a3,t5
    8040050c:	0ad30663          	beq	t1,a3,804005b8 <memset+0x184>
    80400510:	00b78023          	sb	a1,0(a5)
    80400514:	0017069b          	addiw	a3,a4,1
    80400518:	08c6fb63          	bgeu	a3,a2,804005ae <memset+0x17a>
    8040051c:	00b780a3          	sb	a1,1(a5)
    80400520:	0027069b          	addiw	a3,a4,2
    80400524:	08c6f563          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400528:	00b78123          	sb	a1,2(a5)
    8040052c:	0037069b          	addiw	a3,a4,3
    80400530:	06c6ff63          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400534:	00b781a3          	sb	a1,3(a5)
    80400538:	0047069b          	addiw	a3,a4,4
    8040053c:	06c6f963          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400540:	00b78223          	sb	a1,4(a5)
    80400544:	0057069b          	addiw	a3,a4,5
    80400548:	06c6f363          	bgeu	a3,a2,804005ae <memset+0x17a>
    8040054c:	00b782a3          	sb	a1,5(a5)
    80400550:	0067069b          	addiw	a3,a4,6
    80400554:	04c6fd63          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400558:	00b78323          	sb	a1,6(a5)
    8040055c:	0077069b          	addiw	a3,a4,7
    80400560:	04c6f763          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400564:	00b783a3          	sb	a1,7(a5)
    80400568:	0087069b          	addiw	a3,a4,8
    8040056c:	04c6f163          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400570:	00b78423          	sb	a1,8(a5)
    80400574:	0097069b          	addiw	a3,a4,9
    80400578:	02c6fb63          	bgeu	a3,a2,804005ae <memset+0x17a>
    8040057c:	00b784a3          	sb	a1,9(a5)
    80400580:	00a7069b          	addiw	a3,a4,10
    80400584:	02c6f563          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400588:	00b78523          	sb	a1,10(a5)
    8040058c:	00b7069b          	addiw	a3,a4,11
    80400590:	00c6ff63          	bgeu	a3,a2,804005ae <memset+0x17a>
    80400594:	00b785a3          	sb	a1,11(a5)
    80400598:	00c7069b          	addiw	a3,a4,12
    8040059c:	00c6f963          	bgeu	a3,a2,804005ae <memset+0x17a>
    804005a0:	00b78623          	sb	a1,12(a5)
    804005a4:	2735                	addiw	a4,a4,13
    804005a6:	00c77463          	bgeu	a4,a2,804005ae <memset+0x17a>
    804005aa:	00b786a3          	sb	a1,13(a5)
    return dest;
}
    804005ae:	8082                	ret
    804005b0:	472d                	li	a4,11
    804005b2:	bd79                	j	80400450 <memset+0x1c>
    for(int i = 0; i < n; ++i, *(p++) = c);
    804005b4:	4f0d                	li	t5,3
    804005b6:	b701                	j	804004b6 <memset+0x82>
    804005b8:	8082                	ret
    804005ba:	4f05                	li	t5,1
    804005bc:	bded                	j	804004b6 <memset+0x82>
    804005be:	8eaa                	mv	t4,a0
    804005c0:	4f01                	li	t5,0
    804005c2:	bdd5                	j	804004b6 <memset+0x82>
    804005c4:	87aa                	mv	a5,a0
    804005c6:	4701                	li	a4,0
    804005c8:	b7a1                	j	80400510 <memset+0xdc>
    804005ca:	4f09                	li	t5,2
    804005cc:	b5ed                	j	804004b6 <memset+0x82>
    804005ce:	4f11                	li	t5,4
    804005d0:	b5dd                	j	804004b6 <memset+0x82>
    804005d2:	4f15                	li	t5,5
    804005d4:	b5cd                	j	804004b6 <memset+0x82>
    804005d6:	4f19                	li	t5,6
    804005d8:	bdf9                	j	804004b6 <memset+0x82>

00000000804005da <strcmp>:

int strcmp(const char* l, const char* r)
{
    for (; *l == *r && *l; l++, r++)
    804005da:	00054783          	lbu	a5,0(a0)
    804005de:	0005c703          	lbu	a4,0(a1)
    804005e2:	00e79863          	bne	a5,a4,804005f2 <strcmp+0x18>
    804005e6:	0505                	addi	a0,a0,1
    804005e8:	0585                	addi	a1,a1,1
    804005ea:	fbe5                	bnez	a5,804005da <strcmp>
    804005ec:	4501                	li	a0,0
        ;
    return *(unsigned char*)l - *(unsigned char*)r;
}
    804005ee:	9d19                	subw	a0,a0,a4
    804005f0:	8082                	ret
    804005f2:	0007851b          	sext.w	a0,a5
    804005f6:	bfe5                	j	804005ee <strcmp+0x14>

00000000804005f8 <strncmp>:

int strncmp(const char* _l, const char* _r, size_t n)
{
    const unsigned char *l = (void*)_l, *r = (void*)_r;
    if (!n--)
    804005f8:	ce05                	beqz	a2,80400630 <strncmp+0x38>
        return 0;
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    804005fa:	00054703          	lbu	a4,0(a0)
    804005fe:	0005c783          	lbu	a5,0(a1)
    80400602:	cb0d                	beqz	a4,80400634 <strncmp+0x3c>
    if (!n--)
    80400604:	167d                	addi	a2,a2,-1
    80400606:	00c506b3          	add	a3,a0,a2
    8040060a:	a819                	j	80400620 <strncmp+0x28>
    for (; *l && *r && n && *l == *r; l++, r++, n--)
    8040060c:	00a68e63          	beq	a3,a0,80400628 <strncmp+0x30>
    80400610:	0505                	addi	a0,a0,1
    80400612:	00e79b63          	bne	a5,a4,80400628 <strncmp+0x30>
    80400616:	00054703          	lbu	a4,0(a0)
    8040061a:	0005c783          	lbu	a5,0(a1)
    8040061e:	cb19                	beqz	a4,80400634 <strncmp+0x3c>
    80400620:	0005c783          	lbu	a5,0(a1)
    80400624:	0585                	addi	a1,a1,1
    80400626:	f3fd                	bnez	a5,8040060c <strncmp+0x14>
        ;
    return *l - *r;
    80400628:	0007051b          	sext.w	a0,a4
    8040062c:	9d1d                	subw	a0,a0,a5
    8040062e:	8082                	ret
        return 0;
    80400630:	4501                	li	a0,0
}
    80400632:	8082                	ret
    80400634:	4501                	li	a0,0
    return *l - *r;
    80400636:	9d1d                	subw	a0,a0,a5
    80400638:	8082                	ret

000000008040063a <strlen>:
size_t strlen(const char* s)
{
    const char* a = s;
    typedef size_t __attribute__((__may_alias__)) word;
    const word* w;
    for (; (uintptr_t)s % SS; s++)
    8040063a:	00757793          	andi	a5,a0,7
    8040063e:	cf89                	beqz	a5,80400658 <strlen+0x1e>
    80400640:	87aa                	mv	a5,a0
    80400642:	a029                	j	8040064c <strlen+0x12>
    80400644:	0785                	addi	a5,a5,1
    80400646:	0077f713          	andi	a4,a5,7
    8040064a:	cb01                	beqz	a4,8040065a <strlen+0x20>
        if (!*s)
    8040064c:	0007c703          	lbu	a4,0(a5)
    80400650:	fb75                	bnez	a4,80400644 <strlen+0xa>
    for (w = (const void*)s; !HASZERO(*w); w++)
        ;
    s = (const void*)w;
    for (; *s; s++)
        ;
    return s - a;
    80400652:	40a78533          	sub	a0,a5,a0
}
    80400656:	8082                	ret
    for (; (uintptr_t)s % SS; s++)
    80400658:	87aa                	mv	a5,a0
    for (w = (const void*)s; !HASZERO(*w); w++)
    8040065a:	6394                	ld	a3,0(a5)
    8040065c:	00001597          	auipc	a1,0x1
    80400660:	4f45b583          	ld	a1,1268(a1) # 80401b50 <main+0x10c6>
    80400664:	00001617          	auipc	a2,0x1
    80400668:	4f463603          	ld	a2,1268(a2) # 80401b58 <main+0x10ce>
    8040066c:	a019                	j	80400672 <strlen+0x38>
    8040066e:	6794                	ld	a3,8(a5)
    80400670:	07a1                	addi	a5,a5,8
    80400672:	00b68733          	add	a4,a3,a1
    80400676:	fff6c693          	not	a3,a3
    8040067a:	8f75                	and	a4,a4,a3
    8040067c:	8f71                	and	a4,a4,a2
    8040067e:	db65                	beqz	a4,8040066e <strlen+0x34>
    for (; *s; s++)
    80400680:	0007c703          	lbu	a4,0(a5)
    80400684:	d779                	beqz	a4,80400652 <strlen+0x18>
    80400686:	0017c703          	lbu	a4,1(a5)
    8040068a:	0785                	addi	a5,a5,1
    8040068c:	d379                	beqz	a4,80400652 <strlen+0x18>
    8040068e:	0017c703          	lbu	a4,1(a5)
    80400692:	0785                	addi	a5,a5,1
    80400694:	fb6d                	bnez	a4,80400686 <strlen+0x4c>
    80400696:	bf75                	j	80400652 <strlen+0x18>

0000000080400698 <memchr>:

void* memchr(const void* src, int c, size_t n)
{
    const unsigned char* s = src;
    c = (unsigned char)c;
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    80400698:	00757713          	andi	a4,a0,7
{
    8040069c:	87aa                	mv	a5,a0
    c = (unsigned char)c;
    8040069e:	0ff5f593          	andi	a1,a1,255
    for (; ((uintptr_t)s & ALIGN) && n && *s != c; s++, n--)
    804006a2:	cb19                	beqz	a4,804006b8 <memchr+0x20>
    804006a4:	ce25                	beqz	a2,8040071c <memchr+0x84>
    804006a6:	0007c703          	lbu	a4,0(a5)
    804006aa:	04b70e63          	beq	a4,a1,80400706 <memchr+0x6e>
    804006ae:	0785                	addi	a5,a5,1
    804006b0:	0077f713          	andi	a4,a5,7
    804006b4:	167d                	addi	a2,a2,-1
    804006b6:	f77d                	bnez	a4,804006a4 <memchr+0xc>
            ;
        s = (const void*)w;
    }
    for (; n && *s != c; s++, n--)
        ;
    return n ? (void*)s : 0;
    804006b8:	4501                	li	a0,0
    if (n && *s != c) {
    804006ba:	c235                	beqz	a2,8040071e <memchr+0x86>
    804006bc:	0007c703          	lbu	a4,0(a5)
    804006c0:	04b70363          	beq	a4,a1,80400706 <memchr+0x6e>
        size_t k = ONES * c;
    804006c4:	00001517          	auipc	a0,0x1
    804006c8:	49c53503          	ld	a0,1180(a0) # 80401b60 <main+0x10d6>
        for (w = (const void*)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    804006cc:	471d                	li	a4,7
        size_t k = ONES * c;
    804006ce:	02a58533          	mul	a0,a1,a0
        for (w = (const void*)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    804006d2:	02c77a63          	bgeu	a4,a2,80400706 <memchr+0x6e>
    804006d6:	00001897          	auipc	a7,0x1
    804006da:	47a8b883          	ld	a7,1146(a7) # 80401b50 <main+0x10c6>
    804006de:	00001817          	auipc	a6,0x1
    804006e2:	47a83803          	ld	a6,1146(a6) # 80401b58 <main+0x10ce>
    804006e6:	431d                	li	t1,7
    804006e8:	a029                	j	804006f2 <memchr+0x5a>
    804006ea:	1661                	addi	a2,a2,-8
    804006ec:	07a1                	addi	a5,a5,8
    804006ee:	02c37963          	bgeu	t1,a2,80400720 <memchr+0x88>
    804006f2:	6398                	ld	a4,0(a5)
    804006f4:	8f29                	xor	a4,a4,a0
    804006f6:	011706b3          	add	a3,a4,a7
    804006fa:	fff74713          	not	a4,a4
    804006fe:	8f75                	and	a4,a4,a3
    80400700:	01077733          	and	a4,a4,a6
    80400704:	d37d                	beqz	a4,804006ea <memchr+0x52>
    80400706:	853e                	mv	a0,a5
    80400708:	97b2                	add	a5,a5,a2
    8040070a:	a021                	j	80400712 <memchr+0x7a>
    for (; n && *s != c; s++, n--)
    8040070c:	0505                	addi	a0,a0,1
    8040070e:	00f50763          	beq	a0,a5,8040071c <memchr+0x84>
    80400712:	00054703          	lbu	a4,0(a0)
    80400716:	feb71be3          	bne	a4,a1,8040070c <memchr+0x74>
    8040071a:	8082                	ret
    return n ? (void*)s : 0;
    8040071c:	4501                	li	a0,0
}
    8040071e:	8082                	ret
    return n ? (void*)s : 0;
    80400720:	4501                	li	a0,0
    for (; n && *s != c; s++, n--)
    80400722:	f275                	bnez	a2,80400706 <memchr+0x6e>
}
    80400724:	8082                	ret

0000000080400726 <strnlen>:

size_t strnlen(const char* s, size_t n)
{
    80400726:	1101                	addi	sp,sp,-32
    80400728:	e822                	sd	s0,16(sp)
    const char* p = memchr(s, 0, n);
    8040072a:	862e                	mv	a2,a1
{
    8040072c:	842e                	mv	s0,a1
    const char* p = memchr(s, 0, n);
    8040072e:	4581                	li	a1,0
{
    80400730:	e426                	sd	s1,8(sp)
    80400732:	ec06                	sd	ra,24(sp)
    80400734:	84aa                	mv	s1,a0
    const char* p = memchr(s, 0, n);
    80400736:	f63ff0ef          	jal	ra,80400698 <memchr>
    return p ? p - s : n;
    8040073a:	c519                	beqz	a0,80400748 <strnlen+0x22>
}
    8040073c:	60e2                	ld	ra,24(sp)
    8040073e:	6442                	ld	s0,16(sp)
    return p ? p - s : n;
    80400740:	8d05                	sub	a0,a0,s1
}
    80400742:	64a2                	ld	s1,8(sp)
    80400744:	6105                	addi	sp,sp,32
    80400746:	8082                	ret
    80400748:	60e2                	ld	ra,24(sp)
    return p ? p - s : n;
    8040074a:	8522                	mv	a0,s0
}
    8040074c:	6442                	ld	s0,16(sp)
    8040074e:	64a2                	ld	s1,8(sp)
    80400750:	6105                	addi	sp,sp,32
    80400752:	8082                	ret

0000000080400754 <stpcpy>:
char* stpcpy(char* restrict d, const char* s)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word* wd;
    const word* ws;
    if ((uintptr_t)s % SS == (uintptr_t)d % SS) {
    80400754:	00b547b3          	xor	a5,a0,a1
    80400758:	8b9d                	andi	a5,a5,7
    8040075a:	eb95                	bnez	a5,8040078e <stpcpy+0x3a>
        for (; (uintptr_t)s % SS; s++, d++)
    8040075c:	0075f793          	andi	a5,a1,7
    80400760:	e7b1                	bnez	a5,804007ac <stpcpy+0x58>
            if (!(*d = *s))
                return d;
        wd = (void*)d;
        ws = (const void*)s;
        for (; !HASZERO(*ws); *wd++ = *ws++)
    80400762:	6198                	ld	a4,0(a1)
    80400764:	00001617          	auipc	a2,0x1
    80400768:	3ec63603          	ld	a2,1004(a2) # 80401b50 <main+0x10c6>
    8040076c:	00001817          	auipc	a6,0x1
    80400770:	3ec83803          	ld	a6,1004(a6) # 80401b58 <main+0x10ce>
    80400774:	a029                	j	8040077e <stpcpy+0x2a>
    80400776:	e118                	sd	a4,0(a0)
    80400778:	6598                	ld	a4,8(a1)
    8040077a:	05a1                	addi	a1,a1,8
    8040077c:	0521                	addi	a0,a0,8
    8040077e:	00c707b3          	add	a5,a4,a2
    80400782:	fff74693          	not	a3,a4
    80400786:	8ff5                	and	a5,a5,a3
    80400788:	0107f7b3          	and	a5,a5,a6
    8040078c:	d7ed                	beqz	a5,80400776 <stpcpy+0x22>
            ;
        d = (void*)wd;
        s = (const void*)ws;
    }
    for (; (*d = *s); s++, d++)
    8040078e:	0005c783          	lbu	a5,0(a1)
    80400792:	00f50023          	sb	a5,0(a0)
    80400796:	c785                	beqz	a5,804007be <stpcpy+0x6a>
    80400798:	0015c783          	lbu	a5,1(a1)
    8040079c:	0505                	addi	a0,a0,1
    8040079e:	0585                	addi	a1,a1,1
    804007a0:	00f50023          	sb	a5,0(a0)
    804007a4:	fbf5                	bnez	a5,80400798 <stpcpy+0x44>
        ;
    return d;
}
    804007a6:	8082                	ret
        for (; (uintptr_t)s % SS; s++, d++)
    804007a8:	0505                	addi	a0,a0,1
    804007aa:	df45                	beqz	a4,80400762 <stpcpy+0xe>
            if (!(*d = *s))
    804007ac:	0005c783          	lbu	a5,0(a1)
        for (; (uintptr_t)s % SS; s++, d++)
    804007b0:	0585                	addi	a1,a1,1
    804007b2:	0075f713          	andi	a4,a1,7
            if (!(*d = *s))
    804007b6:	00f50023          	sb	a5,0(a0)
    804007ba:	f7fd                	bnez	a5,804007a8 <stpcpy+0x54>
}
    804007bc:	8082                	ret
    804007be:	8082                	ret

00000000804007c0 <stpncpy>:
char* stpncpy(char* restrict d, const char* s, size_t n)
{
    typedef size_t __attribute__((__may_alias__)) word;
    word* wd;
    const word* ws;
    if (((uintptr_t)s & ALIGN) == ((uintptr_t)d & ALIGN)) {
    804007c0:	00b547b3          	xor	a5,a0,a1
    804007c4:	8b9d                	andi	a5,a5,7
    804007c6:	1a079863          	bnez	a5,80400976 <stpncpy+0x1b6>
        for (; ((uintptr_t)s & ALIGN) && n && (*d = *s); n--, s++, d++)
    804007ca:	0075f793          	andi	a5,a1,7
    804007ce:	16078463          	beqz	a5,80400936 <stpncpy+0x176>
    804007d2:	ea01                	bnez	a2,804007e2 <stpncpy+0x22>
    804007d4:	a421                	j	804009dc <stpncpy+0x21c>
    804007d6:	167d                	addi	a2,a2,-1
    804007d8:	0505                	addi	a0,a0,1
    804007da:	14070e63          	beqz	a4,80400936 <stpncpy+0x176>
    804007de:	1a060863          	beqz	a2,8040098e <stpncpy+0x1ce>
    804007e2:	0005c783          	lbu	a5,0(a1)
    804007e6:	0585                	addi	a1,a1,1
    804007e8:	0075f713          	andi	a4,a1,7
    804007ec:	00f50023          	sb	a5,0(a0)
    804007f0:	f3fd                	bnez	a5,804007d6 <stpncpy+0x16>
    804007f2:	4805                	li	a6,1
    804007f4:	1a061863          	bnez	a2,804009a4 <stpncpy+0x1e4>
    804007f8:	40a007b3          	neg	a5,a0
    804007fc:	8b9d                	andi	a5,a5,7
    804007fe:	4681                	li	a3,0
    80400800:	18061a63          	bnez	a2,80400994 <stpncpy+0x1d4>
    80400804:	00778713          	addi	a4,a5,7
    80400808:	45ad                	li	a1,11
    8040080a:	18b76363          	bltu	a4,a1,80400990 <stpncpy+0x1d0>
    8040080e:	1ae6eb63          	bltu	a3,a4,804009c4 <stpncpy+0x204>
    80400812:	1a078363          	beqz	a5,804009b8 <stpncpy+0x1f8>
    for(int i = 0; i < n; ++i, *(p++) = c);
    80400816:	00050023          	sb	zero,0(a0)
    8040081a:	4685                	li	a3,1
    8040081c:	00150713          	addi	a4,a0,1
    80400820:	18d78f63          	beq	a5,a3,804009be <stpncpy+0x1fe>
    80400824:	000500a3          	sb	zero,1(a0)
    80400828:	4689                	li	a3,2
    8040082a:	00250713          	addi	a4,a0,2
    8040082e:	18d78e63          	beq	a5,a3,804009ca <stpncpy+0x20a>
    80400832:	00050123          	sb	zero,2(a0)
    80400836:	468d                	li	a3,3
    80400838:	00350713          	addi	a4,a0,3
    8040083c:	16d78c63          	beq	a5,a3,804009b4 <stpncpy+0x1f4>
    80400840:	000501a3          	sb	zero,3(a0)
    80400844:	4691                	li	a3,4
    80400846:	00450713          	addi	a4,a0,4
    8040084a:	18d78263          	beq	a5,a3,804009ce <stpncpy+0x20e>
    8040084e:	00050223          	sb	zero,4(a0)
    80400852:	4695                	li	a3,5
    80400854:	00550713          	addi	a4,a0,5
    80400858:	16d78d63          	beq	a5,a3,804009d2 <stpncpy+0x212>
    8040085c:	000502a3          	sb	zero,5(a0)
    80400860:	469d                	li	a3,7
    80400862:	00650713          	addi	a4,a0,6
    80400866:	16d79863          	bne	a5,a3,804009d6 <stpncpy+0x216>
    8040086a:	00750713          	addi	a4,a0,7
    8040086e:	00050323          	sb	zero,6(a0)
    80400872:	40f80833          	sub	a6,a6,a5
    80400876:	ff887593          	andi	a1,a6,-8
    8040087a:	97aa                	add	a5,a5,a0
    8040087c:	95be                	add	a1,a1,a5
    8040087e:	0007b023          	sd	zero,0(a5)
    80400882:	07a1                	addi	a5,a5,8
    80400884:	feb79de3          	bne	a5,a1,8040087e <stpncpy+0xbe>
    80400888:	ff887593          	andi	a1,a6,-8
    8040088c:	9ead                	addw	a3,a3,a1
    8040088e:	00b707b3          	add	a5,a4,a1
    80400892:	12b80863          	beq	a6,a1,804009c2 <stpncpy+0x202>
    80400896:	00078023          	sb	zero,0(a5)
    8040089a:	0016871b          	addiw	a4,a3,1
    8040089e:	0ec77863          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008a2:	000780a3          	sb	zero,1(a5)
    804008a6:	0026871b          	addiw	a4,a3,2
    804008aa:	0ec77263          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008ae:	00078123          	sb	zero,2(a5)
    804008b2:	0036871b          	addiw	a4,a3,3
    804008b6:	0cc77c63          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008ba:	000781a3          	sb	zero,3(a5)
    804008be:	0046871b          	addiw	a4,a3,4
    804008c2:	0cc77663          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008c6:	00078223          	sb	zero,4(a5)
    804008ca:	0056871b          	addiw	a4,a3,5
    804008ce:	0cc77063          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008d2:	000782a3          	sb	zero,5(a5)
    804008d6:	0066871b          	addiw	a4,a3,6
    804008da:	0ac77a63          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008de:	00078323          	sb	zero,6(a5)
    804008e2:	0076871b          	addiw	a4,a3,7
    804008e6:	0ac77463          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008ea:	000783a3          	sb	zero,7(a5)
    804008ee:	0086871b          	addiw	a4,a3,8
    804008f2:	08c77e63          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    804008f6:	00078423          	sb	zero,8(a5)
    804008fa:	0096871b          	addiw	a4,a3,9
    804008fe:	08c77863          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    80400902:	000784a3          	sb	zero,9(a5)
    80400906:	00a6871b          	addiw	a4,a3,10
    8040090a:	08c77263          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    8040090e:	00078523          	sb	zero,10(a5)
    80400912:	00b6871b          	addiw	a4,a3,11
    80400916:	06c77c63          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    8040091a:	000785a3          	sb	zero,11(a5)
    8040091e:	00c6871b          	addiw	a4,a3,12
    80400922:	06c77663          	bgeu	a4,a2,8040098e <stpncpy+0x1ce>
    80400926:	00078623          	sb	zero,12(a5)
    8040092a:	26b5                	addiw	a3,a3,13
    8040092c:	06c6f163          	bgeu	a3,a2,8040098e <stpncpy+0x1ce>
    80400930:	000786a3          	sb	zero,13(a5)
    80400934:	8082                	ret
            ;
        if (!n || !*s)
    80400936:	c645                	beqz	a2,804009de <stpncpy+0x21e>
    80400938:	0005c783          	lbu	a5,0(a1)
    8040093c:	ea078be3          	beqz	a5,804007f2 <stpncpy+0x32>
            goto tail;
        wd = (void*)d;
        ws = (const void*)s;
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    80400940:	479d                	li	a5,7
    80400942:	02c7ff63          	bgeu	a5,a2,80400980 <stpncpy+0x1c0>
    80400946:	00001897          	auipc	a7,0x1
    8040094a:	20a8b883          	ld	a7,522(a7) # 80401b50 <main+0x10c6>
    8040094e:	00001817          	auipc	a6,0x1
    80400952:	20a83803          	ld	a6,522(a6) # 80401b58 <main+0x10ce>
    80400956:	431d                	li	t1,7
    80400958:	6198                	ld	a4,0(a1)
    8040095a:	011707b3          	add	a5,a4,a7
    8040095e:	fff74693          	not	a3,a4
    80400962:	8ff5                	and	a5,a5,a3
    80400964:	0107f7b3          	and	a5,a5,a6
    80400968:	ef81                	bnez	a5,80400980 <stpncpy+0x1c0>
            *wd = *ws;
    8040096a:	e118                	sd	a4,0(a0)
        for (; n >= sizeof(size_t) && !HASZERO(*ws); n -= sizeof(size_t), ws++, wd++)
    8040096c:	1661                	addi	a2,a2,-8
    8040096e:	05a1                	addi	a1,a1,8
    80400970:	0521                	addi	a0,a0,8
    80400972:	fec363e3          	bltu	t1,a2,80400958 <stpncpy+0x198>
        d = (void*)wd;
        s = (const void*)ws;
    }
    for (; n && (*d = *s); n--, s++, d++)
    80400976:	e609                	bnez	a2,80400980 <stpncpy+0x1c0>
    80400978:	a08d                	j	804009da <stpncpy+0x21a>
    8040097a:	167d                	addi	a2,a2,-1
    8040097c:	0505                	addi	a0,a0,1
    8040097e:	ca01                	beqz	a2,8040098e <stpncpy+0x1ce>
    80400980:	0005c783          	lbu	a5,0(a1)
    80400984:	0585                	addi	a1,a1,1
    80400986:	00f50023          	sb	a5,0(a0)
    8040098a:	fbe5                	bnez	a5,8040097a <stpncpy+0x1ba>
        ;
tail:
    8040098c:	b59d                	j	804007f2 <stpncpy+0x32>
    memset(d, 0, n);
    return d;
    8040098e:	8082                	ret
    80400990:	472d                	li	a4,11
    80400992:	bdb5                	j	8040080e <stpncpy+0x4e>
    80400994:	00778713          	addi	a4,a5,7
    80400998:	45ad                	li	a1,11
    8040099a:	fff60693          	addi	a3,a2,-1
    8040099e:	e6b778e3          	bgeu	a4,a1,8040080e <stpncpy+0x4e>
    804009a2:	b7fd                	j	80400990 <stpncpy+0x1d0>
    804009a4:	40a007b3          	neg	a5,a0
    804009a8:	8832                	mv	a6,a2
    804009aa:	8b9d                	andi	a5,a5,7
    804009ac:	4681                	li	a3,0
    804009ae:	e4060be3          	beqz	a2,80400804 <stpncpy+0x44>
    804009b2:	b7cd                	j	80400994 <stpncpy+0x1d4>
    for(int i = 0; i < n; ++i, *(p++) = c);
    804009b4:	468d                	li	a3,3
    804009b6:	bd75                	j	80400872 <stpncpy+0xb2>
    804009b8:	872a                	mv	a4,a0
    804009ba:	4681                	li	a3,0
    804009bc:	bd5d                	j	80400872 <stpncpy+0xb2>
    804009be:	4685                	li	a3,1
    804009c0:	bd4d                	j	80400872 <stpncpy+0xb2>
    804009c2:	8082                	ret
    804009c4:	87aa                	mv	a5,a0
    804009c6:	4681                	li	a3,0
    804009c8:	b5f9                	j	80400896 <stpncpy+0xd6>
    804009ca:	4689                	li	a3,2
    804009cc:	b55d                	j	80400872 <stpncpy+0xb2>
    804009ce:	4691                	li	a3,4
    804009d0:	b54d                	j	80400872 <stpncpy+0xb2>
    804009d2:	4695                	li	a3,5
    804009d4:	bd79                	j	80400872 <stpncpy+0xb2>
    804009d6:	4699                	li	a3,6
    804009d8:	bd69                	j	80400872 <stpncpy+0xb2>
    804009da:	8082                	ret
    804009dc:	8082                	ret
    804009de:	8082                	ret

00000000804009e0 <open>:
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
}

static inline long __syscall3(long n, long a, long b, long c)
{
    register long a7 __asm__("a7") = n;
    804009e0:	03800893          	li	a7,56
    register long a0 __asm__("a0") = a;
    register long a1 __asm__("a1") = b;
    register long a2 __asm__("a2") = c;
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    804009e4:	00000073          	ecall

#include "syscall.h"

int open(const char *path, int flags, int mode) {
    return syscall(SYS_openat, path, flags, mode);
}
    804009e8:	2501                	sext.w	a0,a0
    804009ea:	8082                	ret

00000000804009ec <close>:
    register long a7 __asm__("a7") = n;
    804009ec:	03900893          	li	a7,57
    __asm_syscall("r"(a7), "0"(a0))
    804009f0:	00000073          	ecall

int close(int fd) {
    return syscall(SYS_close, fd);
}
    804009f4:	2501                	sext.w	a0,a0
    804009f6:	8082                	ret

00000000804009f8 <read>:
    register long a7 __asm__("a7") = n;
    804009f8:	03f00893          	li	a7,63
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    804009fc:	00000073          	ecall

ssize_t read(int fd, void *buf, size_t len) {
    return syscall(SYS_read, fd, buf, len);
}
    80400a00:	8082                	ret

0000000080400a02 <write>:
    register long a7 __asm__("a7") = n;
    80400a02:	04000893          	li	a7,64
    __asm_syscall("r"(a7), "0"(a0), "r"(a1), "r"(a2))
    80400a06:	00000073          	ecall

ssize_t write(int fd, const void *buf, size_t len) {
    return syscall(SYS_write, fd, buf, len);
}
    80400a0a:	8082                	ret

0000000080400a0c <getpid>:
    register long a7 __asm__("a7") = n;
    80400a0c:	0ac00893          	li	a7,172
    __asm_syscall("r"(a7))
    80400a10:	00000073          	ecall

int getpid(void) {
    return syscall(SYS_getpid);
}
    80400a14:	2501                	sext.w	a0,a0
    80400a16:	8082                	ret

0000000080400a18 <sched_yield>:
    register long a7 __asm__("a7") = n;
    80400a18:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    80400a1c:	00000073          	ecall

int sched_yield(void) {
    return syscall(SYS_sched_yield);
}
    80400a20:	2501                	sext.w	a0,a0
    80400a22:	8082                	ret

0000000080400a24 <fork>:
    register long a7 __asm__("a7") = n;
    80400a24:	0dc00893          	li	a7,220
    __asm_syscall("r"(a7))
    80400a28:	00000073          	ecall

int fork(void) {
    return syscall(SYS_clone);
}
    80400a2c:	2501                	sext.w	a0,a0
    80400a2e:	8082                	ret

0000000080400a30 <exit>:
    register long a7 __asm__("a7") = n;
    80400a30:	05d00893          	li	a7,93
    __asm_syscall("r"(a7), "0"(a0))
    80400a34:	00000073          	ecall

void exit(int code) {
    syscall(SYS_exit, code);
}
    80400a38:	8082                	ret

0000000080400a3a <wait>:
    register long a7 __asm__("a7") = n;
    80400a3a:	10400893          	li	a7,260
    __asm_syscall("r"(a7), "0"(a0), "r"(a1))
    80400a3e:	00000073          	ecall

int wait(int pid, int* code) {
    return syscall(SYS_wait4, pid, code);
}
    80400a42:	2501                	sext.w	a0,a0
    80400a44:	8082                	ret

0000000080400a46 <exec>:
    register long a7 __asm__("a7") = n;
    80400a46:	0dd00893          	li	a7,221
    __asm_syscall("r"(a7), "0"(a0))
    80400a4a:	00000073          	ecall

int exec(char* name) {
    return syscall(SYS_execve, name);
}
    80400a4e:	2501                	sext.w	a0,a0
    80400a50:	8082                	ret

0000000080400a52 <get_time>:
    register long a7 __asm__("a7") = n;
    80400a52:	09900893          	li	a7,153
    __asm_syscall("r"(a7))
    80400a56:	00000073          	ecall

uint64 get_time() {
    return syscall(SYS_times);
}
    80400a5a:	8082                	ret

0000000080400a5c <sleep>:

int sleep(unsigned long long time) {
    80400a5c:	872a                	mv	a4,a0
    register long a7 __asm__("a7") = n;
    80400a5e:	09900893          	li	a7,153
    __asm_syscall("r"(a7))
    80400a62:	00000073          	ecall
    80400a66:	87aa                	mv	a5,a0
    80400a68:	00000073          	ecall
    unsigned long long s = get_time();
    while(get_time() < s + time) {
    80400a6c:	97ba                	add	a5,a5,a4
    80400a6e:	00f57c63          	bgeu	a0,a5,80400a86 <sleep+0x2a>
    register long a7 __asm__("a7") = n;
    80400a72:	07c00893          	li	a7,124
    __asm_syscall("r"(a7))
    80400a76:	00000073          	ecall
    register long a7 __asm__("a7") = n;
    80400a7a:	09900893          	li	a7,153
    __asm_syscall("r"(a7))
    80400a7e:	00000073          	ecall
    80400a82:	fef568e3          	bltu	a0,a5,80400a72 <sleep+0x16>
        sched_yield();
    }
    return 0;
    80400a86:	4501                	li	a0,0
    80400a88:	8082                	ret

Disassembly of section .text.startup:

0000000080400a8a <main>:
#include <stdio.h>
#include <unistd.h>

int main() {
    80400a8a:	c6010113          	addi	sp,sp,-928
    80400a8e:	38813823          	sd	s0,912(sp)
    80400a92:	38113c23          	sd	ra,920(sp)
    80400a96:	38913423          	sd	s1,904(sp)
    80400a9a:	39213023          	sd	s2,896(sp)
    80400a9e:	37313c23          	sd	s3,888(sp)
    80400aa2:	37413823          	sd	s4,880(sp)
    80400aa6:	37513423          	sd	s5,872(sp)
    80400aaa:	37613023          	sd	s6,864(sp)
    80400aae:	35713c23          	sd	s7,856(sp)
    80400ab2:	35813823          	sd	s8,848(sp)
    80400ab6:	35913423          	sd	s9,840(sp)
    80400aba:	35a13023          	sd	s10,832(sp)
    80400abe:	33b13c23          	sd	s11,824(sp)
    80400ac2:	1700                	addi	s0,sp,928
    const int MATSIZE = 10;
    int mata[MATSIZE][MATSIZE];
    80400ac4:	7165                	addi	sp,sp,-400
    80400ac6:	878a                	mv	a5,sp
    int matb[MATSIZE][MATSIZE];
    80400ac8:	7165                	addi	sp,sp,-400
    80400aca:	870a                	mv	a4,sp
    int matc[MATSIZE][MATSIZE];
    80400acc:	00e7e6b3          	or	a3,a5,a4
    80400ad0:	7165                	addi	sp,sp,-400
    80400ad2:	8a9d                	andi	a3,a3,7
    80400ad4:	838a                	mv	t2,sp
    int i, j, k, size = MATSIZE;
    for (i = 0; i < size; i ++) {
    80400ad6:	5a069be3          	bnez	a3,8040188c <main+0xe02>
        for (j = 0; j < size; j ++) {
            mata[i][j] = matb[i][j] = 1;
    80400ada:	4685                	li	a3,1
    80400adc:	1682                	slli	a3,a3,0x20
    80400ade:	0685                	addi	a3,a3,1
    80400ae0:	e314                	sd	a3,0(a4)
    80400ae2:	e714                	sd	a3,8(a4)
    80400ae4:	eb14                	sd	a3,16(a4)
    80400ae6:	ef14                	sd	a3,24(a4)
    80400ae8:	f314                	sd	a3,32(a4)
    80400aea:	e394                	sd	a3,0(a5)
    80400aec:	e794                	sd	a3,8(a5)
    80400aee:	eb94                	sd	a3,16(a5)
    80400af0:	ef94                	sd	a3,24(a5)
    80400af2:	f394                	sd	a3,32(a5)
    80400af4:	f714                	sd	a3,40(a4)
    80400af6:	fb14                	sd	a3,48(a4)
    80400af8:	ff14                	sd	a3,56(a4)
    80400afa:	e334                	sd	a3,64(a4)
    80400afc:	e734                	sd	a3,72(a4)
    80400afe:	f794                	sd	a3,40(a5)
    80400b00:	fb94                	sd	a3,48(a5)
    80400b02:	ff94                	sd	a3,56(a5)
    80400b04:	e3b4                	sd	a3,64(a5)
    80400b06:	e7b4                	sd	a3,72(a5)
    80400b08:	eb34                	sd	a3,80(a4)
    80400b0a:	ef34                	sd	a3,88(a4)
    80400b0c:	f334                	sd	a3,96(a4)
    80400b0e:	f734                	sd	a3,104(a4)
    80400b10:	fb34                	sd	a3,112(a4)
    80400b12:	ebb4                	sd	a3,80(a5)
    80400b14:	efb4                	sd	a3,88(a5)
    80400b16:	f3b4                	sd	a3,96(a5)
    80400b18:	f7b4                	sd	a3,104(a5)
    80400b1a:	fbb4                	sd	a3,112(a5)
    80400b1c:	ff34                	sd	a3,120(a4)
    80400b1e:	e354                	sd	a3,128(a4)
    80400b20:	e754                	sd	a3,136(a4)
    80400b22:	eb54                	sd	a3,144(a4)
    80400b24:	ef54                	sd	a3,152(a4)
    80400b26:	ffb4                	sd	a3,120(a5)
    80400b28:	e3d4                	sd	a3,128(a5)
    80400b2a:	e7d4                	sd	a3,136(a5)
    80400b2c:	ebd4                	sd	a3,144(a5)
    80400b2e:	efd4                	sd	a3,152(a5)
    80400b30:	f354                	sd	a3,160(a4)
    80400b32:	f754                	sd	a3,168(a4)
    80400b34:	fb54                	sd	a3,176(a4)
    80400b36:	ff54                	sd	a3,184(a4)
    80400b38:	e374                	sd	a3,192(a4)
    80400b3a:	f3d4                	sd	a3,160(a5)
    80400b3c:	f7d4                	sd	a3,168(a5)
    80400b3e:	fbd4                	sd	a3,176(a5)
    80400b40:	ffd4                	sd	a3,184(a5)
    80400b42:	e3f4                	sd	a3,192(a5)
    80400b44:	e774                	sd	a3,200(a4)
    80400b46:	eb74                	sd	a3,208(a4)
    80400b48:	ef74                	sd	a3,216(a4)
    80400b4a:	f374                	sd	a3,224(a4)
    80400b4c:	f774                	sd	a3,232(a4)
    80400b4e:	e7f4                	sd	a3,200(a5)
    80400b50:	ebf4                	sd	a3,208(a5)
    80400b52:	eff4                	sd	a3,216(a5)
    80400b54:	f3f4                	sd	a3,224(a5)
    80400b56:	f7f4                	sd	a3,232(a5)
    80400b58:	fb74                	sd	a3,240(a4)
    80400b5a:	ff74                	sd	a3,248(a4)
    80400b5c:	10d73023          	sd	a3,256(a4)
    80400b60:	10d73423          	sd	a3,264(a4)
    80400b64:	10d73823          	sd	a3,272(a4)
    80400b68:	fbf4                	sd	a3,240(a5)
    80400b6a:	fff4                	sd	a3,248(a5)
    80400b6c:	10d7b023          	sd	a3,256(a5)
    80400b70:	10d7b423          	sd	a3,264(a5)
    80400b74:	10d7b823          	sd	a3,272(a5)
    80400b78:	10d73c23          	sd	a3,280(a4)
    80400b7c:	12d73023          	sd	a3,288(a4)
    80400b80:	12d73423          	sd	a3,296(a4)
    80400b84:	12d73823          	sd	a3,304(a4)
    80400b88:	12d73c23          	sd	a3,312(a4)
    80400b8c:	10d7bc23          	sd	a3,280(a5)
    80400b90:	12d7b023          	sd	a3,288(a5)
    80400b94:	12d7b423          	sd	a3,296(a5)
    80400b98:	12d7b823          	sd	a3,304(a5)
    80400b9c:	12d7bc23          	sd	a3,312(a5)
    80400ba0:	14d73023          	sd	a3,320(a4)
    80400ba4:	14d73423          	sd	a3,328(a4)
    80400ba8:	14d73823          	sd	a3,336(a4)
    80400bac:	14d73c23          	sd	a3,344(a4)
    80400bb0:	16d73023          	sd	a3,352(a4)
    80400bb4:	14d7b023          	sd	a3,320(a5)
    80400bb8:	14d7b423          	sd	a3,328(a5)
    80400bbc:	14d7b823          	sd	a3,336(a5)
    80400bc0:	14d7bc23          	sd	a3,344(a5)
    80400bc4:	16d7b023          	sd	a3,352(a5)
    80400bc8:	16d73423          	sd	a3,360(a4)
    80400bcc:	16d73823          	sd	a3,368(a4)
    80400bd0:	16d73c23          	sd	a3,376(a4)
    80400bd4:	18d73023          	sd	a3,384(a4)
    80400bd8:	18d73423          	sd	a3,392(a4)
    80400bdc:	16d7b423          	sd	a3,360(a5)
    80400be0:	16d7b823          	sd	a3,368(a5)
    80400be4:	16d7bc23          	sd	a3,376(a5)
    80400be8:	18d7b023          	sd	a3,384(a5)
    80400bec:	18d7b423          	sd	a3,392(a5)
    for (i = 0; i < size; i ++) {
    80400bf0:	5f34                	lw	a3,120(a4)
    80400bf2:	00072c83          	lw	s9,0(a4)
    80400bf6:	02872c03          	lw	s8,40(a4)
    80400bfa:	ded43423          	sd	a3,-536(s0)
    80400bfe:	0a072683          	lw	a3,160(a4)
    80400c02:	05072b83          	lw	s7,80(a4)
    80400c06:	dad43823          	sd	a3,-592(s0)
    80400c0a:	0c872683          	lw	a3,200(a4)
    80400c0e:	d6d43c23          	sd	a3,-648(s0)
    80400c12:	0f072683          	lw	a3,240(a4)
    80400c16:	ead43423          	sd	a3,-344(s0)
    80400c1a:	11872683          	lw	a3,280(a4)
    80400c1e:	d2d43023          	sd	a3,-736(s0)
    80400c22:	14072683          	lw	a3,320(a4)
    80400c26:	ced43423          	sd	a3,-792(s0)
    80400c2a:	16872683          	lw	a3,360(a4)
    80400c2e:	cad43823          	sd	a3,-848(s0)
    80400c32:	4354                	lw	a3,4(a4)
    80400c34:	ead43023          	sd	a3,-352(s0)
    80400c38:	5754                	lw	a3,44(a4)
    80400c3a:	e6d43023          	sd	a3,-416(s0)
    80400c3e:	4b74                	lw	a3,84(a4)
    80400c40:	e2d43023          	sd	a3,-480(s0)
    80400c44:	5f74                	lw	a3,124(a4)
    80400c46:	ded43023          	sd	a3,-544(s0)
    80400c4a:	0a472683          	lw	a3,164(a4)
    80400c4e:	dad43423          	sd	a3,-600(s0)
    80400c52:	0cc72683          	lw	a3,204(a4)
    80400c56:	d6d43823          	sd	a3,-656(s0)
    80400c5a:	0f472683          	lw	a3,244(a4)
    80400c5e:	d4d43423          	sd	a3,-696(s0)
    80400c62:	11c72683          	lw	a3,284(a4)
    80400c66:	d0d43c23          	sd	a3,-744(s0)
    80400c6a:	14472683          	lw	a3,324(a4)
    80400c6e:	ced43023          	sd	a3,-800(s0)
    80400c72:	16c72683          	lw	a3,364(a4)
    80400c76:	cad43423          	sd	a3,-856(s0)
    80400c7a:	4714                	lw	a3,8(a4)
    80400c7c:	e8d43c23          	sd	a3,-360(s0)
    80400c80:	5b14                	lw	a3,48(a4)
    80400c82:	e4d43c23          	sd	a3,-424(s0)
    80400c86:	4f34                	lw	a3,88(a4)
    80400c88:	e0d43c23          	sd	a3,-488(s0)
    80400c8c:	08072683          	lw	a3,128(a4)
    80400c90:	dcd43c23          	sd	a3,-552(s0)
    80400c94:	0a872683          	lw	a3,168(a4)
    80400c98:	dad43023          	sd	a3,-608(s0)
    80400c9c:	0d072683          	lw	a3,208(a4)
    80400ca0:	d6d43423          	sd	a3,-664(s0)
    80400ca4:	0f872683          	lw	a3,248(a4)
    80400ca8:	d4d43023          	sd	a3,-704(s0)
    80400cac:	12072683          	lw	a3,288(a4)
    80400cb0:	d0d43823          	sd	a3,-752(s0)
    80400cb4:	14872683          	lw	a3,328(a4)
    80400cb8:	ccd43c23          	sd	a3,-808(s0)
    80400cbc:	17072683          	lw	a3,368(a4)
    80400cc0:	cad43023          	sd	a3,-864(s0)
    80400cc4:	4754                	lw	a3,12(a4)
    80400cc6:	e8d43823          	sd	a3,-368(s0)
    80400cca:	5b54                	lw	a3,52(a4)
    80400ccc:	e4d43823          	sd	a3,-432(s0)
int main() {
    80400cd0:	0c800693          	li	a3,200
    80400cd4:	c8d43023          	sd	a3,-896(s0)
    80400cd8:	4f74                	lw	a3,92(a4)
    80400cda:	e0d43823          	sd	a3,-496(s0)
    80400cde:	19078693          	addi	a3,a5,400
    80400ce2:	c6d43c23          	sd	a3,-904(s0)
    80400ce6:	08472683          	lw	a3,132(a4)
    80400cea:	dcd43823          	sd	a3,-560(s0)
    80400cee:	0ac72683          	lw	a3,172(a4)
    80400cf2:	d8d43c23          	sd	a3,-616(s0)
    80400cf6:	0d472683          	lw	a3,212(a4)
    80400cfa:	d6d43023          	sd	a3,-672(s0)
    80400cfe:	0fc72683          	lw	a3,252(a4)
    80400d02:	d2d43c23          	sd	a3,-712(s0)
    80400d06:	12472683          	lw	a3,292(a4)
    80400d0a:	d0d43423          	sd	a3,-760(s0)
    80400d0e:	14c72683          	lw	a3,332(a4)
    80400d12:	ccd43823          	sd	a3,-816(s0)
    80400d16:	17472683          	lw	a3,372(a4)
    80400d1a:	f4d43823          	sd	a3,-176(s0)
    80400d1e:	4b14                	lw	a3,16(a4)
    80400d20:	e8d43423          	sd	a3,-376(s0)
    80400d24:	5f14                	lw	a3,56(a4)
    80400d26:	e4d43423          	sd	a3,-440(s0)
    80400d2a:	5334                	lw	a3,96(a4)
    80400d2c:	e0d43423          	sd	a3,-504(s0)
    80400d30:	08872683          	lw	a3,136(a4)
    80400d34:	f4d43023          	sd	a3,-192(s0)
    80400d38:	0b072683          	lw	a3,176(a4)
    80400d3c:	f8d43023          	sd	a3,-128(s0)
    80400d40:	0d872683          	lw	a3,216(a4)
    80400d44:	f2d43823          	sd	a3,-208(s0)
    80400d48:	10072683          	lw	a3,256(a4)
    80400d4c:	f0d43423          	sd	a3,-248(s0)
    80400d50:	12872683          	lw	a3,296(a4)
    80400d54:	eed43023          	sd	a3,-288(s0)
    80400d58:	15072683          	lw	a3,336(a4)
    80400d5c:	ccd43423          	sd	a3,-824(s0)
    80400d60:	17872683          	lw	a3,376(a4)
    80400d64:	c8d43c23          	sd	a3,-872(s0)
    80400d68:	4b54                	lw	a3,20(a4)
    80400d6a:	e8d43023          	sd	a3,-384(s0)
    80400d6e:	5f54                	lw	a3,60(a4)
    80400d70:	e4d43023          	sd	a3,-448(s0)
    80400d74:	5374                	lw	a3,100(a4)
    80400d76:	e2d43423          	sd	a3,-472(s0)
    80400d7a:	08c72683          	lw	a3,140(a4)
    80400d7e:	dcd43423          	sd	a3,-568(s0)
    80400d82:	0b472683          	lw	a3,180(a4)
    80400d86:	f4d43c23          	sd	a3,-168(s0)
    80400d8a:	0dc72683          	lw	a3,220(a4)
    80400d8e:	ead43823          	sd	a3,-336(s0)
    80400d92:	10472683          	lw	a3,260(a4)
    80400d96:	ecd43023          	sd	a3,-320(s0)
    80400d9a:	12c72683          	lw	a3,300(a4)
    80400d9e:	ecd43823          	sd	a3,-304(s0)
    80400da2:	15472683          	lw	a3,340(a4)
    80400da6:	eed43423          	sd	a3,-280(s0)
    80400daa:	17c72683          	lw	a3,380(a4)
    80400dae:	eed43823          	sd	a3,-272(s0)
    80400db2:	4f14                	lw	a3,24(a4)
    80400db4:	eed43c23          	sd	a3,-264(s0)
    80400db8:	4334                	lw	a3,64(a4)
    80400dba:	f0d43023          	sd	a3,-256(s0)
    80400dbe:	5734                	lw	a3,104(a4)
    80400dc0:	f0d43823          	sd	a3,-240(s0)
    80400dc4:	09072683          	lw	a3,144(a4)
    80400dc8:	f0d43c23          	sd	a3,-232(s0)
    80400dcc:	0b872683          	lw	a3,184(a4)
    80400dd0:	f2d43023          	sd	a3,-224(s0)
    80400dd4:	0e072683          	lw	a3,224(a4)
    80400dd8:	f2d43423          	sd	a3,-216(s0)
    80400ddc:	10872683          	lw	a3,264(a4)
    80400de0:	f2d43c23          	sd	a3,-200(s0)
    80400de4:	13072683          	lw	a3,304(a4)
    80400de8:	f6d43423          	sd	a3,-152(s0)
    80400dec:	15872683          	lw	a3,344(a4)
    80400df0:	f6d43823          	sd	a3,-144(s0)
    80400df4:	18072683          	lw	a3,384(a4)
    80400df8:	f6d43c23          	sd	a3,-136(s0)
    80400dfc:	4f54                	lw	a3,28(a4)
    80400dfe:	f8d43423          	sd	a3,-120(s0)
    80400e02:	4374                	lw	a3,68(a4)
    80400e04:	e2d43c23          	sd	a3,-456(s0)
    80400e08:	5774                	lw	a3,108(a4)
    80400e0a:	e0d43023          	sd	a3,-512(s0)
    80400e0e:	09472683          	lw	a3,148(a4)
    80400e12:	f4d43423          	sd	a3,-184(s0)
    80400e16:	0bc72683          	lw	a3,188(a4)
    80400e1a:	d8d43823          	sd	a3,-624(s0)
    80400e1e:	0e472683          	lw	a3,228(a4)
    80400e22:	ecd43423          	sd	a3,-312(s0)
    80400e26:	10c72683          	lw	a3,268(a4)
    80400e2a:	ead43c23          	sd	a3,-328(s0)
    80400e2e:	13472683          	lw	a3,308(a4)
    80400e32:	d0d43023          	sd	a3,-768(s0)
    80400e36:	15c72683          	lw	a3,348(a4)
    80400e3a:	ecd43c23          	sd	a3,-296(s0)
    80400e3e:	18472683          	lw	a3,388(a4)
    80400e42:	c8d43823          	sd	a3,-880(s0)
    80400e46:	5314                	lw	a3,32(a4)
    80400e48:	e6d43c23          	sd	a3,-392(s0)
    80400e4c:	4734                	lw	a3,72(a4)
    80400e4e:	e2d43823          	sd	a3,-464(s0)
    80400e52:	5b34                	lw	a3,112(a4)
    80400e54:	ded43c23          	sd	a3,-520(s0)
    80400e58:	09872683          	lw	a3,152(a4)
    80400e5c:	dcd43023          	sd	a3,-576(s0)
    80400e60:	0c072683          	lw	a3,192(a4)
    80400e64:	d8d43423          	sd	a3,-632(s0)
    80400e68:	0e872683          	lw	a3,232(a4)
    80400e6c:	d4d43c23          	sd	a3,-680(s0)
    80400e70:	11072683          	lw	a3,272(a4)
    80400e74:	d2d43823          	sd	a3,-720(s0)
    80400e78:	13872683          	lw	a3,312(a4)
    80400e7c:	ced43c23          	sd	a3,-776(s0)
    80400e80:	16072683          	lw	a3,352(a4)
    80400e84:	ccd43023          	sd	a3,-832(s0)
    80400e88:	18872683          	lw	a3,392(a4)
    80400e8c:	e6d43423          	sd	a3,-408(s0)
    80400e90:	5354                	lw	a3,36(a4)
    80400e92:	e6d43823          	sd	a3,-400(s0)
    80400e96:	4774                	lw	a3,76(a4)
    80400e98:	f6d43023          	sd	a3,-160(s0)
    80400e9c:	5b74                	lw	a3,116(a4)
    80400e9e:	ded43823          	sd	a3,-528(s0)
    80400ea2:	09c72683          	lw	a3,156(a4)
    80400ea6:	dad43c23          	sd	a3,-584(s0)
    80400eaa:	0c472683          	lw	a3,196(a4)
    80400eae:	d8d43023          	sd	a3,-640(s0)
    80400eb2:	0ec72683          	lw	a3,236(a4)
    80400eb6:	d4d43823          	sd	a3,-688(s0)
    80400eba:	11472683          	lw	a3,276(a4)
    80400ebe:	d2d43423          	sd	a3,-728(s0)
    80400ec2:	13c72683          	lw	a3,316(a4)
    80400ec6:	ced43823          	sd	a3,-784(s0)
    80400eca:	16472683          	lw	a3,356(a4)
    80400ece:	18c72703          	lw	a4,396(a4)
    80400ed2:	cad43c23          	sd	a3,-840(s0)
    80400ed6:	85ba                	mv	a1,a4
    80400ed8:	c7843b03          	ld	s6,-904(s0)
    80400edc:	8e3e                	mv	t3,a5
    80400ede:	829e                	mv	t0,t2
    80400ee0:	c6f43823          	sd	a5,-912(s0)
    80400ee4:	c6743423          	sd	t2,-920(s0)
    80400ee8:	c8b43423          	sd	a1,-888(s0)
    while(times -- > 0) {
        for (i = 0; i < size; i++) {
            for (j = 0; j < size; j++) {
                matc[i][j] = 0;
                for (k = 0; k < size; k++) {
                    matc[i][j] += mata[i][k] * matb[k][j];
    80400eec:	000e2883          	lw	a7,0(t3)
    80400ef0:	004e2f03          	lw	t5,4(t3)
    80400ef4:	e6043483          	ld	s1,-416(s0)
    80400ef8:	0398893b          	mulw	s2,a7,s9
    80400efc:	e5843f83          	ld	t6,-424(s0)
    80400f00:	e8043983          	ld	s3,-384(s0)
    80400f04:	f8843a03          	ld	s4,-120(s0)
    80400f08:	e7043a83          	ld	s5,-400(s0)
    80400f0c:	e7843d83          	ld	s11,-392(s0)
    80400f10:	008e2803          	lw	a6,8(t3)
    80400f14:	00ce2503          	lw	a0,12(t3)
    80400f18:	010e2583          	lw	a1,16(t3)
    80400f1c:	014e2603          	lw	a2,20(t3)
    80400f20:	038f07bb          	mulw	a5,t5,s8
    80400f24:	018e2683          	lw	a3,24(t3)
    80400f28:	01ce2703          	lw	a4,28(t3)
    80400f2c:	020e2e83          	lw	t4,32(t3)
    80400f30:	024e2303          	lw	t1,36(t3)
    80400f34:	02828293          	addi	t0,t0,40
    80400f38:	028e0e13          	addi	t3,t3,40
    80400f3c:	00f9093b          	addw	s2,s2,a5
    80400f40:	ea043783          	ld	a5,-352(s0)
    80400f44:	029f04bb          	mulw	s1,t5,s1
    80400f48:	02f887bb          	mulw	a5,a7,a5
    80400f4c:	9cbd                	addw	s1,s1,a5
    80400f4e:	e9843783          	ld	a5,-360(s0)
    80400f52:	03ff00bb          	mulw	ra,t5,t6
    80400f56:	e5043f83          	ld	t6,-432(s0)
    80400f5a:	02f887bb          	mulw	a5,a7,a5
    80400f5e:	00f080bb          	addw	ra,ra,a5
    80400f62:	e9043783          	ld	a5,-368(s0)
    80400f66:	03ff03bb          	mulw	t2,t5,t6
    80400f6a:	e4843f83          	ld	t6,-440(s0)
    80400f6e:	02f887bb          	mulw	a5,a7,a5
    80400f72:	00f383bb          	addw	t2,t2,a5
    80400f76:	e8843783          	ld	a5,-376(s0)
    80400f7a:	03ff0fbb          	mulw	t6,t5,t6
    80400f7e:	02f887bb          	mulw	a5,a7,a5
    80400f82:	00ff8fbb          	addw	t6,t6,a5
    80400f86:	e4043783          	ld	a5,-448(s0)
    80400f8a:	03388d3b          	mulw	s10,a7,s3
    80400f8e:	f0043983          	ld	s3,-256(s0)
    80400f92:	02ff07bb          	mulw	a5,t5,a5
    80400f96:	00fd0d3b          	addw	s10,s10,a5
    80400f9a:	ef843783          	ld	a5,-264(s0)
    80400f9e:	033f09bb          	mulw	s3,t5,s3
    80400fa2:	02f887bb          	mulw	a5,a7,a5
    80400fa6:	00f987bb          	addw	a5,s3,a5
    80400faa:	e3843983          	ld	s3,-456(s0)
    80400fae:	031a0a3b          	mulw	s4,s4,a7
    80400fb2:	033f09bb          	mulw	s3,t5,s3
    80400fb6:	03b88dbb          	mulw	s11,a7,s11
    80400fba:	013a0a3b          	addw	s4,s4,s3
    80400fbe:	e3043983          	ld	s3,-464(s0)
    80400fc2:	035888bb          	mulw	a7,a7,s5
    80400fc6:	f6043a83          	ld	s5,-160(s0)
    80400fca:	033f09bb          	mulw	s3,t5,s3
    80400fce:	03ea8f3b          	mulw	t5,s5,t5
    80400fd2:	013d89bb          	addw	s3,s11,s3
    80400fd6:	e1843a83          	ld	s5,-488(s0)
    80400fda:	01e888bb          	addw	a7,a7,t5
    80400fde:	e2043f03          	ld	t5,-480(s0)
    80400fe2:	030b8dbb          	mulw	s11,s7,a6
    80400fe6:	03e80f3b          	mulw	t5,a6,t5
    80400fea:	01b9093b          	addw	s2,s2,s11
    80400fee:	03580dbb          	mulw	s11,a6,s5
    80400ff2:	01e484bb          	addw	s1,s1,t5
    80400ff6:	e1043f03          	ld	t5,-496(s0)
    80400ffa:	e0843a83          	ld	s5,-504(s0)
    80400ffe:	03e80f3b          	mulw	t5,a6,t5
    80401002:	01b080bb          	addw	ra,ra,s11
    80401006:	03580dbb          	mulw	s11,a6,s5
    8040100a:	01e383bb          	addw	t2,t2,t5
    8040100e:	e2843f03          	ld	t5,-472(s0)
    80401012:	f1043a83          	ld	s5,-240(s0)
    80401016:	03e80f3b          	mulw	t5,a6,t5
    8040101a:	01bf8fbb          	addw	t6,t6,s11
    8040101e:	030a8dbb          	mulw	s11,s5,a6
    80401022:	e0043a83          	ld	s5,-512(s0)
    80401026:	01ed0f3b          	addw	t5,s10,t5
    8040102a:	03580d3b          	mulw	s10,a6,s5
    8040102e:	df843a83          	ld	s5,-520(s0)
    80401032:	01b787bb          	addw	a5,a5,s11
    80401036:	03580dbb          	mulw	s11,a6,s5
    8040103a:	df043a83          	ld	s5,-528(s0)
    8040103e:	01aa0a3b          	addw	s4,s4,s10
    80401042:	0358083b          	mulw	a6,a6,s5
    80401046:	01b98dbb          	addw	s11,s3,s11
    8040104a:	de843983          	ld	s3,-536(s0)
    8040104e:	0108883b          	addw	a6,a7,a6
    80401052:	de043883          	ld	a7,-544(s0)
    80401056:	033509bb          	mulw	s3,a0,s3
    8040105a:	031508bb          	mulw	a7,a0,a7
    8040105e:	013909bb          	addw	s3,s2,s3
    80401062:	dd843903          	ld	s2,-552(s0)
    80401066:	011488bb          	addw	a7,s1,a7
    8040106a:	dd043483          	ld	s1,-560(s0)
    8040106e:	0325093b          	mulw	s2,a0,s2
    80401072:	029504bb          	mulw	s1,a0,s1
    80401076:	0120893b          	addw	s2,ra,s2
    8040107a:	f4043083          	ld	ra,-192(s0)
    8040107e:	009384bb          	addw	s1,t2,s1
    80401082:	dc843383          	ld	t2,-568(s0)
    80401086:	02a080bb          	mulw	ra,ra,a0
    8040108a:	027503bb          	mulw	t2,a0,t2
    8040108e:	001f8fbb          	addw	t6,t6,ra
    80401092:	f1843083          	ld	ra,-232(s0)
    80401096:	007f03bb          	addw	t2,t5,t2
    8040109a:	f4843f03          	ld	t5,-184(s0)
    8040109e:	02a080bb          	mulw	ra,ra,a0
    804010a2:	02af0f3b          	mulw	t5,t5,a0
    804010a6:	001787bb          	addw	a5,a5,ra
    804010aa:	dc043083          	ld	ra,-576(s0)
    804010ae:	01ea0a3b          	addw	s4,s4,t5
    804010b2:	db843f03          	ld	t5,-584(s0)
    804010b6:	021500bb          	mulw	ra,a0,ra
    804010ba:	03e5053b          	mulw	a0,a0,t5
    804010be:	db043f03          	ld	t5,-592(s0)
    804010c2:	001d8dbb          	addw	s11,s11,ra
    804010c6:	00a8053b          	addw	a0,a6,a0
    804010ca:	da843803          	ld	a6,-600(s0)
    804010ce:	03e58f3b          	mulw	t5,a1,t5
    804010d2:	0305883b          	mulw	a6,a1,a6
    804010d6:	01e989bb          	addw	s3,s3,t5
    804010da:	da043f03          	ld	t5,-608(s0)
    804010de:	0108883b          	addw	a6,a7,a6
    804010e2:	d9843883          	ld	a7,-616(s0)
    804010e6:	03e580bb          	mulw	ra,a1,t5
    804010ea:	f8043f03          	ld	t5,-128(s0)
    804010ee:	031588bb          	mulw	a7,a1,a7
    804010f2:	0019093b          	addw	s2,s2,ra
    804010f6:	011484bb          	addw	s1,s1,a7
    804010fa:	f5843883          	ld	a7,-168(s0)
    804010fe:	02bf0f3b          	mulw	t5,t5,a1
    80401102:	02b880bb          	mulw	ra,a7,a1
    80401106:	f2043883          	ld	a7,-224(s0)
    8040110a:	01ef8fbb          	addw	t6,t6,t5
    8040110e:	d9043f03          	ld	t5,-624(s0)
    80401112:	02b888bb          	mulw	a7,a7,a1
    80401116:	001383bb          	addw	t2,t2,ra
    8040111a:	d8043083          	ld	ra,-640(s0)
    8040111e:	011787bb          	addw	a5,a5,a7
    80401122:	d8843883          	ld	a7,-632(s0)
    80401126:	03e58f3b          	mulw	t5,a1,t5
    8040112a:	031588bb          	mulw	a7,a1,a7
    8040112e:	01ea0f3b          	addw	t5,s4,t5
    80401132:	021585bb          	mulw	a1,a1,ra
    80401136:	011d8dbb          	addw	s11,s11,a7
    8040113a:	d7843883          	ld	a7,-648(s0)
    8040113e:	9da9                	addw	a1,a1,a0
    80401140:	d7043503          	ld	a0,-656(s0)
    80401144:	031600bb          	mulw	ra,a2,a7
    80401148:	d6843883          	ld	a7,-664(s0)
    8040114c:	02a6053b          	mulw	a0,a2,a0
    80401150:	001989bb          	addw	s3,s3,ra
    80401154:	00a8053b          	addw	a0,a6,a0
    80401158:	d6043803          	ld	a6,-672(s0)
    8040115c:	031608bb          	mulw	a7,a2,a7
    80401160:	0306083b          	mulw	a6,a2,a6
    80401164:	0119093b          	addw	s2,s2,a7
    80401168:	f3043883          	ld	a7,-208(s0)
    8040116c:	010484bb          	addw	s1,s1,a6
    80401170:	eb043803          	ld	a6,-336(s0)
    80401174:	02c880bb          	mulw	ra,a7,a2
    80401178:	030608bb          	mulw	a7,a2,a6
    8040117c:	f2843803          	ld	a6,-216(s0)
    80401180:	001f8fbb          	addw	t6,t6,ra
    80401184:	02c8083b          	mulw	a6,a6,a2
    80401188:	011380bb          	addw	ra,t2,a7
    8040118c:	ec843883          	ld	a7,-312(s0)
    80401190:	010787bb          	addw	a5,a5,a6
    80401194:	031603bb          	mulw	t2,a2,a7
    80401198:	d5843803          	ld	a6,-680(s0)
    8040119c:	d5043883          	ld	a7,-688(s0)
    804011a0:	0306083b          	mulw	a6,a2,a6
    804011a4:	007f0f3b          	addw	t5,t5,t2
    804011a8:	0316063b          	mulw	a2,a2,a7
    804011ac:	010d8dbb          	addw	s11,s11,a6
    804011b0:	ea843803          	ld	a6,-344(s0)
    804011b4:	9e2d                	addw	a2,a2,a1
    804011b6:	d4843583          	ld	a1,-696(s0)
    804011ba:	030688bb          	mulw	a7,a3,a6
    804011be:	d4043803          	ld	a6,-704(s0)
    804011c2:	02b685bb          	mulw	a1,a3,a1
    804011c6:	011989bb          	addw	s3,s3,a7
    804011ca:	9da9                	addw	a1,a1,a0
    804011cc:	d3843503          	ld	a0,-712(s0)
    804011d0:	0306883b          	mulw	a6,a3,a6
    804011d4:	02a6853b          	mulw	a0,a3,a0
    804011d8:	0109093b          	addw	s2,s2,a6
    804011dc:	f0843803          	ld	a6,-248(s0)
    804011e0:	9ca9                	addw	s1,s1,a0
    804011e2:	ec043503          	ld	a0,-320(s0)
    804011e6:	02d808bb          	mulw	a7,a6,a3
    804011ea:	02a6883b          	mulw	a6,a3,a0
    804011ee:	f3843503          	ld	a0,-200(s0)
    804011f2:	011f8fbb          	addw	t6,t6,a7
    804011f6:	02d5053b          	mulw	a0,a0,a3
    804011fa:	010083bb          	addw	t2,ra,a6
    804011fe:	eb843803          	ld	a6,-328(s0)
    80401202:	9fa9                	addw	a5,a5,a0
    80401204:	030688bb          	mulw	a7,a3,a6
    80401208:	d3043503          	ld	a0,-720(s0)
    8040120c:	d2843803          	ld	a6,-728(s0)
    80401210:	02a6853b          	mulw	a0,a3,a0
    80401214:	011f0f3b          	addw	t5,t5,a7
    80401218:	030686bb          	mulw	a3,a3,a6
    8040121c:	00ad8dbb          	addw	s11,s11,a0
    80401220:	d2043503          	ld	a0,-736(s0)
    80401224:	9eb1                	addw	a3,a3,a2
    80401226:	d1843603          	ld	a2,-744(s0)
    8040122a:	02a7083b          	mulw	a6,a4,a0
    8040122e:	d1043503          	ld	a0,-752(s0)
    80401232:	02c7063b          	mulw	a2,a4,a2
    80401236:	010989bb          	addw	s3,s3,a6
    8040123a:	9e2d                	addw	a2,a2,a1
    8040123c:	d0843583          	ld	a1,-760(s0)
    80401240:	02a7053b          	mulw	a0,a4,a0
    80401244:	02b705bb          	mulw	a1,a4,a1
    80401248:	00a9093b          	addw	s2,s2,a0
    8040124c:	ee043503          	ld	a0,-288(s0)
    80401250:	9cad                	addw	s1,s1,a1
    80401252:	ed043583          	ld	a1,-304(s0)
    80401256:	02a7083b          	mulw	a6,a4,a0
    8040125a:	02b7053b          	mulw	a0,a4,a1
    8040125e:	f6843583          	ld	a1,-152(s0)
    80401262:	010f8fbb          	addw	t6,t6,a6
    80401266:	02e585bb          	mulw	a1,a1,a4
    8040126a:	00a383bb          	addw	t2,t2,a0
    8040126e:	d0043503          	ld	a0,-768(s0)
    80401272:	9fad                	addw	a5,a5,a1
    80401274:	02a7083b          	mulw	a6,a4,a0
    80401278:	cf843583          	ld	a1,-776(s0)
    8040127c:	cf043503          	ld	a0,-784(s0)
    80401280:	02b705bb          	mulw	a1,a4,a1
    80401284:	010f0f3b          	addw	t5,t5,a6
    80401288:	02a7073b          	mulw	a4,a4,a0
    8040128c:	00bd8dbb          	addw	s11,s11,a1
    80401290:	ce843583          	ld	a1,-792(s0)
    80401294:	9f35                	addw	a4,a4,a3
    80401296:	ce043683          	ld	a3,-800(s0)
    8040129a:	02be853b          	mulw	a0,t4,a1
    8040129e:	cd843583          	ld	a1,-808(s0)
    804012a2:	02de86bb          	mulw	a3,t4,a3
    804012a6:	00a989bb          	addw	s3,s3,a0
    804012aa:	9eb1                	addw	a3,a3,a2
    804012ac:	cd043603          	ld	a2,-816(s0)
    804012b0:	02be85bb          	mulw	a1,t4,a1
    804012b4:	02ce863b          	mulw	a2,t4,a2
    804012b8:	00b9093b          	addw	s2,s2,a1
    804012bc:	cc843583          	ld	a1,-824(s0)
    804012c0:	9cb1                	addw	s1,s1,a2
    804012c2:	ee843603          	ld	a2,-280(s0)
    804012c6:	02be853b          	mulw	a0,t4,a1
    804012ca:	02ce85bb          	mulw	a1,t4,a2
    804012ce:	f7043603          	ld	a2,-144(s0)
    804012d2:	00af8fbb          	addw	t6,t6,a0
    804012d6:	03d6063b          	mulw	a2,a2,t4
    804012da:	00b383bb          	addw	t2,t2,a1
    804012de:	ed843583          	ld	a1,-296(s0)
    804012e2:	9fb1                	addw	a5,a5,a2
    804012e4:	02be853b          	mulw	a0,t4,a1
    804012e8:	cc043603          	ld	a2,-832(s0)
    804012ec:	cb843583          	ld	a1,-840(s0)
    804012f0:	02ce863b          	mulw	a2,t4,a2
    804012f4:	00af0f3b          	addw	t5,t5,a0
    804012f8:	02be8ebb          	mulw	t4,t4,a1
    804012fc:	ca843583          	ld	a1,-856(s0)
    80401300:	00cd8dbb          	addw	s11,s11,a2
    80401304:	cb043603          	ld	a2,-848(s0)
    80401308:	02b305bb          	mulw	a1,t1,a1
    8040130c:	01d7073b          	addw	a4,a4,t4
    80401310:	9ead                	addw	a3,a3,a1
    80401312:	fcd2ae23          	sw	a3,-36(t0)
    80401316:	f5043683          	ld	a3,-176(s0)
    8040131a:	02c3063b          	mulw	a2,t1,a2
    8040131e:	026686bb          	mulw	a3,a3,t1
    80401322:	00c989bb          	addw	s3,s3,a2
    80401326:	ca043603          	ld	a2,-864(s0)
    8040132a:	fd32ac23          	sw	s3,-40(t0)
    8040132e:	9cb5                	addw	s1,s1,a3
    80401330:	ef043683          	ld	a3,-272(s0)
    80401334:	02c3053b          	mulw	a0,t1,a2
    80401338:	c9843603          	ld	a2,-872(s0)
    8040133c:	fe92a223          	sw	s1,-28(t0)
    80401340:	026686bb          	mulw	a3,a3,t1
    80401344:	00a9093b          	addw	s2,s2,a0
    80401348:	ff22a023          	sw	s2,-32(t0)
    8040134c:	02c305bb          	mulw	a1,t1,a2
    80401350:	f7843603          	ld	a2,-136(s0)
    80401354:	00d383bb          	addw	t2,t2,a3
    80401358:	c9043683          	ld	a3,-880(s0)
    8040135c:	fe72a623          	sw	t2,-20(t0)
    80401360:	0266063b          	mulw	a2,a2,t1
    80401364:	00bf8fbb          	addw	t6,t6,a1
    80401368:	fff2a423          	sw	t6,-24(t0)
    8040136c:	02d306bb          	mulw	a3,t1,a3
    80401370:	9fb1                	addw	a5,a5,a2
    80401372:	fef2a823          	sw	a5,-16(t0)
    80401376:	e6843783          	ld	a5,-408(s0)
    8040137a:	00df0f3b          	addw	t5,t5,a3
    8040137e:	c8843683          	ld	a3,-888(s0)
    80401382:	02f307bb          	mulw	a5,t1,a5
    80401386:	ffe2aa23          	sw	t5,-12(t0)
    8040138a:	02d3033b          	mulw	t1,t1,a3
    8040138e:	00fd8dbb          	addw	s11,s11,a5
    80401392:	ffb2ac23          	sw	s11,-8(t0)
    80401396:	0067073b          	addw	a4,a4,t1
    8040139a:	fee2ae23          	sw	a4,-4(t0)
        for (i = 0; i < size; i++) {
    8040139e:	b5cb17e3          	bne	s6,t3,80400eec <main+0x462>
                }
            }
        }
        for (i = 0; i < size; i++) {
            for (j = 0; j < size; j++) {
                mata[i][j] = matb[i][j] = matc[i][j];
    804013a2:	c6843383          	ld	t2,-920(s0)
    804013a6:	c7043783          	ld	a5,-912(s0)
    804013aa:	0043a703          	lw	a4,4(t2)
    804013ae:	0083a683          	lw	a3,8(t2)
    804013b2:	00c3a603          	lw	a2,12(t2)
    804013b6:	0103a583          	lw	a1,16(t2)
    804013ba:	0143a503          	lw	a0,20(t2)
    804013be:	0183a483          	lw	s1,24(t2)
    804013c2:	01c3a803          	lw	a6,28(t2)
    804013c6:	0203a883          	lw	a7,32(t2)
    804013ca:	0243a303          	lw	t1,36(t2)
    804013ce:	02c3ae03          	lw	t3,44(t2)
    804013d2:	0303ae83          	lw	t4,48(t2)
    804013d6:	0343af03          	lw	t5,52(t2)
    804013da:	0383af83          	lw	t6,56(t2)
    804013de:	03c3a283          	lw	t0,60(t2)
    804013e2:	0003ac83          	lw	s9,0(t2)
    804013e6:	eae43023          	sd	a4,-352(s0)
    804013ea:	e8d43c23          	sd	a3,-360(s0)
    804013ee:	e8c43823          	sd	a2,-368(s0)
    804013f2:	e8b43423          	sd	a1,-376(s0)
    804013f6:	e8a43023          	sd	a0,-384(s0)
    804013fa:	ee943c23          	sd	s1,-264(s0)
    804013fe:	f9043423          	sd	a6,-120(s0)
    80401402:	e7143c23          	sd	a7,-392(s0)
    80401406:	e6643823          	sd	t1,-400(s0)
    8040140a:	e7c43023          	sd	t3,-416(s0)
    8040140e:	e5d43c23          	sd	t4,-424(s0)
    80401412:	e5e43823          	sd	t5,-432(s0)
    80401416:	e5f43423          	sd	t6,-440(s0)
    8040141a:	e4543023          	sd	t0,-448(s0)
    8040141e:	0283ac03          	lw	s8,40(t2)
    80401422:	0197a023          	sw	s9,0(a5)
    80401426:	c3d8                	sw	a4,4(a5)
    80401428:	c794                	sw	a3,8(a5)
    8040142a:	0403a703          	lw	a4,64(t2)
    8040142e:	0443a683          	lw	a3,68(t2)
    80401432:	c7d0                	sw	a2,12(a5)
    80401434:	cb8c                	sw	a1,16(a5)
    80401436:	0483a603          	lw	a2,72(t2)
    8040143a:	04c3a583          	lw	a1,76(t2)
    8040143e:	cbc8                	sw	a0,20(a5)
    80401440:	cf84                	sw	s1,24(a5)
    80401442:	0543a503          	lw	a0,84(t2)
    80401446:	0583a483          	lw	s1,88(t2)
    8040144a:	0107ae23          	sw	a6,28(a5)
    8040144e:	0317a023          	sw	a7,32(a5)
    80401452:	05c3a803          	lw	a6,92(t2)
    80401456:	0603a883          	lw	a7,96(t2)
    8040145a:	0503ab83          	lw	s7,80(t2)
    8040145e:	03c7a623          	sw	t3,44(a5)
    80401462:	03d7a823          	sw	t4,48(a5)
    80401466:	03e7aa23          	sw	t5,52(a5)
    8040146a:	03f7ac23          	sw	t6,56(a5)
    8040146e:	0257ae23          	sw	t0,60(a5)
    80401472:	f0e43023          	sd	a4,-256(s0)
    80401476:	e2d43c23          	sd	a3,-456(s0)
    8040147a:	e2c43823          	sd	a2,-464(s0)
    8040147e:	f6b43023          	sd	a1,-160(s0)
    80401482:	e2a43023          	sd	a0,-480(s0)
    80401486:	e0943c23          	sd	s1,-488(s0)
    8040148a:	e1043823          	sd	a6,-496(s0)
    8040148e:	e1143423          	sd	a7,-504(s0)
    80401492:	0267a223          	sw	t1,36(a5)
    80401496:	0387a423          	sw	s8,40(a5)
    8040149a:	0643a303          	lw	t1,100(t2)
    8040149e:	0683ae03          	lw	t3,104(t2)
    804014a2:	06c3ae83          	lw	t4,108(t2)
    804014a6:	0703af03          	lw	t5,112(t2)
    804014aa:	0743af83          	lw	t6,116(t2)
    804014ae:	0783a283          	lw	t0,120(t2)
    804014b2:	07c3a083          	lw	ra,124(t2)
    804014b6:	c3b8                	sw	a4,64(a5)
    804014b8:	0803a703          	lw	a4,128(t2)
    804014bc:	e2643423          	sd	t1,-472(s0)
    804014c0:	f1c43823          	sd	t3,-240(s0)
    804014c4:	e1d43023          	sd	t4,-512(s0)
    804014c8:	dfe43c23          	sd	t5,-520(s0)
    804014cc:	dff43823          	sd	t6,-528(s0)
    804014d0:	de543423          	sd	t0,-536(s0)
    804014d4:	de143023          	sd	ra,-544(s0)
    804014d8:	c7b0                	sw	a2,72(a5)
    804014da:	c7ec                	sw	a1,76(a5)
    804014dc:	cbe8                	sw	a0,84(a5)
    804014de:	cfa4                	sw	s1,88(a5)
    804014e0:	0507ae23          	sw	a6,92(a5)
    804014e4:	0717a023          	sw	a7,96(a5)
    804014e8:	0667a223          	sw	t1,100(a5)
    804014ec:	07c7a423          	sw	t3,104(a5)
    804014f0:	07d7a623          	sw	t4,108(a5)
    804014f4:	07e7a823          	sw	t5,112(a5)
    804014f8:	07f7aa23          	sw	t6,116(a5)
    804014fc:	0657ac23          	sw	t0,120(a5)
    80401500:	0617ae23          	sw	ra,124(a5)
    80401504:	dce43c23          	sd	a4,-552(s0)
    80401508:	c3f4                	sw	a3,68(a5)
    8040150a:	0577a823          	sw	s7,80(a5)
    8040150e:	0843a683          	lw	a3,132(t2)
    80401512:	08c3a583          	lw	a1,140(t2)
    80401516:	0903a503          	lw	a0,144(t2)
    8040151a:	0943a483          	lw	s1,148(t2)
    8040151e:	0983a803          	lw	a6,152(t2)
    80401522:	09c3a883          	lw	a7,156(t2)
    80401526:	0a03a303          	lw	t1,160(t2)
    8040152a:	0a43ae03          	lw	t3,164(t2)
    8040152e:	0a83ae83          	lw	t4,168(t2)
    80401532:	0ac3af03          	lw	t5,172(t2)
    80401536:	0b03af83          	lw	t6,176(t2)
    8040153a:	0b43a283          	lw	t0,180(t2)
    8040153e:	0b83a083          	lw	ra,184(t2)
    80401542:	0bc3a903          	lw	s2,188(t2)
    80401546:	0883a603          	lw	a2,136(t2)
    8040154a:	dcd43823          	sd	a3,-560(s0)
    8040154e:	dcb43423          	sd	a1,-568(s0)
    80401552:	f4c43023          	sd	a2,-192(s0)
    80401556:	f0a43c23          	sd	a0,-232(s0)
    8040155a:	f4943423          	sd	s1,-184(s0)
    8040155e:	dd043023          	sd	a6,-576(s0)
    80401562:	db143c23          	sd	a7,-584(s0)
    80401566:	da643823          	sd	t1,-592(s0)
    8040156a:	dbc43423          	sd	t3,-600(s0)
    8040156e:	dbd43023          	sd	t4,-608(s0)
    80401572:	d9e43c23          	sd	t5,-616(s0)
    80401576:	f9f43023          	sd	t6,-128(s0)
    8040157a:	f4543c23          	sd	t0,-168(s0)
    8040157e:	f2143023          	sd	ra,-224(s0)
    80401582:	d9243823          	sd	s2,-624(s0)
    80401586:	08e7a023          	sw	a4,128(a5)
    8040158a:	08d7a223          	sw	a3,132(a5)
    8040158e:	08c7a423          	sw	a2,136(a5)
    80401592:	0c03a703          	lw	a4,192(t2)
    80401596:	0c43a683          	lw	a3,196(t2)
    8040159a:	0c83a603          	lw	a2,200(t2)
    8040159e:	08b7a623          	sw	a1,140(a5)
    804015a2:	08a7a823          	sw	a0,144(a5)
    804015a6:	0cc3a583          	lw	a1,204(t2)
    804015aa:	0d03a503          	lw	a0,208(t2)
    804015ae:	0897aa23          	sw	s1,148(a5)
    804015b2:	0907ac23          	sw	a6,152(a5)
    804015b6:	0d43a483          	lw	s1,212(t2)
    804015ba:	0d83a803          	lw	a6,216(t2)
    804015be:	0917ae23          	sw	a7,156(a5)
    804015c2:	0a67a023          	sw	t1,160(a5)
    804015c6:	0dc3a883          	lw	a7,220(t2)
    804015ca:	0e03a303          	lw	t1,224(t2)
    804015ce:	0bc7a223          	sw	t3,164(a5)
    804015d2:	0e43ae03          	lw	t3,228(t2)
    804015d6:	0bd7a423          	sw	t4,168(a5)
    804015da:	0be7a623          	sw	t5,172(a5)
    804015de:	0bf7a823          	sw	t6,176(a5)
    804015e2:	0a57aa23          	sw	t0,180(a5)
    804015e6:	0a17ac23          	sw	ra,184(a5)
    804015ea:	0b27ae23          	sw	s2,188(a5)
    804015ee:	d8e43423          	sd	a4,-632(s0)
    804015f2:	d8d43023          	sd	a3,-640(s0)
    804015f6:	d6c43c23          	sd	a2,-648(s0)
    804015fa:	d6b43823          	sd	a1,-656(s0)
    804015fe:	d6a43423          	sd	a0,-664(s0)
    80401602:	d6943023          	sd	s1,-672(s0)
    80401606:	f3043823          	sd	a6,-208(s0)
    8040160a:	eb143823          	sd	a7,-336(s0)
    8040160e:	f2643423          	sd	t1,-216(s0)
    80401612:	edc43423          	sd	t3,-312(s0)
    80401616:	0e83ae83          	lw	t4,232(t2)
    8040161a:	0ec3af03          	lw	t5,236(t2)
    8040161e:	0f03af83          	lw	t6,240(t2)
    80401622:	0f43a283          	lw	t0,244(t2)
    80401626:	0f83a083          	lw	ra,248(t2)
    8040162a:	0fc3a903          	lw	s2,252(t2)
    8040162e:	0ce7a023          	sw	a4,192(a5)
    80401632:	0cd7a223          	sw	a3,196(a5)
    80401636:	1003a703          	lw	a4,256(t2)
    8040163a:	1043a683          	lw	a3,260(t2)
    8040163e:	d5d43c23          	sd	t4,-680(s0)
    80401642:	d5e43823          	sd	t5,-688(s0)
    80401646:	ebf43423          	sd	t6,-344(s0)
    8040164a:	d4543423          	sd	t0,-696(s0)
    8040164e:	d4143023          	sd	ra,-704(s0)
    80401652:	d3243c23          	sd	s2,-712(s0)
    80401656:	0cb7a623          	sw	a1,204(a5)
    8040165a:	0ca7a823          	sw	a0,208(a5)
    8040165e:	0c97aa23          	sw	s1,212(a5)
    80401662:	0d07ac23          	sw	a6,216(a5)
    80401666:	0d17ae23          	sw	a7,220(a5)
    8040166a:	0e67a023          	sw	t1,224(a5)
    8040166e:	0fc7a223          	sw	t3,228(a5)
    80401672:	0fd7a423          	sw	t4,232(a5)
    80401676:	0fe7a623          	sw	t5,236(a5)
    8040167a:	0ff7a823          	sw	t6,240(a5)
    8040167e:	0e57aa23          	sw	t0,244(a5)
    80401682:	0e17ac23          	sw	ra,248(a5)
    80401686:	0f27ae23          	sw	s2,252(a5)
    8040168a:	f0e43423          	sd	a4,-248(s0)
    8040168e:	ecd43023          	sd	a3,-320(s0)
    80401692:	0cc7a423          	sw	a2,200(a5)
    80401696:	1083a603          	lw	a2,264(t2)
    8040169a:	10c3a583          	lw	a1,268(t2)
    8040169e:	1143a483          	lw	s1,276(t2)
    804016a2:	1183a803          	lw	a6,280(t2)
    804016a6:	11c3a883          	lw	a7,284(t2)
    804016aa:	1203a303          	lw	t1,288(t2)
    804016ae:	1243ae03          	lw	t3,292(t2)
    804016b2:	1283ae83          	lw	t4,296(t2)
    804016b6:	12c3af03          	lw	t5,300(t2)
    804016ba:	1303af83          	lw	t6,304(t2)
    804016be:	1343a283          	lw	t0,308(t2)
    804016c2:	1383a083          	lw	ra,312(t2)
    804016c6:	13c3a903          	lw	s2,316(t2)
    804016ca:	1103a503          	lw	a0,272(t2)
    804016ce:	f2c43c23          	sd	a2,-200(s0)
    804016d2:	eab43c23          	sd	a1,-328(s0)
    804016d6:	d2a43823          	sd	a0,-720(s0)
    804016da:	d2943423          	sd	s1,-728(s0)
    804016de:	d3043023          	sd	a6,-736(s0)
    804016e2:	d1143c23          	sd	a7,-744(s0)
    804016e6:	d0643823          	sd	t1,-752(s0)
    804016ea:	d1c43423          	sd	t3,-760(s0)
    804016ee:	efd43023          	sd	t4,-288(s0)
    804016f2:	ede43823          	sd	t5,-304(s0)
    804016f6:	f7f43423          	sd	t6,-152(s0)
    804016fa:	d0543023          	sd	t0,-768(s0)
    804016fe:	ce143c23          	sd	ra,-776(s0)
    80401702:	cf243823          	sd	s2,-784(s0)
    80401706:	10e7a023          	sw	a4,256(a5)
    8040170a:	10d7a223          	sw	a3,260(a5)
    8040170e:	10c7a423          	sw	a2,264(a5)
    80401712:	10b7a623          	sw	a1,268(a5)
    80401716:	10a7a823          	sw	a0,272(a5)
    8040171a:	1403a703          	lw	a4,320(t2)
    8040171e:	1443a683          	lw	a3,324(t2)
    80401722:	1483a603          	lw	a2,328(t2)
    80401726:	14c3a583          	lw	a1,332(t2)
    8040172a:	1503a503          	lw	a0,336(t2)
    8040172e:	1097aa23          	sw	s1,276(a5)
    80401732:	1107ac23          	sw	a6,280(a5)
    80401736:	1543a483          	lw	s1,340(t2)
    8040173a:	1583a803          	lw	a6,344(t2)
    8040173e:	1117ae23          	sw	a7,284(a5)
    80401742:	1267a023          	sw	t1,288(a5)
    80401746:	15c3a883          	lw	a7,348(t2)
    8040174a:	1603a303          	lw	t1,352(t2)
    8040174e:	13c7a223          	sw	t3,292(a5)
    80401752:	1643ae03          	lw	t3,356(t2)
    80401756:	13d7a423          	sw	t4,296(a5)
    8040175a:	1683ae83          	lw	t4,360(t2)
    8040175e:	13e7a623          	sw	t5,300(a5)
    80401762:	13f7a823          	sw	t6,304(a5)
    80401766:	1257aa23          	sw	t0,308(a5)
    8040176a:	1217ac23          	sw	ra,312(a5)
    8040176e:	1327ae23          	sw	s2,316(a5)
    80401772:	cee43423          	sd	a4,-792(s0)
    80401776:	ced43023          	sd	a3,-800(s0)
    8040177a:	ccc43c23          	sd	a2,-808(s0)
    8040177e:	ccb43823          	sd	a1,-816(s0)
    80401782:	cca43423          	sd	a0,-824(s0)
    80401786:	ee943423          	sd	s1,-280(s0)
    8040178a:	f7043823          	sd	a6,-144(s0)
    8040178e:	ed143c23          	sd	a7,-296(s0)
    80401792:	cc643023          	sd	t1,-832(s0)
    80401796:	cbc43c23          	sd	t3,-840(s0)
    8040179a:	cbd43823          	sd	t4,-848(s0)
    8040179e:	16c3af03          	lw	t5,364(t2)
    804017a2:	1703af83          	lw	t6,368(t2)
    804017a6:	1743a283          	lw	t0,372(t2)
    804017aa:	1783a083          	lw	ra,376(t2)
    804017ae:	17c3a903          	lw	s2,380(t2)
    804017b2:	14e7a023          	sw	a4,320(a5)
    804017b6:	14d7a223          	sw	a3,324(a5)
    804017ba:	1803a703          	lw	a4,384(t2)
    804017be:	1843a683          	lw	a3,388(t2)
    804017c2:	14c7a423          	sw	a2,328(a5)
    804017c6:	1883a603          	lw	a2,392(t2)
    804017ca:	f6e43c23          	sd	a4,-136(s0)
    804017ce:	cbe43423          	sd	t5,-856(s0)
    804017d2:	cbf43023          	sd	t6,-864(s0)
    804017d6:	f4543823          	sd	t0,-176(s0)
    804017da:	c8143c23          	sd	ra,-872(s0)
    804017de:	ef243823          	sd	s2,-272(s0)
    804017e2:	14b7a623          	sw	a1,332(a5)
    804017e6:	14a7a823          	sw	a0,336(a5)
    804017ea:	1497aa23          	sw	s1,340(a5)
    804017ee:	1507ac23          	sw	a6,344(a5)
    804017f2:	1517ae23          	sw	a7,348(a5)
    804017f6:	1667a023          	sw	t1,352(a5)
    804017fa:	17c7a223          	sw	t3,356(a5)
    804017fe:	17d7a423          	sw	t4,360(a5)
    80401802:	17e7a623          	sw	t5,364(a5)
    80401806:	17f7a823          	sw	t6,368(a5)
    8040180a:	1657aa23          	sw	t0,372(a5)
    8040180e:	1617ac23          	sw	ra,376(a5)
    80401812:	1727ae23          	sw	s2,380(a5)
    80401816:	c8d43823          	sd	a3,-880(s0)
    8040181a:	e6c43423          	sd	a2,-408(s0)
    8040181e:	18c3a583          	lw	a1,396(t2)
    80401822:	18e7a023          	sw	a4,384(a5)
    80401826:	c8043703          	ld	a4,-896(s0)
    8040182a:	18d7a223          	sw	a3,388(a5)
    8040182e:	18c7a423          	sw	a2,392(a5)
    80401832:	377d                	addiw	a4,a4,-1
    80401834:	18b7a623          	sw	a1,396(a5)
    while(times -- > 0) {
    80401838:	c8e43023          	sd	a4,-896(s0)
    8040183c:	e8071e63          	bnez	a4,80400ed8 <main+0x44e>
            }
        }
    }

    puts("matrix success!");
    80401840:	00000517          	auipc	a0,0x0
    80401844:	2f850513          	addi	a0,a0,760 # 80401b38 <main+0x10ae>
    80401848:	80ffe0ef          	jal	ra,80400056 <puts>

    return 0;
}
    8040184c:	c6040113          	addi	sp,s0,-928
    80401850:	39813083          	ld	ra,920(sp)
    80401854:	39013403          	ld	s0,912(sp)
    80401858:	38813483          	ld	s1,904(sp)
    8040185c:	38013903          	ld	s2,896(sp)
    80401860:	37813983          	ld	s3,888(sp)
    80401864:	37013a03          	ld	s4,880(sp)
    80401868:	36813a83          	ld	s5,872(sp)
    8040186c:	36013b03          	ld	s6,864(sp)
    80401870:	35813b83          	ld	s7,856(sp)
    80401874:	35013c03          	ld	s8,848(sp)
    80401878:	34813c83          	ld	s9,840(sp)
    8040187c:	34013d03          	ld	s10,832(sp)
    80401880:	33813d83          	ld	s11,824(sp)
    80401884:	4501                	li	a0,0
    80401886:	3a010113          	addi	sp,sp,928
    8040188a:	8082                	ret
            mata[i][j] = matb[i][j] = 1;
    8040188c:	4685                	li	a3,1
    8040188e:	c314                	sw	a3,0(a4)
    80401890:	c394                	sw	a3,0(a5)
    80401892:	c354                	sw	a3,4(a4)
    80401894:	c3d4                	sw	a3,4(a5)
    80401896:	c714                	sw	a3,8(a4)
    80401898:	c794                	sw	a3,8(a5)
    8040189a:	c754                	sw	a3,12(a4)
    8040189c:	c7d4                	sw	a3,12(a5)
    8040189e:	cb14                	sw	a3,16(a4)
    804018a0:	cb94                	sw	a3,16(a5)
    804018a2:	cb54                	sw	a3,20(a4)
    804018a4:	cbd4                	sw	a3,20(a5)
    804018a6:	cf14                	sw	a3,24(a4)
    804018a8:	cf94                	sw	a3,24(a5)
    804018aa:	cf54                	sw	a3,28(a4)
    804018ac:	cfd4                	sw	a3,28(a5)
    804018ae:	d314                	sw	a3,32(a4)
    804018b0:	d394                	sw	a3,32(a5)
    804018b2:	d354                	sw	a3,36(a4)
    804018b4:	d3d4                	sw	a3,36(a5)
    804018b6:	d714                	sw	a3,40(a4)
    804018b8:	d794                	sw	a3,40(a5)
    804018ba:	d754                	sw	a3,44(a4)
    804018bc:	d7d4                	sw	a3,44(a5)
    804018be:	db14                	sw	a3,48(a4)
    804018c0:	db94                	sw	a3,48(a5)
    804018c2:	db54                	sw	a3,52(a4)
    804018c4:	dbd4                	sw	a3,52(a5)
    804018c6:	df14                	sw	a3,56(a4)
    804018c8:	df94                	sw	a3,56(a5)
    804018ca:	df54                	sw	a3,60(a4)
    804018cc:	dfd4                	sw	a3,60(a5)
    804018ce:	c334                	sw	a3,64(a4)
    804018d0:	c3b4                	sw	a3,64(a5)
    804018d2:	c374                	sw	a3,68(a4)
    804018d4:	c3f4                	sw	a3,68(a5)
    804018d6:	c734                	sw	a3,72(a4)
    804018d8:	c7b4                	sw	a3,72(a5)
    804018da:	c774                	sw	a3,76(a4)
    804018dc:	c7f4                	sw	a3,76(a5)
    804018de:	cb34                	sw	a3,80(a4)
    804018e0:	cbb4                	sw	a3,80(a5)
    804018e2:	cb74                	sw	a3,84(a4)
    804018e4:	cbf4                	sw	a3,84(a5)
    804018e6:	cf34                	sw	a3,88(a4)
    804018e8:	cfb4                	sw	a3,88(a5)
    804018ea:	cf74                	sw	a3,92(a4)
    804018ec:	cff4                	sw	a3,92(a5)
    804018ee:	d334                	sw	a3,96(a4)
    804018f0:	d3b4                	sw	a3,96(a5)
    804018f2:	d374                	sw	a3,100(a4)
    804018f4:	d3f4                	sw	a3,100(a5)
    804018f6:	d734                	sw	a3,104(a4)
    804018f8:	d7b4                	sw	a3,104(a5)
    804018fa:	d774                	sw	a3,108(a4)
    804018fc:	d7f4                	sw	a3,108(a5)
    804018fe:	db34                	sw	a3,112(a4)
    80401900:	dbb4                	sw	a3,112(a5)
    80401902:	db74                	sw	a3,116(a4)
    80401904:	dbf4                	sw	a3,116(a5)
    80401906:	df34                	sw	a3,120(a4)
    80401908:	dfb4                	sw	a3,120(a5)
    8040190a:	df74                	sw	a3,124(a4)
    8040190c:	dff4                	sw	a3,124(a5)
    8040190e:	08d72023          	sw	a3,128(a4)
    80401912:	08d7a023          	sw	a3,128(a5)
    80401916:	08d72223          	sw	a3,132(a4)
    8040191a:	08d7a223          	sw	a3,132(a5)
    8040191e:	08d72423          	sw	a3,136(a4)
    80401922:	08d7a423          	sw	a3,136(a5)
    80401926:	08d72623          	sw	a3,140(a4)
    8040192a:	08d7a623          	sw	a3,140(a5)
    8040192e:	08d72823          	sw	a3,144(a4)
    80401932:	08d7a823          	sw	a3,144(a5)
    80401936:	08d72a23          	sw	a3,148(a4)
    8040193a:	08d7aa23          	sw	a3,148(a5)
    8040193e:	08d72c23          	sw	a3,152(a4)
    80401942:	08d7ac23          	sw	a3,152(a5)
    80401946:	08d72e23          	sw	a3,156(a4)
    8040194a:	08d7ae23          	sw	a3,156(a5)
    8040194e:	0ad72023          	sw	a3,160(a4)
    80401952:	0ad7a023          	sw	a3,160(a5)
    80401956:	0ad72223          	sw	a3,164(a4)
    8040195a:	0ad7a223          	sw	a3,164(a5)
    8040195e:	0ad72423          	sw	a3,168(a4)
    80401962:	0ad7a423          	sw	a3,168(a5)
    80401966:	0ad72623          	sw	a3,172(a4)
    8040196a:	0ad7a623          	sw	a3,172(a5)
    8040196e:	0ad72823          	sw	a3,176(a4)
    80401972:	0ad7a823          	sw	a3,176(a5)
    80401976:	0ad72a23          	sw	a3,180(a4)
    8040197a:	0ad7aa23          	sw	a3,180(a5)
    8040197e:	0ad72c23          	sw	a3,184(a4)
    80401982:	0ad7ac23          	sw	a3,184(a5)
    80401986:	0ad72e23          	sw	a3,188(a4)
    8040198a:	0ad7ae23          	sw	a3,188(a5)
    8040198e:	0cd72023          	sw	a3,192(a4)
    80401992:	0cd7a023          	sw	a3,192(a5)
    80401996:	0cd72223          	sw	a3,196(a4)
    8040199a:	0cd7a223          	sw	a3,196(a5)
    8040199e:	0cd72423          	sw	a3,200(a4)
    804019a2:	0cd7a423          	sw	a3,200(a5)
    804019a6:	0cd72623          	sw	a3,204(a4)
    804019aa:	0cd7a623          	sw	a3,204(a5)
    804019ae:	0cd72823          	sw	a3,208(a4)
    804019b2:	0cd7a823          	sw	a3,208(a5)
    804019b6:	0cd72a23          	sw	a3,212(a4)
    804019ba:	0cd7aa23          	sw	a3,212(a5)
    804019be:	0cd72c23          	sw	a3,216(a4)
    804019c2:	0cd7ac23          	sw	a3,216(a5)
    804019c6:	0cd72e23          	sw	a3,220(a4)
    804019ca:	0cd7ae23          	sw	a3,220(a5)
    804019ce:	0ed72023          	sw	a3,224(a4)
    804019d2:	0ed7a023          	sw	a3,224(a5)
    804019d6:	0ed72223          	sw	a3,228(a4)
    804019da:	0ed7a223          	sw	a3,228(a5)
    804019de:	0ed72423          	sw	a3,232(a4)
    804019e2:	0ed7a423          	sw	a3,232(a5)
    804019e6:	0ed72623          	sw	a3,236(a4)
    804019ea:	0ed7a623          	sw	a3,236(a5)
    804019ee:	0ed72823          	sw	a3,240(a4)
    804019f2:	0ed7a823          	sw	a3,240(a5)
    804019f6:	0ed72a23          	sw	a3,244(a4)
    804019fa:	0ed7aa23          	sw	a3,244(a5)
    804019fe:	0ed72c23          	sw	a3,248(a4)
    80401a02:	0ed7ac23          	sw	a3,248(a5)
    80401a06:	0ed72e23          	sw	a3,252(a4)
    80401a0a:	0ed7ae23          	sw	a3,252(a5)
    80401a0e:	10d72023          	sw	a3,256(a4)
    80401a12:	10d7a023          	sw	a3,256(a5)
    80401a16:	10d72223          	sw	a3,260(a4)
    80401a1a:	10d7a223          	sw	a3,260(a5)
    80401a1e:	10d72423          	sw	a3,264(a4)
    80401a22:	10d7a423          	sw	a3,264(a5)
    80401a26:	10d72623          	sw	a3,268(a4)
    80401a2a:	10d7a623          	sw	a3,268(a5)
    80401a2e:	10d72823          	sw	a3,272(a4)
    80401a32:	10d7a823          	sw	a3,272(a5)
    80401a36:	10d72a23          	sw	a3,276(a4)
    80401a3a:	10d7aa23          	sw	a3,276(a5)
    80401a3e:	10d72c23          	sw	a3,280(a4)
    80401a42:	10d7ac23          	sw	a3,280(a5)
    80401a46:	10d72e23          	sw	a3,284(a4)
    80401a4a:	10d7ae23          	sw	a3,284(a5)
    80401a4e:	12d72023          	sw	a3,288(a4)
    80401a52:	12d7a023          	sw	a3,288(a5)
    80401a56:	12d72223          	sw	a3,292(a4)
    80401a5a:	12d7a223          	sw	a3,292(a5)
    80401a5e:	12d72423          	sw	a3,296(a4)
    80401a62:	12d7a423          	sw	a3,296(a5)
    80401a66:	12d72623          	sw	a3,300(a4)
    80401a6a:	12d7a623          	sw	a3,300(a5)
    80401a6e:	12d72823          	sw	a3,304(a4)
    80401a72:	12d7a823          	sw	a3,304(a5)
    80401a76:	12d72a23          	sw	a3,308(a4)
    80401a7a:	12d7aa23          	sw	a3,308(a5)
    80401a7e:	12d72c23          	sw	a3,312(a4)
    80401a82:	12d7ac23          	sw	a3,312(a5)
    80401a86:	12d72e23          	sw	a3,316(a4)
    80401a8a:	12d7ae23          	sw	a3,316(a5)
    80401a8e:	14d72023          	sw	a3,320(a4)
    80401a92:	14d7a023          	sw	a3,320(a5)
    80401a96:	14d72223          	sw	a3,324(a4)
    80401a9a:	14d7a223          	sw	a3,324(a5)
    80401a9e:	14d72423          	sw	a3,328(a4)
    80401aa2:	14d7a423          	sw	a3,328(a5)
    80401aa6:	14d72623          	sw	a3,332(a4)
    80401aaa:	14d7a623          	sw	a3,332(a5)
    80401aae:	14d72823          	sw	a3,336(a4)
    80401ab2:	14d7a823          	sw	a3,336(a5)
    80401ab6:	14d72a23          	sw	a3,340(a4)
    80401aba:	14d7aa23          	sw	a3,340(a5)
    80401abe:	14d72c23          	sw	a3,344(a4)
    80401ac2:	14d7ac23          	sw	a3,344(a5)
    80401ac6:	14d72e23          	sw	a3,348(a4)
    80401aca:	14d7ae23          	sw	a3,348(a5)
    80401ace:	16d72023          	sw	a3,352(a4)
    80401ad2:	16d7a023          	sw	a3,352(a5)
    80401ad6:	16d72223          	sw	a3,356(a4)
    80401ada:	16d7a223          	sw	a3,356(a5)
    80401ade:	16d72423          	sw	a3,360(a4)
    80401ae2:	16d7a423          	sw	a3,360(a5)
    80401ae6:	16d72623          	sw	a3,364(a4)
    80401aea:	16d7a623          	sw	a3,364(a5)
    80401aee:	16d72823          	sw	a3,368(a4)
    80401af2:	16d7a823          	sw	a3,368(a5)
    80401af6:	16d72a23          	sw	a3,372(a4)
    80401afa:	16d7aa23          	sw	a3,372(a5)
    80401afe:	16d72c23          	sw	a3,376(a4)
    80401b02:	16d7ac23          	sw	a3,376(a5)
    80401b06:	16d72e23          	sw	a3,380(a4)
    80401b0a:	16d7ae23          	sw	a3,380(a5)
    80401b0e:	18d72023          	sw	a3,384(a4)
    80401b12:	18d7a023          	sw	a3,384(a5)
    80401b16:	18d72223          	sw	a3,388(a4)
    80401b1a:	18d7a223          	sw	a3,388(a5)
    80401b1e:	18d72423          	sw	a3,392(a4)
    80401b22:	18d7a423          	sw	a3,392(a5)
    80401b26:	18d72623          	sw	a3,396(a4)
    80401b2a:	18d7a623          	sw	a3,396(a5)
    for (i = 0; i < size; i ++) {
    80401b2e:	8c2ff06f          	j	80400bf0 <main+0x166>
