# MyOsStudy
# <font face="楷体" size=6 color=pick>说明</font>
    创建该项目是为了复习学校里所学的操作系统原理的知识点，并且跟进一步地学习如何使用汇编语言和C语言开发一款操作系统。  
    操作系统的代码在"代码"目录中，以下是编写操作系统时所用到的知识点总结:  
# <font face="楷体" size=6 color=orange>目录</font>
- [1. 开发环境的配置](#1-开发环境的配置)  
- [2. BIOS中断表](#2-bios中断表)  
    - [1. 显示服务(Video Service——INT 10H)](#1-显示服务video-serviceint-10h)  
        - [(1)、功能00H—设置显示器模式](#1功能00h)
        - [(2)、功能01H—设置光标形状](#2功能01h)
        - [(3)、功能02H—设置光标位置](#3功能02h)
        - [(4)、功能03H—读取光标信息](#4功能03h)
        - [(5)、功能04H—读取光笔位置](#5功能04h)
        - [(6)、功能05H—设置显示页](#6功能05h)
        - [(7)、功能06H和07H—初始化或滚屏](#7功能06h和07h)
        - [(8)、功能08H—读光标处的字符及其属性](#8功能08h)
        - [(9)、功能09H—在光标处按指定属性显示字符](#9功能09h)
        - [(10)、功能0AH—在当前光标处显示字符](#10功能0ah)
        - [(11)、功能0BH—设置调色板、背景色或边框](#11功能0bh)
        - [(12)、功能0CH—写图形象素](#12功能0ch)
        - [(13)、功能0DH—读图形象素](#13功能0dh)
        - [(14)、功能0EH—在Teletype模式下显示字符](#14功能0eh)
        - [(15)、功能0FH—读取显示器模式](#15功能0fh)
        - [(16)、功能10H—颜色](#16功能10h)
        - [(17)、功能11H—字体](#17功能11h)
        - [(18)、功能12H—显示器的配置](#18功能12h)
        - [(19)、功能13H—在Teletype模式下显示字符串](#19功能13h)
        - [(20)、功能1AH—读取/设置显示组合编码](#20功能1ah)
        - [(21)、功能1BH—读取功能/状态信息](#21功能1bh)
        - [(22)、功能1CH—保存/恢复显示器状态](#22功能1ch)
    - [2. 磁盘服务(Direct Disk Service——INT 13H)](#2-磁盘服务direct-disk-serviceint-13h)
        - [(1)、功能00H—磁盘系统复位](#1功能00h-1)
        - [(2)、功能01H—读取磁盘系统状态](#2功能01h-1)
        - [(3)、功能02H—读扇区](#3功能02h-1)
        - [(4)、功能03H—写扇区](#4功能03h-1)
        - [(5)、功能04H—检验扇区](#5功能04h-1)
        - [(6)、功能05H—格式化磁道](#6功能05h-1)
        - [(7)、功能06H—格式化坏磁道](#7功能06h)
        - [(8)、功能07H—格式化驱动器](#8功能07h)
        - [(9)、功能08H—读取驱动器参数](#9功能08h)
        - [(10)、功能09H—初始化硬盘参数](#10功能09h)
        - [(11)、功能0AH—读长扇区](#11功能0ah)
        - [(12)、功能0BH—写长扇区](#12功能0bh)
        - [(13)、功能0CH—查寻](#13功能0ch)
    - [3. 串行口服务(Serial Port Service——INT 14H)](#3-串行口服务serial-port-serviceint-14h)
        - [(1)、功能00H—初始化通信口](#1功能00h-2)
        - [(2)、功能01H—读取通信口状态](#2功能01h-2)
        - [(3)、功能02H—向通信口输出字符](#3功能02h-2)
        - [(4)、功能03H—扩充初始化通信口](#4功能03h-2)
        - [(5)、功能04H—从通信口读入字符](#5功能04h-2)
    - [4. 键盘服务(Keyboard Service——INT 16H)](#4-键盘服务keyboard-serviceint-16h)
        - [(1)、功能00H和10H—从键盘读入字符](#1功能00h和10h)
        - [(2)、功能01H和11H—读取键盘状态](#2功能01h和11h)
        - [(3)、功能02H和12H—读取键盘标志](#3功能02h和12h)
        - [(4)、功能03H—设置重复率](#4功能03h-3)
        - [(5)、功能04H—设置键盘点击](#5功能04h-3)
        - [(6)、功能05H—字符及其扫描码进栈](#6功能05h-2)
    - [5. 杂项系统服务(Miscellaneous System Service——INT 15H)](#5-杂项系统服务miscellaneous-system-serviceint-15h)
        - [(1)、功能00H—开盒式磁带机马达](#1功能00h-3)
        - [(2)、功能01H—关盒式磁带机马达](#2功能01h-3)
        - [(3)、功能02H—读盒式磁带机](#3功能02h-3)
        - [(4)、功能03H—写盒式磁带机](#4功能03h-4)
        - [(5)、功能0FH—格式化ESDI驱动器定期中断](#5功能0fh)
        - [(6)、功能21H—读/写自检POST错误记录](#6功能21h)
        - [(7)、功能4FH—键盘截听](#7功能4fh)
        - [(8)、功能80H—设备打开](#8功能80h)
        - [(9)、功能81H—设备关闭](#9功能81h)
        - [(10)、功能82H—进程终止](#10功能82h)
        - [(11)、功能83H—事件等待](#11功能83h)
        - [(12)、功能84H—读游戏杆](#12功能84h)
        - [(13)、功能85H—系统请求SysReq键](#13功能85h)
        - [(14)、功能86H—延迟](#14功能86h)
        - [(15)、功能87H—移动扩展内存块](#15功能87h)
        - [(16)、功能88H—读取扩展内存大小](#16功能88h)
        - [(17)、功能89H—进入保护模式](#17功能89h)
        - [(18)、功能90H—设备等待](#18功能90h)
        - [(19)、功能91H—设备加电自检](#19功能91h)
        - [(20)、功能C0H—读取系统环境](#20功能0c0h)
        - [(21)、功能C1H—读取扩展BIOS数据区地址](#21功能c1h)
        - [(22)、功能C2H—鼠标图形](#22功能c2h)
        - [(23)、功能C3H—设置WatcHdog超时](#23功能c3h)
        - [(24)、功能C4H—可编程选项选择](#24功能c4h)
- [3. FAT32磁盘格式](#3-fat32磁盘格式)
    - [1.引导扇区的结构](#1引导扇区的结构)
    - [2.补充:拓展int 13h(支持读写大容量存储设备)](#2补充拓展int-13h支持读写大容量存储设备)
        - [2.1 检验扩展功能是否存在](#21-检验扩展功能是否存在)
        - [2.2 扩展读](#22-扩展读)
        - [2.3 扩展写](#23-扩展写)
        - [2.4 校验扇区](#24-校验扇区)
        - [2.5 锁定/解锁驱动器](#25-锁定解锁驱动器)
        - [2.6 弹出可移动驱动器中的介质](#26-弹出可移动驱动器中的介质)
        - [2.7 扩展定位](#27-扩展定位)
        - [2.8 取得驱动器参数](#28-取得驱动器参数)
        - [2.9 取得扩展驱动器介质更换检测线状态](#29-取得扩展驱动器介质更换检测线状态)
        - [2.10 Int 15h 可移动介质弹出支持](#210-int-15h-可移动介质弹出支持)

<hr/><br/>

# 1. 开发环境的配置
    (1)安装Vmware，作为测试用的虚拟机
    (2)使用U盘作为操作系统的启动盘(因为现在的计算机已经不支持软盘了)
    (3)使用nasm位置汇编语言的编译工具
    (4)使用WinHex将nasm编译好的二进制文件写入U盘或硬盘的1扇区中
    (5)Bochs虚拟机支持单步调试，但是不支持加载U盘；因此可以将代码放入Bochs中进行测试，确保代码没有bug后写入U盘运行
    暂时就用到这些工具...

# 2. BIOS中断表 

## 1. 显示服务(Video Service——INT 10H)

### (1)、功能00H
    功能描述：设置显示器模式
    入口参数：AH＝00H
    AL＝显示器模式，见下表所示
    出口参数：无
    可用的显示模式如下所列： 
    显示模式显示模式属性显示模式显示模式属性
    00H	40×25 16色 文本
    01H	40×25 16色 文本
    02H	80×25 16色 文本
    03H	80×25 16色 文本
    04H	320×200 4色
    05H	320×200 4色
    06H	640×200 2色
    07H	80×252色 文本
    08H	160×200 16色
    09H	320×200 16色
    0AH	640×200 4色
    0BH	保留　
    0CH	保留
    0DH	320×200 16色
    0EH	640×200 16色
    0FH	640×350 2(单色)
    10H	640×350 4色
    10H	640×350 16色
    11H	640×480 2色
    12H	640×480 16色
    13H	640×480 256色
    对于超级VGA显示卡，我们可用AX＝4F02H和下列BX的值来设置其显示模式。 
    BX显示模式属性BX显示模式属性
    100H	640×400 256色
    101H	640×480 256色
    102H	800×600 16色
    103H	800×600 256色
    104H	1024×768 16色
    105H	1024×768 256色
    106H	1280×1024 16色
    107H	1280×1024 256色
    108H	80×60文本模式
    109H	132×25文本模式
    10AH	132×43文本模式
    10BH	132×50文本模式
    10CH	132×60文本模式

### (2)、功能01H
    功能描述：设置光标形状
    入口参数：AH＝01H
    CH低四位＝光标的起始行
    CL低四位＝光标的终止行
    出口参数：无

### (3)、功能02H
    功能描述：用文本坐标下设置光标位置
    入口参数：AH＝02H
    BH＝显示页码
    DH＝行(Y坐标)
    DL＝列(X坐标)
    出口参数：无

### (4)、功能03H
    功能描述：在文本坐标下，读取光标各种信息
    入口参数：AH＝03H
    BH＝显示页码
    出口参数：CH＝光标的起始行
    CL＝光标的终止行
    DH＝行(Y坐标)
    DL＝列(X坐标)

### (5)、功能04H
    功能描述：获取当前状态和光笔位置
    入口参数：AH＝04H
    出口参数：AH＝00h——光笔未按下/未触发，01h——光笔已按下/已触发
    BX＝象素列(图形X坐标)
    CH＝象素行(图形Y坐标，显示模式：04H~06H)
    CX＝象素行(图形Y坐标，显示模式：0DH~10H)
    DH＝字符行(文本Y坐标)
    DL＝字符列(文本X坐标)

### (6)、功能05H
    功能描述：设置显示页，即选择活动的显示页
    入口参数：AH＝05H
    AL＝显示页
    对于CGA、EGA、MCGA和VGA，其显示页如下表所列： 模式页数显示器类型
    00H、01H0~7CGA、EGA、MCGA、VGA
    02H、03H0~3CGA
    02H、03H0~7EGA、MCGA、VGA
    07H0~7EGA、VGA
    0DH0~7EGA、VGA
    0EH0~3EGA、VGA
    0FH0~1EGA、VGA
    10H0~1EGA、VGA
    对于PCjr：
    AL＝80H——读取CRT/CPU页寄存器
    81H——设置CPU页寄存器
    82H——设置CRT页寄存器
    83H——设置CRT/CPU页寄存器
    BH＝CRT页(子功能号82H和83H)
    BL＝CPU页(子功能号81H和83H)
    出口参数：对于前者，无出口参数，但对PCjr在子功能80H~83H调用下，有：BH＝CRT页寄存器，BL＝CPU页寄存器

### (7)、功能06H和07H
    功能描述：初始化屏幕或滚屏
    入口参数：AH＝06H——向上滚屏，07H——向下滚屏
    AL＝滚动行数(0——清窗口)
    BH＝空白区域的缺省属性
    (CH、CL)＝窗口的左上角位置(Y坐标，X坐标)
    (DH、DL)＝窗口的右下角位置(Y坐标，X坐标)
    出口参数：无

### (8)、功能08H
    功能描述：读光标处的字符及其属性
    入口参数：AH＝08H
    BH＝显示页码
    出口参数：AH＝属性
    AL＝字符

### (9)、功能09H
    功能描述：在当前光标处按指定属性显示字符
    入口参数：AH＝09H
    AL＝字符
    BH＝显示页码
    BL＝属性(文本模式)或颜色(图形模式)
    CX＝重复输出字符的次数
    出口参数：无

### (10)、功能0AH
    功能描述：在当前光标处按原有属性显示字符
    入口参数：AH＝0AH
    AL＝字符
    BH＝显示页码
    BL＝颜色(图形模式，仅适用于PCjr)
    CX＝重复输出字符的次数
    出口参数：无

### (11)、功能0BH
    功能描述：设置调色板、背景色或边框
    入口参数：AH＝0BH
    设置颜色：BH＝00H，BL＝颜色
    选择调色板：BH＝01H，BL＝调色板(320×200、4种颜色的图形模式)
    出口参数：无

### (12)、功能0CH
    功能描述：写图形象素
    入口参数：AH＝0CH
    AL＝象素值
    BH＝页码
    (CX、DX)＝图形坐标列(X)、行(Y)
    出口参数：无

### (13)、功能0DH
    功能描述：读图形象素
    入口参数：AH＝0DH
    BH＝页码
    (CX、DX)＝图形坐标列(X)、行(Y)
    出口参数：AL＝象素值

### (14)、功能0EH
    功能描述：在Teletype模式下显示字符
    入口参数：AH＝0EH
    AL＝字符
    BH＝页码
    BL＝前景色(图形模式)
    出口参数：无

### (15)、功能0FH
    功能描述：读取显示器模式
    入口参数：AH＝0FH
    出口参数：AH＝屏幕字符的列数
    AL＝显示模式(参见功能00H中的说明)
    BH＝页码

### (16)、功能10H
    功能描述：颜色中断。其子功能说明如下： 功能号　子功能名称功能号　子功能名称
    00H — 设置调色板寄存器01H — 设置边框颜色
    02H — 设置调色板和边框03H — 触发闪烁/亮显位
    07H — 读取调色板寄存器08H — 读取边框颜色
    09H — 读取调色板和边框10H — 设置颜色寄存器
    12H — 设置颜色寄存器块13H — 设置颜色页状态
    15H — 读取颜色寄存器17H — 读取颜色寄存器块
    1AH — 读取颜色页状态1BH — 设置灰度值

### (17)、功能11H
    功能描述：字体中断。其子功能说明如下： 子功能号子功能名称
    00H装入用户字体和可编程控制器
    10H装入用户字体和可编程控制器
    01H装入8×14 ROM字体和可编程控制器
    11H装入8×14 ROM字体和可编程控制器
    02H装入8×8 ROM字体和可编程控制器
    12H装入8×8 ROM字体和可编程控制器
    03H设置块指示器
    04H装入8×16 ROM字体和可编程控制器
    14H装入8×16 ROM字体和可编程控制器
    20H设置INT 1Fh字体指针
    21H为用户字体设置INT 43h
    22H为8×14 ROM字体设置INT 43H
    23H为8×8 ROM字体设置INT 43H
    24H为8×16 ROM字体设置INT 43H
    30H读取字体信息

### (18)、功能12H
    功能描述：显示器的配置中断。其子功能说明如下： 功能号 功能名称 功能号 功能名称
    10H — 读取配置信息20H — 选择屏幕打印
    30H — 设置扫描行31H — 允许/禁止装入缺省调色板
    32H — 允许/禁止显示33H — 允许/禁止灰度求和
    34H — 允许/禁止光标模拟35H — 切换活动显示
    36H — 允许/禁止屏幕刷新

### (19)、功能13H
    功能描述：在Teletype模式下显示字符串
    入口参数：AH＝13H
    BH＝页码
    BL＝属性(若AL=00H或01H)
    CX＝显示字符串长度
    (DH、DL)＝坐标(行、列)
    ES:BP＝显示字符串的地址 AL＝显示输出方式
    0——字符串中只含显示字符，其显示属性在BL中。显示后，光标位置不变
    1——字符串中只含显示字符，其显示属性在BL中。显示后，光标位置改变
    2——字符串中含显示字符和显示属性。显示后，光标位置不变
    3——字符串中含显示字符和显示属性。显示后，光标位置改变
    出口参数：无

### (20)、功能1AH
    功能描述：读取/设置显示组合编码，仅PS/2有效，在此从略

### (21)、功能1BH
    功能描述：读取功能/状态信息，仅PS/2有效，在此从略

### (22)、功能1CH
    功能描述：保存/恢复显示器状态，仅PS/2有效，在此从略
## 2. 磁盘服务(Direct Disk Service——INT 13H)

### (1)、功能00H
    功能描述：磁盘系统复位
    入口参数：AH＝00H
    DL＝驱动器，00H~7FH：软盘；80H~0FFH：硬盘
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

### (2)、功能01H
    功能描述：读取磁盘系统状态
    入口参数：AH＝01H
    DL＝驱动器，00H~7FH：软盘；80H~0FFH：硬盘
    出口参数：AH＝00H，AL＝状态代码，其定义如下：
    00H — 无错
    01H — 非法命令
    02H — 地址目标未发现
    03H — 磁盘写保护(软盘)
    04H — 扇区未发现
    05H — 复位失败(硬盘)
    06H — 软盘取出(软盘)
    07H — 错误的参数表(硬盘)
    08H — DMA越界(软盘)
    09H — DMA超过64K界限
    0AH — 错误的扇区标志(硬盘)
    0BH — 错误的磁道标志(硬盘)
    0CH — 介质类型未发现(软盘)
    0DH — 格式化时非法扇区号(硬盘)
    0EH — 控制数据地址目标被发现(硬盘)
    0FH — DMA仲裁越界(硬盘)
    10H — 不正确的CRC或ECC编码
    11H — ECC校正数据错(硬盘)
        CRC:Cyclic Redundancy Check code
        ECC:Error Checking & Correcting code
    20H — 控制器失败
    40H — 查找失败
    80H — 磁盘超时(未响应)
    AAH — 驱动器未准备好(硬盘)
    BBH — 未定义的错误(硬盘)
    CCH — 写错误(硬盘)
    E0H — 状态寄存器错(硬盘)
    FFH — 检测操作失败(硬盘)

### (3)、功能02H
    功能描述：读扇区
    入口参数：AH＝02H
    AL＝扇区数
    CH＝柱面
    CL＝扇区
    DH＝磁头
    DL＝驱动器，00H~7FH：软盘；80H~0FFH：硬盘
    ES:BX＝缓冲区的地址
    出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

### (4)、功能03H
    功能描述：写扇区
    入口参数：AH＝03H
    AL＝扇区数
    CH＝柱面
    CL＝扇区
    DH＝磁头
    DL＝驱动器，00H~7FH：软盘；80H~0FFH：硬盘
    ES:BX＝缓冲区的地址
    出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

### (5)、功能04H
    功能描述：检验扇区
    入口参数：AH＝04H
    AL＝扇区数
    CH＝柱面
    CL＝扇区
    DH＝磁头
    DL＝驱动器，00H~7FH：软盘；80H~0FFH：硬盘
    ES:BX＝缓冲区的地址
    出口参数：CF＝0——操作成功，AH＝00H，AL＝被检验的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

### (6)、功能05H
    功能描述：格式化磁道
    入口参数：AH＝05H
    AL＝交替(Interleave)
    CH＝柱面
    DH＝磁头
    DL＝驱动器，00H~7FH：软盘；80H~0FFH：硬盘
    ES:BX＝地址域列表的地址
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

### (7)、功能06H
    功能描述：格式化坏磁道
    入口参数：AH＝06H
    AL＝交替
    CH＝柱面
    DH＝磁头
    DL＝80H~0FFH：硬盘
    ES:BX＝地址域列表的地址
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

### (8)、功能07H
    功能描述：格式化驱动器
    入口参数：AH＝07H
    AL＝交替
    CH＝柱面
    DL＝80H~0FFH：硬盘
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

### (9)、功能08H
    功能描述：读取驱动器参数
    入口参数：AH＝08H
    DL＝驱动器，00H~7FH：软盘；80H~0FFH：硬盘
    出口参数：CF＝1——操作失败，AH＝状态代码，参见功能号01H中的说明，否则， BL
    ＝01H — 360K
    ＝02H — 1.2M
    ＝03H — 720K
    ＝04H — 1.44M
    CH＝柱面数的低8位
    CL的位7-6＝柱面数的该2位
    CL的位5-0＝扇区数
    DH＝磁头数
    DL＝驱动器数
    ES:DI＝磁盘驱动器参数表地址

### (10)、功能09H
    功能描述：初始化硬盘参数
    入口参数：AH＝09H
    DL＝80H~0FFH：硬盘(还有有关参数表问题，在此从略)
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态代码，参见功能号01H中的说明

### (11)、功能0AH
    功能描述：读长扇区，每个扇区随带四个字节的ECC编码
    入口参数：AH＝0AH
    AL＝扇区数
    CH＝柱面
    CL＝扇区
    DH＝磁头
    DL＝80H~0FFH：硬盘
    ES:BX＝缓冲区的地址
    出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

### (12)、功能0BH
    功能描述：写长扇区，每个扇区随带四个字节的ECC编码
    入口参数：AH＝0BH
    AL＝扇区数
    CH＝柱面
    CL＝扇区
    DH＝磁头
    DL＝80H~0FFH：硬盘
    ES:BX＝缓冲区的地址
    出口参数：CF＝0——操作成功，AH＝00H，AL＝传输的扇区数，否则，AH＝状态代码，参见功能号01H中的说明

### (13)、功能0CH
    功能描述：查寻
    入口参数：AH＝0CH
    CH＝柱面的低8位
    CL(7-6位)
## 3. 串行口服务(Serial Port Service——INT 14H) 

### (1)、功能00H
    功能描述：初始化通信口
    入口参数：AH＝00H
    DX＝初始化通信口号(0＝COM1，1＝COM2，……)
    AL＝初始化参数，参数的说明如下： 波特率奇偶位停止位字的位数
    76543210
    000 = 110X0 = None0 = 1 bit10 = 7 bits
    001 = 15001 = Odd1 = 2 bits11 = 8 bits
    010 = 30011 = Even
    011 = 600
    100 = 1200
    101 = 2400
    110 = 4800
    111 = 9600
    对于PS/2，可用INT 14H之功能04H和05H来初始化其通信速率大于9600。
    出口参数：AH＝通信口状态，各状态位为1时的含义如下： 位7—超时
    位6—传递移位寄存器为空
    位5—传递保持寄存器为空
    位4—发现终止位3—发现帧错误
    位2—发现奇偶错
    位1—发现越界错
    位0—接受数据准备好
    AL＝Modem状态
    位7—接受单线信号诊断
    位6—环指示器
    位5—数据发送准备好
    位4—清除数据，再发送位3—改变在接受线上的信号诊断
    位2—后边界环指示器
    位1—改变“数据准备好”状态
    位0—改变“清除—发送”状态

### (2)、功能01H
    功能描述：向通信口输出字符
    入口参数：AH＝01H
    AL＝字符
    DX＝初始化通信口号(0＝COM1，1＝COM2，……)
    出口参数：AL的值不变
    AH的位7＝0——操作成功，通信口状态，AH的位6~0是其状态位

### (3)、功能02H
    功能描述：从通信口读入字符
    入口参数：AH＝02H
    DX＝初始化通信口号(0＝COM1，1＝COM2，……)
    出口参数：AL＝接受的字符
    AH的位7＝0——操作成功，通信口状态，AH的位6~0是其状态位

### (4)、功能03H
    功能描述：读取通信口状态
    入口参数：AH＝03H
    DX＝初始化通信口号(0＝COM1，1＝COM2，……)
    出口参数：AH＝通信口状态，AL＝Modem状态，参见功能号00H中的说明

### (5)、功能04H
    功能描述：扩充初始化通信口，仅在PS/2中有效，在此从略
## 4. 键盘服务(Keyboard Service——INT 16H) 

### (1)、功能00H和10H
    功能描述：从键盘读入字符
    入口参数：AH＝00H——读键盘
    ＝10H——读扩展键盘，可根据0000:0496H单元的内容判断：扩展键盘是否有效
    出口参数：AH＝键盘的扫描码
    AL＝字符的ASCII码

### (2)、功能01H和11H
    功能描述：读取键盘状态
    入口参数：AH＝01H——检查普通键盘
    ＝11H——检查扩展键盘
    出口参数：ZF＝1——无字符输入，否则，AH＝键盘的扫描码，AL＝ASCII码。

### (3)、功能02H和12H
    功能描述：读取键盘标志
    入口参数：AH＝02H——普通键盘的移位标志
    ＝12H——扩展键盘的移位标志
    出口参数：AL＝键盘标志(02H和12H都有效)，其各位之值为1时的含义如下： 位7—INS开状态位3—ALT键按下
    位6—CAPS LOCK开状态位2—CTRL键按下
    位5—NUM LOCK开状态位1—左SHIFT键按下
    位4—SCROLL LOCK开状态位0—右SHIFT键按下
    AH＝扩展键盘的标志(12H有效)，其各位之值为1时的含义如下：
    位7—SysReq键按下位3—右ALT键按下
    位6—CAPS LOCK键按下位2—右CTRL键按下
    位5—NUM LOCK键按下位1—左ALT键按下
    位4—SCROLL键按下位0—左CTRL键按下

### (4)、功能03H
    功能描述：设置重复率
    入口参数：AH＝03H 对于PC/AT和PS/2：AL＝05H
    BH＝重复延迟
    BL＝重复率
    对于PCjr：AL＝00H——装入缺省的速率和延迟
    ＝01H——增加初始延迟
    ＝02H——重复频率降低一半
    ＝03H——增加延迟和降低一半重复频率
    ＝04H——关闭键盘重复功能
    出口参数：无

### (5)、功能04H
    功能描述：设置键盘点击
    入口参数：AH＝04H AL＝00H——关闭键盘点击功能
    ＝01H——打开键盘点击功能
    出口参数：无

### (6)、功能05H
    功能描述：字符及其扫描码进栈
    入口参数：AH＝05H
    CH＝字符的描述码
    CL＝字符的ASCII码
    出口参数：CF＝1——操作成功，AL＝00H，否则，AL＝01H
## 5. 杂项系统服务(Miscellaneous System Service——INT 15H)

### (1)、功能00H
    功能描述：开盒式磁带机马达
    入口参数：AH＝00H
    出口参数：CF＝0——操作成功，否则，AH＝状态(86H，若未安装盒式磁带机)

### (2)、功能01H
    功能描述：关盒式磁带机马达
    入口参数：AH＝01H
    出口参数：CF＝0——操作成功，否则，AH＝状态(86H，若未安装盒式磁带机)

### (3)、功能02H
    功能描述：读盒式磁带机
    入口参数：AH＝02H
    CX＝读入的字节数
    ES:BX＝存放数据的缓冲区地址
    出口参数：CF＝0——操作成功，DX＝实际读入的字节数，ES:BX指向最后一个字节的后面地址，否则，AH＝状态码，其值含义如下： 01H
    —— CRC校验码错80H —— 非法命令
    02H —— 位信号混乱86H —— 未安装盒式磁带机
    04H —— 无发现数据

### (4)、功能03H
    功能描述：写盒式磁带机
    入口参数：AH＝03H
    CX＝要写入的字节数
    ES:BX＝已存数据的缓冲区地址
    出口参数：CF＝0——操作成功，CX＝00H，ES:BX指向最后一个字节的后面地址，否则，AH＝状态码，其值含义如下： 80H ——
    非法命令86H —— 未安装盒式磁带机

### (5)、功能0FH
    功能描述：格式化ESDI驱动器定期中断，仅在PS/2中有效，在此从略

### (6)、功能21H
    功能描述：读/写自检(POST)错误记录，仅在PS/2中有效，在此从略

### (7)、功能4FH
    功能描述：键盘截听，仅在PS/2中有效，在此从略

### (8)、功能80H
    功能描述：打开设备
    入口参数：AH＝80H
    BX＝设备号
    CX＝进程号
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态码

### (9)、功能81H
    功能描述：关闭设备
    入口参数：AH＝81H
    BX＝设备号
    CX＝进程号
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态码

### (10)、功能82H
    功能描述：进程终止
    入口参数：AH＝81H
    BX＝进程号
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态码

### (11)、功能83H
    功能描述：事件等待
    入口参数：AH＝83H 若需要事件等待，则：AL＝00H
    CX:DX＝千分秒
    ES:BX＝信号量字节的地址
    否则，调用参数为AL＝01H
    出口参数：若调用时，AL＝00H，操作成功——CF＝0，否则，CF＝1

### (12)、功能84H
    功能描述：读游戏杆
    入口参数：AH＝84H
    DX＝00H——读取开关设置
    　＝01H——读取阻力输入
    出口参数：CF＝1H——操作失败，否则，
    　DX＝00H时，AL＝开关设置(位7～4)
    　DX＝01H时，AX、BX、CX和DX分别为A(x)、A(y)、B(x)和B(y)的值

### (13)、功能85H
    功能描述：系统请求(SysReq)键
    入口参数：AH＝85H
    AL＝00H——键按下
    　＝01H——键放开
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态码

### (14)、功能86H
    功能描述：延迟
    入口参数：AH＝86H
    CX:DX＝千分秒
    出口参数：CF＝0——操作成功，AH＝00H

### (15)、功能87H
    功能描述：从常规内存和扩展内存之间移动扩展内存块
    入口参数：AH＝87H
    CX＝移动的字数
    ES:SI＝GDT(Global Descriptor Table)的地址，其结构定义如下： 偏移量存储的信息
    00h-0Fh保留，但现全为0
    10h-11h段的长度(2CX-1或更大)
    12h-14h24位源地址
    15h访问权限字节(其值为93h)
    16h-17h保留，但现全为0
    18h-19h段的长度(2CX-1或更大)
    1Ah-1Ch 24位目标源地址
    1Dh访问权限字节(其值为93h)
    1Eh-2Fh保留，但现全为0
    出口参数：CF＝0——操作成功，AH＝00H，否则，AH＝状态码，其含义如下：
    　　01H —— RAM奇偶错
    　　02H —— 异常中断错
    　　03H —— 20号线门地址失败

### (16)、功能88H
    功能描述：读取扩展内存大小
    入口参数：AH＝88H
    出口参数：AX＝扩展内存字节数(以K为单位)

### (17)、功能89H
    功能描述：进入保护模式，CPU从实模式进入保护模式
    入口参数：AH＝89H
    BH＝IRQ0的中断号
    BL＝IRQ8的中断号
    ES:SI＝GDT的地址(参见功能号87H)
    出口参数：CF＝1——操作失败，AH＝0FFH，否则，AH＝00H，CS、DS、ES和SS都是用户定义的选择器

### (18)、功能90H
    功能描述：设备等待
    入口参数：AH＝90H AL＝驱动器类型，具体的驱动器类型定义如下：
    ＝00H~7FH——串行再重用设备
    ＝80H~0BFH——可重入式设备
    ＝0C0H~0FFH——等待访问设备，没有自检功能
    00h — 磁盘
    02h — 键盘
    80h — 网络
    FDh — 软盘马达启动01h — 软盘
    03h — 点设备(Pointing Device)
    FCh — 硬盘复位
    FEh — 打印机
    ES:BX＝对驱动器类型80H~0FFH的请求块地址
    出口参数：CF＝1——操作失败，否则，AH＝00H

### (19)、功能91H
    功能描述：设备加电自检
    入口参数：AH＝91H
    AL＝00H~7FH——串行再重用设备
    　＝80H~0BFH——可重入式设备
    出口参数：AH＝00H

### (20)、功能0C0H
    功能描述：读取系统环境
    入口参数：AH＝0C0H
    出口参数：ES:BX＝配置表地址，配置表的定义如下： 偏移量含义说明
    00h-01h表的大小(字节数)
    02h系统模型
    03h系统子模型
    04hBIOS版本号
    05h配置标志，其各位为1时的说明如下：
    　　位7—DMA通道3使用
    　　位6—存在从属8259
    　　位5—实时时钟有效
    　　位4—键盘截听有效
    　　位3—等待外部事件有效
    　　位2—扩展BIOS数据区
    　　位1—微通道设施
    　　位0—保留
    06h-09h保留

### (21)、功能C1H
    功能描述：读取扩展BIOS数据区地址，仅在PS/2中有效，在此从略

### (22)、功能C2H
    功能描述：鼠标图形，仅在PS/2中有效，在此从略

### (23)、功能C3H
    功能描述：设置WatcHdog超时，仅在PS/2中有效，在此从略

### (24)、功能C4H
    功能描述：可编程选项选择，仅在PS/2中有效，在此从略

# 3. FAT32磁盘格式
## 1.引导扇区的结构
        硬盘中第一个扇区的前446个字节叫做MBR(Main Boot Record，主引导记录)保存了FAT32文件系统的引导扇区结构表和操作系统的引导程序，剩余的部分叫做EBR(Extended Boot Record，扩展分区引导记录)保存着硬盘的分区记录。
        以下是FAT32引导扇区结构表和对应的图片(图片是为了便于理解)：
        注：图片中查看硬盘二进制数据的软件叫DiskGenius
名称|起始地址|大小|说明
:--:|:--:|:--:|:--:
BPB_BytsPerSec|11|2|描述每个sector多少byte,通常为512（向前兼容），也可以取值为1024,2048,4096,注：如果设备有物理sector为N且N大于512,那么取值为N但是不能超过4096  
BPB_SecPerClus|13|1|表明每个cluster有多少个sector，通常为2的整数次幂，但是一个cluster通常不会超过32K  
BPB_RsvdSecCnt|14|2|在Reserved region里保留sector的个数，对于FAT12 FAT16此值为1，对于FAT32此值为32  
BPB_NumFATs|16|1|FAT data structure的个数，通常为2，FAT1和FAT2，安全性互为备份的关系  
BPB_RootEntCnt|17|2|对于FAT32此值为0，对于FAT12和FAT16，此值含义是32byte根目录入口的个数  
BPB_TotSec16|19|2|对于FAT12和FAT16，此值表示的是整个fatimg里sector的个数，对于FAT32此值为0，整个fatimg里sector的个数在offset 32长度为4的范围里表示。  
BPB_Media|21|1|0Xf8表示的是non-removable media,0XF0表示的是removable media，该值要和FAT[0]的低位相同  
BPB_FATSz16|22|2|对于FAT12和FAT16，表明的是一个FAT占用sector的大小，对于FAT32，此值为0  
BPB_SecPerTrk|24|2|每个磁道的扇区数量(这只是为了方便int 13h读取，在逻辑上划分的磁道，U盘和固态硬盘采用ROM芯片存储数据，没有磁道、磁头、柱面)
BPB_NumHeads|26|2|磁头数量(也是假的，没有真正的磁头)
BPB_HiddSec|28|4|对于不带分区的设备，此值为0，对于其他的，此值的含义是在partition前的隐藏sector的个数  
BPB_TotSec32|32|4|对于FAT32表明的是整个设备的sector的个数。不包含之前的MBR  
BPB_FATSz32|36|4|一个FAT表占用的sector的个数，FAT32有两个FAT表，互为备份关系，FAT12和FAT16该项内容为空。  
BPB_ExtFlags|40|2|Bit7为0表示的是在运行的时候FAT表1和FAT表2是互为镜像的，bit7为1表示在运行的时候只有一个FAT表是活动的，FAT12和FAT16该项内容为空。 
BPB_FSVer|42|2|此域为 FAT32 特有，高位为 FAT32 的主版本号，低位为次版本号，这个版本号是为了以后更高级的 FAT 版本考虑，假设当前的操作系统只能支持的 FAT32 版本号为 0.0。那么该操作系统检测到此域不为 0 时，它便会忽略 FAT 卷，因为它的版本号比系统能支持的版式本要高
BPB_RootClus|44|4|根目录所在cluster的cluster的序号，通常为2，即Data region的第二个cluster是根目录，这样从cluster2就可以方便找到根目录(个人理解cluster是从Data region开始算起)  
BPB_FSInfo|48|2|表明了fsinfo占用的sector的个数  
BPB_BkBootSec|50|2|Reserved area里对boot sector备份的个数。  
BPB_Reserved|52|12|保留将来扩展使用  
BS_DrvNum|64|1|  
BS_FilSysType|82|8|FAT32通常设置为字符串“FAT32”  
boot.bin|90|420|我们之前写的操作系统引导程序就存放在这里
结尾|510|2|固定值 0X55 AA，这个固定值一定偏移是510位置，不随sector的改变而改变。注意:如果没有这个结尾标识，BIOS将不会读取其中的引导程序

![FAT32引导扇区结构表](https://github.com/gzh205/MyOsStudy/blob/master/imgs/diskgeneric.jpg)
## 2.补充:拓展int 13h(支持读写大容量存储设备)
        在老式硬盘中, 由于每个磁道的扇区数相等, 所以外道的记录密度要远低于内道, 因此会浪费很多磁盘(与软盘一样)。为了解决这一问题, 进一步提高硬盘容量, 人们改用等密度结构生产硬盘。也就是说, 外圈道的扇区比内圈磁道多。采用这种结构后, 硬盘不再具有实际的3D参数, 寻址方式也改为线性寻址, 即以扇为单位进行寻址。
        为了与使用3D寻址的老软件兼容 (如使用BIOS Int13H接口的软件), 在硬盘控制器内部安装了一个地址翻译器, 由它负责将老式3D参数翻译成新的线性参数。这也是为什么现在硬盘的3D参数可以有多种选择的原因 (不同的工作模式, 对应不同的3D参数, 如 LBA, LARGE, NORMAL)。
        虽然现代硬盘都已经采用了线性寻址, 但是由于基本 Int 13H 的制约, 使用 BIOS Int 13H 接口的程序, 如DOS 等还只能访问 8 G 以内的硬盘空间。为了打破这一限制, Microsoft 等几家公司制定了扩展 Int 13H 准(Extended Int13H), 采用线性寻址方式存取硬盘, 所以突破了 8 G 的限制,而且还加入了对可拆卸介质 (如活动硬盘) 的支持。
### 2.1 检验扩展功能是否存在
    入口:
        AH = 41h
        BX = 55AAh
        DL = 驱动器号
    返回:
        CF = 0
           AH = 扩展功能的主版本号
           AL = 内部使用
           BX = AA55h
           CX = API 子集支持位图
        CF = 1
           AH = 错误码 01h, 无效命令
### 2.2 扩展读
    入口:
        AH = 42h
        DL = 驱动器号
        DS:DI = 磁盘地址数据包(Disk Address Packet)
    返回:
        CF = 0, AH = 0 成功
        CF = 1, AH = 错误码
        这个调用将磁盘上的数据读入内存. 如果出现错误, DAP 的 BlockCount
    项中则记录了出错前实际读取的数据块个数.
### 2.3 扩展写
    入口:
        AH = 43h
        AL
           0 位 = 0 关闭写校验
                  1 打开写校验
           1 - 7 位保留, 置 0
        DL = 驱动器号
        DS:DI = 磁盘地址数据包(DAP)
    返回:
        CF = 0, AH = 0 成功
        CF = 1, AH = 错误码
        这个调用将内存中的数据写入磁盘. 如果打开了写校验选项, 但 BIOS
    不支持, 则会返回错误码 AH = 01h, CF = 1. 功能 48h 可以检测BIOS是否
    支持写校验.
        如果出现错误, DAP 的 BlockCount 项中则记录了出错前实际写入的数
    据块个数.
### 2.4 校验扇区
    入口:
        AH = 44h
        DL = 驱动器号
        DS:DI = 磁盘地址数据包(Disk Address Packet)
    返回:
        CF = 0, AH = 0 成功
        CF = 1, AH = 错误码
        这个调用校验磁盘数据, 但并不将数据读入内存.如果出现错误, DAP 的
    BlockCount 项中则记录了出错前实际校验的数据块个数.
### 2.5 锁定/解锁驱动器
    入口:
        AH = 45h
        AL
            = 0 锁定驱动器
            = 1 驱动器解锁
            = 02 返回锁定/解锁状态
            = 03h-FFh - 保留
        DL = 驱动器号
    返回:
        CF = 0, AH = 0 成功
        CF = 1, AH = 错误码
        这个调用用来缩定指定驱动器中的介质.
        所有标号大于等于 0x80 的可移动驱动器必须支持这个功能. 如果
    在支持可移动驱动器控制功能子集的固定驱动器上使用这个功能调用, 将
    会成功返回.
        驱动器必须支持最大255次锁定, 在所有锁定被解锁之前, 不能在物理上
    将驱动器解锁. 解锁一个未锁定的驱动器,将返回错误码 AH= B0h. 如果锁定一
    个已锁定了255次的驱动器, 将返回错误码 AH = B4h.
        锁定一个没有介质的驱动器是合法的.
### 2.6 弹出可移动驱动器中的介质
    入口:
        AH = 46h
        AL = 0 保留
        DL = 驱动器号
    返回:
        CF = 0, AH = 0 成功
        CF = 1, AH = 错误码
        这个调用用来弹出指定的可移动驱动器中的介质.
        所有标号大于等于 0x80 的可移动驱动器必须支持这个功能. 如果
    在支持可移动驱动器控制功能子集的固定驱动器上使用这个功能调用, 将
    会返回错误码 AH = B2h (介质不可移动). 如果试图弹出一个被锁定的介质
    将返回错误码 AH = B1h (介质被锁定).
        如果试图弹出一个没有介质的驱动器, 则返回错误码 Ah = 31h (驱动器
    中没有介质).
        如果试图弹出一个未锁定的可移动驱动器中的介质, Int13h会调用 Int15h
    (AH = 52h) 来检查弹出请求能否执行. 如果弹出请求被拒绝则返回错误码(同
    Int15h). 如果弹出请求被接受,但出现了其他错误, 则返回错误码 AH = B5h.
### 2.7 扩展定位
    入口:
        AH = 47h
        DL = 驱动器号
        DS:DI = 磁盘地址数据包(Disk Address Packet)
    返回:
        CF = 0, AH = 0 成功
        CF = 1, AH = 错误码
        这个调用将磁头定位到指定扇区.
### 2.8 取得驱动器参数
    入口:
        AH = 48h
        DL = 驱动器号
        DS:DI = 返回数据缓冲区地址
    返回:
        CF = 0, AH = 0 成功
            DS:DI 驱动器参数数据包地址, (参见前面的文章)
        CF = 1, AH = 错误码
        这个调用返回指定驱动器的参数.
### 2.9 取得扩展驱动器介质更换检测线状态
    入口:
        AH = 49h
        DL = 驱动器号
    返回:
        CF = 0, AH = 0  介质未更换
        CF = 1, AH = 06h 介质可能已更换
        这个调用返回指定驱动器的介质更换状态.
        这个调用与 Int13h AH = 16h 子功能调用相同, 只是允许任何驱动器
    标号. 如果对一台支持可移动介质功能子集的固定驱动器使用此功能,则永远
    返回 CF = 0, AH = 0.
        简单地将可移动介质锁定再解锁就可以激活检测线, 而无须真正更换介质.
### 2.10 Int 15h 可移动介质弹出支持
    入口:
        AH = 52h
        DL = 驱动器号
    返回:
        CF = 0, AH = 0 弹出请求可能可以执行
        CF = 1, AH = 错误码 B1h 或 B3h  弹出请求不能执行
        这个调用是由 Int13h AH=46h 弹出介质功能调用内部使用的.
# 4. 处理器体系结构
## 1.从实模式进入保护模式
### 1.1 开启A20功能
    使用A20快速门开启A20功能：A20快速门使用I/O端口0x92来处理A20信号线。对于不含键盘控制器的操作系统，就只能使用0x92端口来控制，但是该端口有可能被其他设备使用。
示例代码：
    in al,92h
    or al,10b
    out 92h,al

### 1.2 开启保护模式
    当A20开启后，接着使用指令CLI关闭外部中断，再通过指令LGDT加载保护模式结构数据信息，并置位CR0寄存器的第0位来开启保护模式。当进入保护模式后，为FS寄存器加载新的数据段值，一旦完成数据加载就从保护模式退出，并开启外部中断。
示例代码：
    cli
    db 0x66
    lgdt [GdtPtr]
    mov eax,cr0
    or eax,1
    mov cr0,eax
    mov ax,SelectorData32
    mov fs,ax
    and al,11111110b
    mov cr0,eax
    sti