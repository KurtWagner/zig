const builtin = @import("builtin");
const std = @import("../../std.zig");
const maxInt = std.math.maxInt;
const linux = std.os.linux;
const SYS = linux.SYS;
const socklen_t = linux.socklen_t;
const iovec = std.posix.iovec;
const iovec_const = std.posix.iovec_const;
const uid_t = linux.uid_t;
const gid_t = linux.gid_t;
const pid_t = linux.pid_t;
const sockaddr = linux.sockaddr;
const timespec = linux.timespec;

pub fn syscall0(number: SYS) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
        : "$1", "$3", "$4", "$5", "$6", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall_pipe(fd: *[2]i32) usize {
    return asm volatile (
        \\ .set noat
        \\ .set noreorder
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ nop
        \\ b 2f
        \\ subu $2, $0, $2
        \\ 1:
        \\ sw $2, 0($4)
        \\ sw $3, 4($4)
        \\ 2:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(SYS.pipe)),
          [fd] "{$4}" (fd),
        : "$1", "$3", "$5", "$6", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall1(number: SYS, arg1: usize) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ nop
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
          [arg1] "{$4}" (arg1),
        : "$1", "$3", "$5", "$6", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall2(number: SYS, arg1: usize, arg2: usize) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
          [arg1] "{$4}" (arg1),
          [arg2] "{$5}" (arg2),
        : "$1", "$3", "$6", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall3(number: SYS, arg1: usize, arg2: usize, arg3: usize) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
          [arg1] "{$4}" (arg1),
          [arg2] "{$5}" (arg2),
          [arg3] "{$6}" (arg3),
        : "$1", "$3", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall4(number: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
          [arg1] "{$4}" (arg1),
          [arg2] "{$5}" (arg2),
          [arg3] "{$6}" (arg3),
          [arg4] "{$7}" (arg4),
        : "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall5(number: SYS, arg1: usize, arg2: usize, arg3: usize, arg4: usize, arg5: usize) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
          [arg1] "{$4}" (arg1),
          [arg2] "{$5}" (arg2),
          [arg3] "{$6}" (arg3),
          [arg4] "{$7}" (arg4),
          [arg5] "{$8}" (arg5),
        : "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall6(
    number: SYS,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
          [arg1] "{$4}" (arg1),
          [arg2] "{$5}" (arg2),
          [arg3] "{$6}" (arg3),
          [arg4] "{$7}" (arg4),
          [arg5] "{$8}" (arg5),
          [arg6] "{$9}" (arg6),
        : "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn syscall7(
    number: SYS,
    arg1: usize,
    arg2: usize,
    arg3: usize,
    arg4: usize,
    arg5: usize,
    arg6: usize,
    arg7: usize,
) usize {
    return asm volatile (
        \\ syscall
        \\ beq $7, $zero, 1f
        \\ blez $2, 1f
        \\ dsubu $2, $0, $2
        \\ 1:
        : [ret] "={$2}" (-> usize),
        : [number] "{$2}" (@intFromEnum(number)),
          [arg1] "{$4}" (arg1),
          [arg2] "{$5}" (arg2),
          [arg3] "{$6}" (arg3),
          [arg4] "{$7}" (arg4),
          [arg5] "{$8}" (arg5),
          [arg6] "{$9}" (arg6),
          [arg7] "{$10}" (arg7),
        : "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn clone() callconv(.naked) usize {
    // __clone(func, stack, flags, arg, ptid, tls, ctid)
    //         3,    4,     5,     6,   7,    8,   9
    //
    // syscall(SYS_clone, flags, stack, ptid, tls, ctid)
    //         2          4,     5,     6,    7,   8
    asm volatile (
        \\ # Save function pointer and argument pointer on new thread stack
        \\ and $5, $5, -16
        \\ dsubu $5, $5, 16
        \\ sd $4, 0($5)
        \\ sd $7, 8($5)
        \\ # Shuffle (fn,sp,fl,arg,ptid,tls,ctid) to (fl,sp,ptid,tls,ctid)
        \\ move $4, $6
        \\ move $6, $8
        \\ move $7, $9
        \\ move $8, $10
        \\ li $2, 5055 # SYS_clone
        \\ syscall
        \\ beq $7, $0, 1f
        \\ nop
        \\ jr $ra
        \\ dsubu $2, $0, $2
        \\1:
        \\ beq $2, $0, 1f
        \\ nop
        \\ jr $ra
        \\ nop
        \\1:
    );
    if (builtin.unwind_tables != .none or !builtin.strip_debug_info) asm volatile (
        \\ .cfi_undefined $ra
    );
    asm volatile (
        \\ move $fp, $zero
        \\ move $ra, $zero
        \\
        \\ ld $25, 0($sp)
        \\ ld $4, 8($sp)
        \\ jalr $25
        \\ nop
        \\ move $4, $2
        \\ li $2, 5058 # SYS_exit
        \\ syscall
    );
}

pub fn restore() callconv(.naked) noreturn {
    asm volatile (
        \\ syscall
        :
        : [number] "{$2}" (@intFromEnum(SYS.rt_sigreturn)),
        : "$1", "$3", "$4", "$5", "$6", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub fn restore_rt() callconv(.naked) noreturn {
    asm volatile (
        \\ syscall
        :
        : [number] "{$2}" (@intFromEnum(SYS.rt_sigreturn)),
        : "$1", "$3", "$4", "$5", "$6", "$7", "$8", "$9", "$10", "$11", "$12", "$13", "$14", "$15", "$24", "$25", "hi", "lo", "memory"
    );
}

pub const F = struct {
    pub const DUPFD = 0;
    pub const GETFD = 1;
    pub const SETFD = 2;
    pub const GETFL = 3;
    pub const SETFL = 4;

    pub const SETOWN = 24;
    pub const GETOWN = 23;
    pub const SETSIG = 10;
    pub const GETSIG = 11;

    pub const GETLK = 33;
    pub const SETLK = 34;
    pub const SETLKW = 35;

    pub const RDLCK = 0;
    pub const WRLCK = 1;
    pub const UNLCK = 2;

    pub const SETOWN_EX = 15;
    pub const GETOWN_EX = 16;

    pub const GETOWNER_UIDS = 17;
};

pub const VDSO = struct {
    pub const CGT_SYM = "__vdso_clock_gettime";
    pub const CGT_VER = "LINUX_2.6";
};

pub const Flock = extern struct {
    type: i16,
    whence: i16,
    __pad0: [4]u8,
    start: off_t,
    len: off_t,
    pid: pid_t,
    __unused: [4]u8,
};

pub const blksize_t = u32;
pub const nlink_t = u32;
pub const time_t = i32;
pub const mode_t = u32;
pub const off_t = i64;
pub const ino_t = u64;
pub const dev_t = u64;
pub const blkcnt_t = i64;

// The `stat` definition used by the Linux kernel.
pub const Stat = extern struct {
    dev: dev_t,
    __pad0: [2]u32, // -1 because our dev_t is u64 (kernel dev_t is really u32).
    ino: ino_t,
    mode: mode_t,
    nlink: nlink_t,
    uid: uid_t,
    gid: gid_t,
    rdev: dev_t,
    __pad1: [2]u32, // -1 because our dev_t is u64 (kernel dev_t is really u32).
    size: off_t,
    atim: u32,
    atim_nsec: u32,
    mtim: u32,
    mtim_nsec: u32,
    ctim: u32,
    ctim_nsec: u32,
    blksize: blksize_t,
    __pad3: u32,
    blocks: blkcnt_t,

    pub fn atime(self: @This()) timespec {
        return .{
            .sec = self.atim,
            .nsec = self.atim_nsec,
        };
    }

    pub fn mtime(self: @This()) timespec {
        return .{
            .sec = self.mtim,
            .nsec = self.mtim_nsec,
        };
    }

    pub fn ctime(self: @This()) timespec {
        return .{
            .sec = self.ctim,
            .nsec = self.ctim_nsec,
        };
    }
};

pub const timeval = extern struct {
    sec: isize,
    usec: isize,
};

pub const timezone = extern struct {
    minuteswest: i32,
    dsttime: i32,
};

pub const Elf_Symndx = u32;

/// TODO
pub const ucontext_t = void;

/// TODO
pub const getcontext = {};
