; Prelude
target triple = "arm64-apple-macosx12.0.0"
%bool = type i64 ; used to be i8, this is just to simplify interfaces
%num = type i64
%struct.builtin.str = type { i8*, i64 } ; (ptr, len)
%struct.builtin.any = type { i8*, i64 } ; (ptr, type)
%struct.builtin.list = type { i8*, i64, i64 } ; (ptr, len, cap)
%struct.builtin.dict = type { %struct.builtin.dict_eles*, i64, i64, i1 (i64, i64)* } ; (eles, len, cap, eql)

%struct.builtin.dict_eles = type { i64, i64 }
%struct.builtin.io = type { %struct.builtin.str*, %struct.builtin.str*, i8* } ; (name, mode, file)

; Number builtins
declare %struct.builtin.str* @num_to_str(%num %0) 
declare %num @powll(%num %0, %num %1)

; List builtins builtins
declare %struct.builtin.list* @allocate_list(i64 %0) 
declare %struct.builtin.list* @concat_lists(%struct.builtin.list* %0, %struct.builtin.list* %1)
declare %struct.builtin.list* @repeat_list(%struct.builtin.list* %0, %num %1)
declare %bool @insert_into_list(%struct.builtin.list* %0, i64 %1, i8* %2)
declare %bool @delete_from_list(%struct.builtin.list* %0, i8* %1, i64 %2)
declare void @push_into_list(%struct.builtin.list* %0, i8* %1)
declare void @pop_from_list(%struct.builtin.list* %0, i8* %1)

; Dict builtins builtins
declare %struct.builtin.dict* @allocate_dict(i64 %0, i1 (i64,i64)* %1) 
declare i1 @fetch_from_dict(%struct.builtin.dict* %0, i8* %1, i8* %2)
declare void @insert_into_dict(%struct.builtin.dict* %0, i8* %1, i8* %2)
declare i1 @has_key(%struct.builtin.dict* %0, i8* %1)

declare i1 @compare_val(i64 %0, i64 %1)
declare i1 @compare_str(i64 %0, i64 %1)
declare i1 @compare_list(i64 %0, i64 %1)
declare i1 @compare_dict(i64 %0, i64 %1)

; String builtins
declare %struct.builtin.str* @allocate_str(i64 %0) 
declare %num @str_to_num(%struct.builtin.str* %0) 
declare %struct.builtin.str* @concat_strs(%struct.builtin.str* %0, %struct.builtin.str* %1) 
declare %struct.builtin.str* @repeat_str(%struct.builtin.str* %0, %num %1) 
declare i32 @compare_strs(%struct.builtin.str* %0, %struct.builtin.str* %1) 
declare %struct.builtin.str* @substr(%struct.builtin.str* %0, i64 %1, i64 %2)
declare %struct.builtin.str* @ascii_to_str(%num %0)
declare %num @str_to_ascii(%struct.builtin.str* %0)

; IO Builtins
declare %struct.builtin.io* @open_io(%struct.builtin.str* %0, %struct.builtin.str* %1)
declare %struct.builtin.str* @readline_io(%struct.builtin.io* %0)
declare %struct.builtin.str* @readall_io(%struct.builtin.io* %0)
declare void @write_io(%struct.builtin.io* %0, %struct.builtin.str* %1)

; Misc builtins
declare i8* @xmalloc(i64 %0)
declare void @print_str(%struct.builtin.str* %0) 
declare void @println_str(%struct.builtin.str* %0) 
declare void @quit(%num %0) noreturn 
declare void @abort_msg(%struct.builtin.str* %0) noreturn 
declare %struct.builtin.str* @prompt() 
declare %num @random_()

; Inline stuff


; Struct declarations
%struct.user.packet = type { %struct.builtin.str*, %num, %num }

; Enum declarations


; Global declarations


; External declarations


; String declarations
@string.-260335693392471217.str = private unnamed_addr constant [1 x i8] c"1", align 1
@string.-260335693392471217 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @string.-260335693392471217.str, i32 0, i32 0), i64 1 }, align 8

@string.3334684631932572726.str = private unnamed_addr constant [4 x i8] c"1110", align 1
@string.3334684631932572726 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @string.3334684631932572726.str, i32 0, i32 0), i64 4 }, align 8


; Functions
define %num @fn.user.packet.member.bin(%struct.user.packet* %0) {
  %2 = alloca %num, align 8
  %3 = alloca %num, align 8
  store %num 0, %num* %3, align 8
  %4 = load %num, %num* %3, align 8
  store %num %4, %num* %2, align 8
  %5 = alloca %num, align 8
  %6 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 1
  %7 = load %num, %num* %6, align 8
  store %num %7, %num* %5, align 8
  %8 = alloca %num, align 8
  %9 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 2
  %10 = load %num, %num* %9, align 8
  store %num %10, %num* %8, align 8
  br label %11
  11:
  %12 = load %num, %num* %5, align 8
  %13 = load %num, %num* %8, align 8
  %14 = icmp slt %num %12, %13
  %15 = zext i1 %14 to %bool
  %16 = icmp ne %bool %15, 0
  br i1 %16, label %17, label %49
  17:
  %18 = load %num, %num* %2, align 8
  %19 = alloca %num, align 8
  store %num 2, %num* %19, align 8
  %20 = load %num, %num* %19, align 8
  %21 = mul nsw %num %18, %20
  store %num %21, %num* %2, align 8
  %22 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 0
  %23 = load %struct.builtin.str*, %struct.builtin.str** %22, align 8
  %24 = load %num, %num* %5, align 8
  %25 = call %struct.builtin.str* @allocate_str(i64 1)
  %26 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %23, i64 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 %24
  %29 = load i8, i8* %28, align 1
  %30 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %25, i64 0, i32 0
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 0
  store i8 %29, i8* %32, align 1
  %33 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-260335693392471217, %struct.builtin.str** %33, align 8
  %34 = load %struct.builtin.str*, %struct.builtin.str** %33, align 8
  %35 = call i32 @compare_strs(%struct.builtin.str* %25, %struct.builtin.str* %34)
  %36 = icmp eq i32 %35, 0
  %37 = zext i1 %36 to %bool
  %38 = icmp ne %bool %37, 0
  br i1 %38, label %39, label %44
  39:
  %40 = load %num, %num* %2, align 8
  %41 = alloca %num, align 8
  store %num 1, %num* %41, align 8
  %42 = load %num, %num* %41, align 8
  %43 = add nsw %num %40, %42
  store %num %43, %num* %2, align 8
  br label %44
  44:
  %45 = load %num, %num* %5, align 8
  %46 = alloca %num, align 8
  store %num 1, %num* %46, align 8
  %47 = load %num, %num* %46, align 8
  %48 = add nsw %num %45, %47
  store %num %48, %num* %5, align 8
  br label %11
  49:
  %50 = load %num, %num* %5, align 8
  %51 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 1
  store %num %50, %num* %51, align 8
  %52 = load %num, %num* %2, align 8
  ret %num %52
}

define %struct.builtin.str* @fn.user.packet.member.dump(%struct.user.packet* %0) {
  %2 = alloca %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, align 8
  store %struct.builtin.str* (%struct.builtin.str*, %num, %num)* @substr, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %2, align 8
  %3 = load %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %2, align 8
  %4 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 0
  %5 = load %struct.builtin.str*, %struct.builtin.str** %4, align 8
  %6 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 1
  %7 = load %num, %num* %6, align 8
  %8 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 2
  %9 = load %num, %num* %8, align 8
  %10 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 1
  %11 = load %num, %num* %10, align 8
  %12 = sub nsw %num %9, %11
  %13 = call %struct.builtin.str* %3(%struct.builtin.str* %5, %num %7, %num %12)
  ret %struct.builtin.str* %13
}

define %struct.user.packet* @fn.user.packet.member.take(%struct.user.packet* %0, %num %1) {
  %3 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 1
  %4 = load %num, %num* %3, align 8
  %5 = add nsw %num %4, %1
  %6 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 1
  store %num %5, %num* %6, align 8
  %7 = alloca %struct.user.packet*, align 8
  %8 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 0
  %9 = load %struct.builtin.str*, %struct.builtin.str** %8, align 8
  %10 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %0, i32 0, i32 1
  %11 = load %num, %num* %10, align 8
  %12 = sub nsw %num %11, %1
  %13 = alloca %struct.user.packet*, align 8
  %14 = call i8* @xmalloc(i64 24)
  %15 = bitcast i8* %14 to %struct.user.packet*
  store %struct.user.packet* %15, %struct.user.packet** %13, align 8
  %16 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %15, i32 0, i32 0
  store %struct.builtin.str* %9, %struct.builtin.str** %16, align 8
  %17 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %15, i32 0, i32 1
  store %num %12, %num* %17, align 8
  %18 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %15, i32 0, i32 2
  store %num %1, %num* %18, align 8
  store %struct.user.packet* %15, %struct.user.packet** %7, align 8
  %19 = load %struct.user.packet*, %struct.user.packet** %7, align 8
  ret %struct.user.packet* %19
}

define %num @fn.user.main() {
  %1 = alloca %struct.user.packet*, align 8
  %2 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.3334684631932572726, %struct.builtin.str** %2, align 8
  %3 = load %struct.builtin.str*, %struct.builtin.str** %2, align 8
  %4 = alloca %struct.user.packet*, align 8
  %5 = call i8* @xmalloc(i64 8)
  %6 = bitcast i8* %5 to %struct.user.packet*
  store %struct.user.packet* %6, %struct.user.packet** %4, align 8
  %7 = getelementptr inbounds %struct.user.packet, %struct.user.packet* %6, i32 0, i32 0
  store %struct.builtin.str* %3, %struct.builtin.str** %7, align 8
  store %struct.user.packet* %6, %struct.user.packet** %1, align 8
  %8 = alloca void (%struct.builtin.str*)*, align 8
  store void (%struct.builtin.str*)* @println_str, void (%struct.builtin.str*)** %8, align 8
  %9 = load void (%struct.builtin.str*)*, void (%struct.builtin.str*)** %8, align 8
  %10 = alloca %struct.builtin.str* (%struct.user.packet*)*, align 8
  store %struct.builtin.str* (%struct.user.packet*)* @fn.user.packet.member.dump, %struct.builtin.str* (%struct.user.packet*)** %10, align 8
  %11 = load %struct.builtin.str* (%struct.user.packet*)*, %struct.builtin.str* (%struct.user.packet*)** %10, align 8
  %12 = alloca %struct.user.packet* (%struct.user.packet*, %num)*, align 8
  store %struct.user.packet* (%struct.user.packet*, %num)* @fn.user.packet.member.take, %struct.user.packet* (%struct.user.packet*, %num)** %12, align 8
  %13 = load %struct.user.packet* (%struct.user.packet*, %num)*, %struct.user.packet* (%struct.user.packet*, %num)** %12, align 8
  %14 = load %struct.user.packet*, %struct.user.packet** %1, align 8
  %15 = alloca %num, align 8
  store %num 1, %num* %15, align 8
  %16 = load %num, %num* %15, align 8
  %17 = call %struct.user.packet* %13(%struct.user.packet* %14, %num %16)
  %18 = call %struct.builtin.str* %11(%struct.user.packet* %17)
  call void %9(%struct.builtin.str* %18)
  %19 = alloca void (%struct.builtin.str*)*, align 8
  store void (%struct.builtin.str*)* @println_str, void (%struct.builtin.str*)** %19, align 8
  %20 = load void (%struct.builtin.str*)*, void (%struct.builtin.str*)** %19, align 8
  %21 = alloca %struct.builtin.str* (%struct.user.packet*)*, align 8
  store %struct.builtin.str* (%struct.user.packet*)* @fn.user.packet.member.dump, %struct.builtin.str* (%struct.user.packet*)** %21, align 8
  %22 = load %struct.builtin.str* (%struct.user.packet*)*, %struct.builtin.str* (%struct.user.packet*)** %21, align 8
  %23 = load %struct.user.packet*, %struct.user.packet** %1, align 8
  %24 = call %struct.builtin.str* %22(%struct.user.packet* %23)
  call void %20(%struct.builtin.str* %24)
  %25 = alloca %num, align 8
  store %num 0, %num* %25, align 8
  %26 = load %num, %num* %25, align 8
  ret %num %26
  ret i64 0
}



