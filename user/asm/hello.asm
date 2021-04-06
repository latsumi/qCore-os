
/media/psf/share/qCore-os/user/build/riscv64/hello:     file format elf64-littleriscv


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
    804000e2:	00001a97          	auipc	s5,0x1
    804000e6:	9f6a8a93          	addi	s5,s5,-1546 # 80400ad8 <digits>
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
    80400356:	00000417          	auipc	s0,0x0
    8040035a:	76240413          	addi	s0,s0,1890 # 80400ab8 <main+0x2e>
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
    8040065c:	00000597          	auipc	a1,0x0
    80400660:	4645b583          	ld	a1,1124(a1) # 80400ac0 <main+0x36>
    80400664:	00000617          	auipc	a2,0x0
    80400668:	46463603          	ld	a2,1124(a2) # 80400ac8 <main+0x3e>
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
    804006c4:	00000517          	auipc	a0,0x0
    804006c8:	40c53503          	ld	a0,1036(a0) # 80400ad0 <main+0x46>
        for (w = (const void*)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    804006cc:	471d                	li	a4,7
        size_t k = ONES * c;
    804006ce:	02a58533          	mul	a0,a1,a0
        for (w = (const void*)s; n >= SS && !HASZERO(*w ^ k); w++, n -= SS)
    804006d2:	02c77a63          	bgeu	a4,a2,80400706 <memchr+0x6e>
    804006d6:	00000897          	auipc	a7,0x0
    804006da:	3ea8b883          	ld	a7,1002(a7) # 80400ac0 <main+0x36>
    804006de:	00000817          	auipc	a6,0x0
    804006e2:	3ea83803          	ld	a6,1002(a6) # 80400ac8 <main+0x3e>
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
    80400764:	00000617          	auipc	a2,0x0
    80400768:	35c63603          	ld	a2,860(a2) # 80400ac0 <main+0x36>
    8040076c:	00000817          	auipc	a6,0x0
    80400770:	35c83803          	ld	a6,860(a6) # 80400ac8 <main+0x3e>
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
    80400946:	00000897          	auipc	a7,0x0
    8040094a:	17a8b883          	ld	a7,378(a7) # 80400ac0 <main+0x36>
    8040094e:	00000817          	auipc	a6,0x0
    80400952:	17a83803          	ld	a6,378(a6) # 80400ac8 <main+0x3e>
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
    80400a8a:	1141                	addi	sp,sp,-16
    puts("hello wrold!");
    80400a8c:	00000517          	auipc	a0,0x0
    80400a90:	01c50513          	addi	a0,a0,28 # 80400aa8 <main+0x1e>
int main() {
    80400a94:	e406                	sd	ra,8(sp)
    puts("hello wrold!");
    80400a96:	dc0ff0ef          	jal	ra,80400056 <puts>
    return 0;
    80400a9a:	60a2                	ld	ra,8(sp)
    80400a9c:	4501                	li	a0,0
    80400a9e:	0141                	addi	sp,sp,16
    80400aa0:	8082                	ret
