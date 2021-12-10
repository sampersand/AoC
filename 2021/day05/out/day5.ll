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

; Struct declarations
%struct.user.Point = type { %num, %num }
%struct.user.Line = type { %struct.user.Point*, %struct.user.Point* }

; Enum declarations


; Global declarations


; External declarations


; String declarations
@string.-533584230314951153.str = private unnamed_addr constant [0 x i8] c"", align 1
@string.-533584230314951153 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([0 x i8], [0 x i8]* @string.-533584230314951153.str, i32 0, i32 0), i64 0 }, align 8

@string.3327027216273778129.str = private unnamed_addr constant [1 x i8] c"\0A", align 1
@string.3327027216273778129 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @string.3327027216273778129.str, i32 0, i32 0), i64 1 }, align 8

@string.-2807799291561751616.str = private unnamed_addr constant [1 x i8] c",", align 1
@string.-2807799291561751616 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @string.-2807799291561751616.str, i32 0, i32 0), i64 1 }, align 8

@string.-3932313972700441974.str = private unnamed_addr constant [2 x i8] c"->", align 1
@string.-3932313972700441974 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @string.-3932313972700441974.str, i32 0, i32 0), i64 2 }, align 8

@string.1239024770498459957.str = private unnamed_addr constant [8 x i8] c"day5.txt", align 1
@string.1239024770498459957 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @string.1239024770498459957.str, i32 0, i32 0), i64 8 }, align 8

@string.3189124330090367707.str = private unnamed_addr constant [1 x i8] c"r", align 1
@string.3189124330090367707 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([1 x i8], [1 x i8]* @string.3189124330090367707.str, i32 0, i32 0), i64 1 }, align 8

@string.2624214094962961732.str = private unnamed_addr constant [8 x i8] c"part 1: ", align 1
@string.2624214094962961732 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @string.2624214094962961732.str, i32 0, i32 0), i64 8 }, align 8

@string.-2214786045379205812.str = private unnamed_addr constant [8 x i8] c"part 2: ", align 1
@string.-2214786045379205812 = private local_unnamed_addr global %struct.builtin.str { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @string.-2214786045379205812.str, i32 0, i32 0), i64 8 }, align 8


; Functions
define %bool @fn.user.str.member.is_empty(%struct.builtin.str* %0) {
  %2 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %0, i64 0, i32 1
  %3 = load i64, i64* %2, align 8
  %4 = alloca %num, align 8
  store %num 0, %num* %4, align 8
  %5 = load %num, %num* %4, align 8
  %6 = icmp eq %num %3, %5
  %7 = zext i1 %6 to %bool
  ret %bool %7
}

define %struct.builtin.list* @fn.user.io.member.lines(%struct.builtin.io* %0) {
  %2 = alloca %struct.builtin.list*, align 8
  %3 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %3, align 8
  %4 = load %struct.builtin.str*, %struct.builtin.str** %3, align 8
  %5 = call %struct.builtin.list* @allocate_list(i64 1)
  %6 = bitcast %struct.builtin.list* %5 to %struct.builtin.str***
  %7 = load %struct.builtin.str**, %struct.builtin.str*** %6, align 8
  store %struct.builtin.str* %4, %struct.builtin.str** %7, align 8
  %8 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %5, i64 0, i32 1
  store %num 1, %num* %8, align 8
  store %struct.builtin.list* %5, %struct.builtin.list** %2, align 8
  %9 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  %10 = alloca %num, align 8
  store %num 0, %num* %10, align 8
  %11 = load %num, %num* %10, align 8
  %12 = alloca %struct.builtin.str*, align 8
  %13 = bitcast %struct.builtin.str** %12 to i8*
  %14 = call zeroext %bool @delete_from_list(%struct.builtin.list* %9, i8* %13, i64 %11)
  br label %15
  15:
  %16 = alloca %bool, align 1
  store %bool 1, %bool* %16, align 1
  %17 = load %bool, %bool* %16, align 1
  %18 = icmp ne %bool %17, 0
  br i1 %18, label %19, label %52
  19:
  %20 = alloca %struct.builtin.str*, align 8
  %21 = alloca %struct.builtin.str* (%struct.builtin.io*)*, align 8
  store %struct.builtin.str* (%struct.builtin.io*)* @readline_io, %struct.builtin.str* (%struct.builtin.io*)** %21, align 8
  %22 = load %struct.builtin.str* (%struct.builtin.io*)*, %struct.builtin.str* (%struct.builtin.io*)** %21, align 8
  %23 = call %struct.builtin.str* %22(%struct.builtin.io* %0)
  store %struct.builtin.str* %23, %struct.builtin.str** %20, align 8
  %24 = load %struct.builtin.str*, %struct.builtin.str** %20, align 8
  %25 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %25, align 8
  %26 = load %struct.builtin.str*, %struct.builtin.str** %25, align 8
  %27 = call i32 @compare_strs(%struct.builtin.str* %24, %struct.builtin.str* %26)
  %28 = icmp eq i32 %27, 0
  %29 = zext i1 %28 to %bool
  %30 = icmp ne %bool %29, 0
  br i1 %30, label %31, label %33
  31:
  br label %52
  32:
  br label %33
  33:
  %34 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  %35 = alloca %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, align 8
  store %struct.builtin.str* (%struct.builtin.str*, %num, %num)* @substr, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %35, align 8
  %36 = load %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %35, align 8
  %37 = load %struct.builtin.str*, %struct.builtin.str** %20, align 8
  %38 = alloca %num, align 8
  store %num 0, %num* %38, align 8
  %39 = load %num, %num* %38, align 8
  %40 = load %struct.builtin.str*, %struct.builtin.str** %20, align 8
  %41 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %40, i64 0, i32 1
  %42 = load i64, i64* %41, align 8
  %43 = alloca %num, align 8
  store %num 1, %num* %43, align 8
  %44 = load %num, %num* %43, align 8
  %45 = sub nsw %num %42, %44
  %46 = call %struct.builtin.str* %36(%struct.builtin.str* %37, %num %39, %num %45)
  %47 = call %struct.builtin.list* @allocate_list(i64 1)
  %48 = bitcast %struct.builtin.list* %47 to %struct.builtin.str***
  %49 = load %struct.builtin.str**, %struct.builtin.str*** %48, align 8
  store %struct.builtin.str* %46, %struct.builtin.str** %49, align 8
  %50 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %47, i64 0, i32 1
  store %num 1, %num* %50, align 8
  %51 = call %struct.builtin.list* @concat_lists(%struct.builtin.list* %34, %struct.builtin.list* %47)
  store %struct.builtin.list* %51, %struct.builtin.list** %2, align 8
  br label %15
  52:
  %53 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  ret %struct.builtin.list* %53
}

define %struct.builtin.list* @fn.user.str.member.lines(%struct.builtin.str* %0) {
  %2 = alloca %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, align 8
  store %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)* @fn.user.str.member.split, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %2, align 8
  %3 = load %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %2, align 8
  %4 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.3327027216273778129, %struct.builtin.str** %4, align 8
  %5 = load %struct.builtin.str*, %struct.builtin.str** %4, align 8
  %6 = call %struct.builtin.list* %3(%struct.builtin.str* %0, %struct.builtin.str* %5)
  ret %struct.builtin.list* %6
}

define %bool @fn.user.str.member.ends_with(%struct.builtin.str* %0, %struct.builtin.str* %1) {
  %3 = alloca %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, align 8
  store %struct.builtin.str* (%struct.builtin.str*, %num, %num)* @substr, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %3, align 8
  %4 = load %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %3, align 8
  %5 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %0, i64 0, i32 1
  %6 = load i64, i64* %5, align 8
  %7 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %1, i64 0, i32 1
  %8 = load i64, i64* %7, align 8
  %9 = sub nsw %num %6, %8
  %10 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %1, i64 0, i32 1
  %11 = load i64, i64* %10, align 8
  %12 = call %struct.builtin.str* %4(%struct.builtin.str* %0, %num %9, %num %11)
  %13 = call i32 @compare_strs(%struct.builtin.str* %1, %struct.builtin.str* %12)
  %14 = icmp eq i32 %13, 0
  %15 = zext i1 %14 to %bool
  ret %bool %15
}

define %struct.builtin.list* @fn.user.str.member._split_multiple(%struct.builtin.str* %0, %struct.builtin.str* %1) {
  %3 = alloca %struct.builtin.list*, align 8
  %4 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %4, align 8
  %5 = load %struct.builtin.str*, %struct.builtin.str** %4, align 8
  %6 = call %struct.builtin.list* @allocate_list(i64 1)
  %7 = bitcast %struct.builtin.list* %6 to %struct.builtin.str***
  %8 = load %struct.builtin.str**, %struct.builtin.str*** %7, align 8
  store %struct.builtin.str* %5, %struct.builtin.str** %8, align 8
  %9 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %6, i64 0, i32 1
  store %num 1, %num* %9, align 8
  store %struct.builtin.list* %6, %struct.builtin.list** %3, align 8
  %10 = alloca %num, align 8
  %11 = alloca %num, align 8
  store %num 0, %num* %11, align 8
  %12 = load %num, %num* %11, align 8
  store %num %12, %num* %10, align 8
  %13 = alloca %num, align 8
  %14 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %1, i64 0, i32 1
  %15 = load i64, i64* %14, align 8
  store %num %15, %num* %13, align 8
  %16 = alloca %num, align 8
  %17 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %0, i64 0, i32 1
  %18 = load i64, i64* %17, align 8
  store %num %18, %num* %16, align 8
  br label %19
  19:
  %20 = load %num, %num* %10, align 8
  %21 = load %num, %num* %13, align 8
  %22 = add nsw %num %20, %21
  %23 = load %num, %num* %16, align 8
  %24 = icmp slt %num %22, %23
  %25 = zext i1 %24 to %bool
  %26 = icmp ne %bool %25, 0
  br i1 %26, label %27, label %88
  27:
  %28 = alloca %struct.builtin.str*, align 8
  %29 = alloca %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, align 8
  store %struct.builtin.str* (%struct.builtin.str*, %num, %num)* @substr, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %29, align 8
  %30 = load %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %29, align 8
  %31 = load %num, %num* %10, align 8
  %32 = load %num, %num* %13, align 8
  %33 = call %struct.builtin.str* %30(%struct.builtin.str* %0, %num %31, %num %32)
  store %struct.builtin.str* %33, %struct.builtin.str** %28, align 8
  %34 = load %struct.builtin.str*, %struct.builtin.str** %28, align 8
  %35 = call i32 @compare_strs(%struct.builtin.str* %34, %struct.builtin.str* %1)
  %36 = icmp eq i32 %35, 0
  %37 = zext i1 %36 to %bool
  %38 = icmp ne %bool %37, 0
  br i1 %38, label %39, label %51
  39:
  %40 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %41 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %41, align 8
  %42 = load %struct.builtin.str*, %struct.builtin.str** %41, align 8
  %43 = call %struct.builtin.list* @allocate_list(i64 1)
  %44 = bitcast %struct.builtin.list* %43 to %struct.builtin.str***
  %45 = load %struct.builtin.str**, %struct.builtin.str*** %44, align 8
  store %struct.builtin.str* %42, %struct.builtin.str** %45, align 8
  %46 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %43, i64 0, i32 1
  store %num 1, %num* %46, align 8
  %47 = call %struct.builtin.list* @concat_lists(%struct.builtin.list* %40, %struct.builtin.list* %43)
  store %struct.builtin.list* %47, %struct.builtin.list** %3, align 8
  %48 = load %num, %num* %10, align 8
  %49 = load %num, %num* %13, align 8
  %50 = add nsw %num %48, %49
  store %num %50, %num* %10, align 8
  br label %87
  51:
  %52 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %53 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %54 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %53, i64 0, i32 1
  %55 = load i64, i64* %54, align 8
  %56 = alloca %num, align 8
  store %num 1, %num* %56, align 8
  %57 = load %num, %num* %56, align 8
  %58 = sub nsw %num %55, %57
  %59 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %60 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %61 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %60, i64 0, i32 1
  %62 = load i64, i64* %61, align 8
  %63 = alloca %num, align 8
  store %num 1, %num* %63, align 8
  %64 = load %num, %num* %63, align 8
  %65 = sub nsw %num %62, %64
  %66 = bitcast %struct.builtin.list* %59 to %struct.builtin.str***
  %67 = load %struct.builtin.str**, %struct.builtin.str*** %66, align 8
  %68 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %67, %num %65
  %69 = load %struct.builtin.str*, %struct.builtin.str** %68, align 8
  %70 = load %num, %num* %10, align 8
  %71 = call %struct.builtin.str* @allocate_str(i64 1)
  %72 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %0, i64 0, i32 0
  %73 = load i8*, i8** %72, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 %70
  %75 = load i8, i8* %74, align 1
  %76 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %71, i64 0, i32 0
  %77 = load i8*, i8** %76, align 8
  %78 = getelementptr inbounds i8, i8* %77, i64 0
  store i8 %75, i8* %78, align 1
  %79 = call %struct.builtin.str* @concat_strs(%struct.builtin.str* %69, %struct.builtin.str* %71)
  %80 = bitcast %struct.builtin.list* %52 to %struct.builtin.str***
  %81 = load %struct.builtin.str**, %struct.builtin.str*** %80, align 8
  %82 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %81, %num %58
  store %struct.builtin.str* %79, %struct.builtin.str** %82, align 8
  %83 = load %num, %num* %10, align 8
  %84 = alloca %num, align 8
  store %num 1, %num* %84, align 8
  %85 = load %num, %num* %84, align 8
  %86 = add nsw %num %83, %85
  store %num %86, %num* %10, align 8
  br label %87
  87:
  br label %19
  88:
  %89 = alloca %bool (%struct.builtin.str*, %struct.builtin.str*)*, align 8
  store %bool (%struct.builtin.str*, %struct.builtin.str*)* @fn.user.str.member.ends_with, %bool (%struct.builtin.str*, %struct.builtin.str*)** %89, align 8
  %90 = load %bool (%struct.builtin.str*, %struct.builtin.str*)*, %bool (%struct.builtin.str*, %struct.builtin.str*)** %89, align 8
  %91 = call %bool %90(%struct.builtin.str* %0, %struct.builtin.str* %1)
  %92 = icmp ne %bool %91, 0
  br i1 %92, label %93, label %102
  93:
  %94 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %95 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %95, align 8
  %96 = load %struct.builtin.str*, %struct.builtin.str** %95, align 8
  %97 = call %struct.builtin.list* @allocate_list(i64 1)
  %98 = bitcast %struct.builtin.list* %97 to %struct.builtin.str***
  %99 = load %struct.builtin.str**, %struct.builtin.str*** %98, align 8
  store %struct.builtin.str* %96, %struct.builtin.str** %99, align 8
  %100 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %97, i64 0, i32 1
  store %num 1, %num* %100, align 8
  %101 = call %struct.builtin.list* @concat_lists(%struct.builtin.list* %94, %struct.builtin.list* %97)
  store %struct.builtin.list* %101, %struct.builtin.list** %3, align 8
  br label %141
  102:
  %103 = alloca %struct.builtin.str*, align 8
  %104 = alloca %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, align 8
  store %struct.builtin.str* (%struct.builtin.str*, %num, %num)* @substr, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %104, align 8
  %105 = load %struct.builtin.str* (%struct.builtin.str*, %num, %num)*, %struct.builtin.str* (%struct.builtin.str*, %num, %num)** %104, align 8
  %106 = load %num, %num* %10, align 8
  %107 = load %num, %num* %16, align 8
  %108 = load %num, %num* %10, align 8
  %109 = sub nsw %num %107, %108
  %110 = call %struct.builtin.str* %105(%struct.builtin.str* %0, %num %106, %num %109)
  store %struct.builtin.str* %110, %struct.builtin.str** %103, align 8
  %111 = load %struct.builtin.str*, %struct.builtin.str** %103, align 8
  %112 = call i32 @compare_strs(%struct.builtin.str* %111, %struct.builtin.str* %1)
  %113 = icmp ne i32 %112, 0
  %114 = zext i1 %113 to %bool
  %115 = icmp ne %bool %114, 0
  br i1 %115, label %116, label %140
  116:
  %117 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %118 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %119 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %118, i64 0, i32 1
  %120 = load i64, i64* %119, align 8
  %121 = alloca %num, align 8
  store %num 1, %num* %121, align 8
  %122 = load %num, %num* %121, align 8
  %123 = sub nsw %num %120, %122
  %124 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %125 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  %126 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %125, i64 0, i32 1
  %127 = load i64, i64* %126, align 8
  %128 = alloca %num, align 8
  store %num 1, %num* %128, align 8
  %129 = load %num, %num* %128, align 8
  %130 = sub nsw %num %127, %129
  %131 = bitcast %struct.builtin.list* %124 to %struct.builtin.str***
  %132 = load %struct.builtin.str**, %struct.builtin.str*** %131, align 8
  %133 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %132, %num %130
  %134 = load %struct.builtin.str*, %struct.builtin.str** %133, align 8
  %135 = load %struct.builtin.str*, %struct.builtin.str** %103, align 8
  %136 = call %struct.builtin.str* @concat_strs(%struct.builtin.str* %134, %struct.builtin.str* %135)
  %137 = bitcast %struct.builtin.list* %117 to %struct.builtin.str***
  %138 = load %struct.builtin.str**, %struct.builtin.str*** %137, align 8
  %139 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %138, %num %123
  store %struct.builtin.str* %136, %struct.builtin.str** %139, align 8
  br label %140
  140:
  br label %141
  141:
  %142 = load %struct.builtin.list*, %struct.builtin.list** %3, align 8
  ret %struct.builtin.list* %142
}

define %struct.builtin.list* @fn.user.str.member.split(%struct.builtin.str* %0, %struct.builtin.str* %1) {
  %3 = alloca %bool (%struct.builtin.str*)*, align 8
  store %bool (%struct.builtin.str*)* @fn.user.str.member.is_empty, %bool (%struct.builtin.str*)** %3, align 8
  %4 = load %bool (%struct.builtin.str*)*, %bool (%struct.builtin.str*)** %3, align 8
  %5 = call %bool %4(%struct.builtin.str* %0)
  %6 = icmp ne %bool %5, 0
  br i1 %6, label %7, label %15
  7:
  %8 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %8, align 8
  %9 = load %struct.builtin.str*, %struct.builtin.str** %8, align 8
  %10 = call %struct.builtin.list* @allocate_list(i64 1)
  %11 = bitcast %struct.builtin.list* %10 to %struct.builtin.str***
  %12 = load %struct.builtin.str**, %struct.builtin.str*** %11, align 8
  store %struct.builtin.str* %9, %struct.builtin.str** %12, align 8
  %13 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %10, i64 0, i32 1
  store %num 1, %num* %13, align 8
  ret %struct.builtin.list* %10
  br label %15
  15:
  %16 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %1, i64 0, i32 1
  %17 = load i64, i64* %16, align 8
  %18 = alloca %num, align 8
  store %num 1, %num* %18, align 8
  %19 = load %num, %num* %18, align 8
  %20 = icmp ne %num %17, %19
  %21 = zext i1 %20 to %bool
  %22 = icmp ne %bool %21, 0
  br i1 %22, label %23, label %28
  23:
  %24 = alloca %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, align 8
  store %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)* @fn.user.str.member._split_multiple, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %24, align 8
  %25 = load %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %24, align 8
  %26 = call %struct.builtin.list* %25(%struct.builtin.str* %0, %struct.builtin.str* %1)
  ret %struct.builtin.list* %26
  br label %28
  28:
  %29 = alloca %struct.builtin.list*, align 8
  %30 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %30, align 8
  %31 = load %struct.builtin.str*, %struct.builtin.str** %30, align 8
  %32 = call %struct.builtin.list* @allocate_list(i64 1)
  %33 = bitcast %struct.builtin.list* %32 to %struct.builtin.str***
  %34 = load %struct.builtin.str**, %struct.builtin.str*** %33, align 8
  store %struct.builtin.str* %31, %struct.builtin.str** %34, align 8
  %35 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %32, i64 0, i32 1
  store %num 1, %num* %35, align 8
  store %struct.builtin.list* %32, %struct.builtin.list** %29, align 8
  %36 = alloca %num, align 8
  %37 = alloca %num, align 8
  store %num 0, %num* %37, align 8
  %38 = load %num, %num* %37, align 8
  store %num %38, %num* %36, align 8
  br label %39
  39:
  %40 = load %num, %num* %36, align 8
  %41 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %0, i64 0, i32 1
  %42 = load i64, i64* %41, align 8
  %43 = icmp slt %num %40, %42
  %44 = zext i1 %43 to %bool
  %45 = icmp ne %bool %44, 0
  br i1 %45, label %46, label %100
  46:
  %47 = alloca %struct.builtin.str*, align 8
  %48 = load %num, %num* %36, align 8
  %49 = call %struct.builtin.str* @allocate_str(i64 1)
  %50 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %0, i64 0, i32 0
  %51 = load i8*, i8** %50, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 %48
  %53 = load i8, i8* %52, align 1
  %54 = getelementptr inbounds %struct.builtin.str, %struct.builtin.str* %49, i64 0, i32 0
  %55 = load i8*, i8** %54, align 8
  %56 = getelementptr inbounds i8, i8* %55, i64 0
  store i8 %53, i8* %56, align 1
  store %struct.builtin.str* %49, %struct.builtin.str** %47, align 8
  %57 = load %struct.builtin.str*, %struct.builtin.str** %47, align 8
  %58 = call i32 @compare_strs(%struct.builtin.str* %57, %struct.builtin.str* %1)
  %59 = icmp eq i32 %58, 0
  %60 = zext i1 %59 to %bool
  %61 = icmp ne %bool %60, 0
  br i1 %61, label %62, label %71
  62:
  %63 = load %struct.builtin.list*, %struct.builtin.list** %29, align 8
  %64 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-533584230314951153, %struct.builtin.str** %64, align 8
  %65 = load %struct.builtin.str*, %struct.builtin.str** %64, align 8
  %66 = call %struct.builtin.list* @allocate_list(i64 1)
  %67 = bitcast %struct.builtin.list* %66 to %struct.builtin.str***
  %68 = load %struct.builtin.str**, %struct.builtin.str*** %67, align 8
  store %struct.builtin.str* %65, %struct.builtin.str** %68, align 8
  %69 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %66, i64 0, i32 1
  store %num 1, %num* %69, align 8
  %70 = call %struct.builtin.list* @concat_lists(%struct.builtin.list* %63, %struct.builtin.list* %66)
  store %struct.builtin.list* %70, %struct.builtin.list** %29, align 8
  br label %95
  71:
  %72 = load %struct.builtin.list*, %struct.builtin.list** %29, align 8
  %73 = load %struct.builtin.list*, %struct.builtin.list** %29, align 8
  %74 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %73, i64 0, i32 1
  %75 = load i64, i64* %74, align 8
  %76 = alloca %num, align 8
  store %num 1, %num* %76, align 8
  %77 = load %num, %num* %76, align 8
  %78 = sub nsw %num %75, %77
  %79 = load %struct.builtin.list*, %struct.builtin.list** %29, align 8
  %80 = load %struct.builtin.list*, %struct.builtin.list** %29, align 8
  %81 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %80, i64 0, i32 1
  %82 = load i64, i64* %81, align 8
  %83 = alloca %num, align 8
  store %num 1, %num* %83, align 8
  %84 = load %num, %num* %83, align 8
  %85 = sub nsw %num %82, %84
  %86 = bitcast %struct.builtin.list* %79 to %struct.builtin.str***
  %87 = load %struct.builtin.str**, %struct.builtin.str*** %86, align 8
  %88 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %87, %num %85
  %89 = load %struct.builtin.str*, %struct.builtin.str** %88, align 8
  %90 = load %struct.builtin.str*, %struct.builtin.str** %47, align 8
  %91 = call %struct.builtin.str* @concat_strs(%struct.builtin.str* %89, %struct.builtin.str* %90)
  %92 = bitcast %struct.builtin.list* %72 to %struct.builtin.str***
  %93 = load %struct.builtin.str**, %struct.builtin.str*** %92, align 8
  %94 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %93, %num %78
  store %struct.builtin.str* %91, %struct.builtin.str** %94, align 8
  br label %95
  95:
  %96 = load %num, %num* %36, align 8
  %97 = alloca %num, align 8
  store %num 1, %num* %97, align 8
  %98 = load %num, %num* %97, align 8
  %99 = add nsw %num %96, %98
  store %num %99, %num* %36, align 8
  br label %39
  100:
  %101 = load %struct.builtin.list*, %struct.builtin.list** %29, align 8
  ret %struct.builtin.list* %101
}

define %struct.user.Point* @fn.user.Point_parse(%struct.builtin.str* %0) {
  %2 = alloca %struct.builtin.list*, align 8
  %3 = alloca %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, align 8
  store %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)* @fn.user.str.member.split, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %3, align 8
  %4 = load %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %3, align 8
  %5 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-2807799291561751616, %struct.builtin.str** %5, align 8
  %6 = load %struct.builtin.str*, %struct.builtin.str** %5, align 8
  %7 = call %struct.builtin.list* %4(%struct.builtin.str* %0, %struct.builtin.str* %6)
  store %struct.builtin.list* %7, %struct.builtin.list** %2, align 8
  %8 = alloca %num (%struct.builtin.str*)*, align 8
  store %num (%struct.builtin.str*)* @str_to_num, %num (%struct.builtin.str*)** %8, align 8
  %9 = load %num (%struct.builtin.str*)*, %num (%struct.builtin.str*)** %8, align 8
  %10 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  %11 = alloca %num, align 8
  store %num 0, %num* %11, align 8
  %12 = load %num, %num* %11, align 8
  %13 = bitcast %struct.builtin.list* %10 to %struct.builtin.str***
  %14 = load %struct.builtin.str**, %struct.builtin.str*** %13, align 8
  %15 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %14, %num %12
  %16 = load %struct.builtin.str*, %struct.builtin.str** %15, align 8
  %17 = call %num %9(%struct.builtin.str* %16)
  %18 = alloca %num (%struct.builtin.str*)*, align 8
  store %num (%struct.builtin.str*)* @str_to_num, %num (%struct.builtin.str*)** %18, align 8
  %19 = load %num (%struct.builtin.str*)*, %num (%struct.builtin.str*)** %18, align 8
  %20 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  %21 = alloca %num, align 8
  store %num 1, %num* %21, align 8
  %22 = load %num, %num* %21, align 8
  %23 = bitcast %struct.builtin.list* %20 to %struct.builtin.str***
  %24 = load %struct.builtin.str**, %struct.builtin.str*** %23, align 8
  %25 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %24, %num %22
  %26 = load %struct.builtin.str*, %struct.builtin.str** %25, align 8
  %27 = call %num %19(%struct.builtin.str* %26)
  %28 = alloca %struct.user.Point*, align 8
  %29 = call i8* @xmalloc(i64 16)
  %30 = bitcast i8* %29 to %struct.user.Point*
  store %struct.user.Point* %30, %struct.user.Point** %28, align 8
  %31 = getelementptr inbounds %struct.user.Point, %struct.user.Point* %30, i32 0, i32 0
  store %num %17, %num* %31, align 8
  %32 = getelementptr inbounds %struct.user.Point, %struct.user.Point* %30, i32 0, i32 1
  store %num %27, %num* %32, align 8
  ret %struct.user.Point* %30
}

define %struct.user.Line* @fn.user.Line_parse(%struct.builtin.str* %0) {
  %2 = alloca %struct.builtin.list*, align 8
  %3 = alloca %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, align 8
  store %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)* @fn.user.str.member.split, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %3, align 8
  %4 = load %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)*, %struct.builtin.list* (%struct.builtin.str*, %struct.builtin.str*)** %3, align 8
  %5 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-3932313972700441974, %struct.builtin.str** %5, align 8
  %6 = load %struct.builtin.str*, %struct.builtin.str** %5, align 8
  %7 = call %struct.builtin.list* %4(%struct.builtin.str* %0, %struct.builtin.str* %6)
  store %struct.builtin.list* %7, %struct.builtin.list** %2, align 8
  %8 = alloca %struct.user.Point* (%struct.builtin.str*)*, align 8
  store %struct.user.Point* (%struct.builtin.str*)* @fn.user.Point_parse, %struct.user.Point* (%struct.builtin.str*)** %8, align 8
  %9 = load %struct.user.Point* (%struct.builtin.str*)*, %struct.user.Point* (%struct.builtin.str*)** %8, align 8
  %10 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  %11 = alloca %num, align 8
  store %num 0, %num* %11, align 8
  %12 = load %num, %num* %11, align 8
  %13 = bitcast %struct.builtin.list* %10 to %struct.builtin.str***
  %14 = load %struct.builtin.str**, %struct.builtin.str*** %13, align 8
  %15 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %14, %num %12
  %16 = load %struct.builtin.str*, %struct.builtin.str** %15, align 8
  %17 = call %struct.user.Point* %9(%struct.builtin.str* %16)
  %18 = alloca %struct.user.Point* (%struct.builtin.str*)*, align 8
  store %struct.user.Point* (%struct.builtin.str*)* @fn.user.Point_parse, %struct.user.Point* (%struct.builtin.str*)** %18, align 8
  %19 = load %struct.user.Point* (%struct.builtin.str*)*, %struct.user.Point* (%struct.builtin.str*)** %18, align 8
  %20 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  %21 = alloca %num, align 8
  store %num 1, %num* %21, align 8
  %22 = load %num, %num* %21, align 8
  %23 = bitcast %struct.builtin.list* %20 to %struct.builtin.str***
  %24 = load %struct.builtin.str**, %struct.builtin.str*** %23, align 8
  %25 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %24, %num %22
  %26 = load %struct.builtin.str*, %struct.builtin.str** %25, align 8
  %27 = call %struct.user.Point* %19(%struct.builtin.str* %26)
  %28 = alloca %struct.user.Line*, align 8
  %29 = call i8* @xmalloc(i64 16)
  %30 = bitcast i8* %29 to %struct.user.Line*
  store %struct.user.Line* %30, %struct.user.Line** %28, align 8
  %31 = getelementptr inbounds %struct.user.Line, %struct.user.Line* %30, i32 0, i32 0
  store %struct.user.Point* %17, %struct.user.Point** %31, align 8
  %32 = getelementptr inbounds %struct.user.Line, %struct.user.Line* %30, i32 0, i32 1
  store %struct.user.Point* %27, %struct.user.Point** %32, align 8
  ret %struct.user.Line* %30
}

define %struct.builtin.list* @fn.user.parse(%struct.builtin.list* %0) {
  %2 = alloca %struct.builtin.list*, align 8
  store %struct.builtin.list* null, %struct.builtin.list** %2, align 8
  %3 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  ret %struct.builtin.list* %3
  %5 = alloca %num, align 8
  %6 = alloca %num, align 8
  store %num 0, %num* %6, align 8
  %7 = load %num, %num* %6, align 8
  store %num %7, %num* %5, align 8
  br label %8
  8:
  %9 = load %num, %num* %5, align 8
  %10 = getelementptr inbounds %struct.builtin.list, %struct.builtin.list* %0, i64 0, i32 1
  %11 = load i64, i64* %10, align 8
  %12 = icmp slt %num %9, %11
  %13 = zext i1 %12 to %bool
  %14 = icmp ne %bool %13, 0
  br i1 %14, label %15, label %31
  15:
  %16 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  %17 = alloca %struct.user.Line* (%struct.builtin.str*)*, align 8
  store %struct.user.Line* (%struct.builtin.str*)* @fn.user.Line_parse, %struct.user.Line* (%struct.builtin.str*)** %17, align 8
  %18 = load %struct.user.Line* (%struct.builtin.str*)*, %struct.user.Line* (%struct.builtin.str*)** %17, align 8
  %19 = load %num, %num* %5, align 8
  %20 = bitcast %struct.builtin.list* %0 to %struct.builtin.str***
  %21 = load %struct.builtin.str**, %struct.builtin.str*** %20, align 8
  %22 = getelementptr inbounds %struct.builtin.str*, %struct.builtin.str** %21, %num %19
  %23 = load %struct.builtin.str*, %struct.builtin.str** %22, align 8
  %24 = call %struct.user.Line* %18(%struct.builtin.str* %23)
  %25 = alloca %struct.user.Line*, align 8
  store %struct.user.Line* %24, %struct.user.Line** %25, align 8
  %26 = bitcast %struct.user.Line** %25 to i8*
  call void @push_into_list(%struct.builtin.list* %16, i8* %26)
  %27 = load %num, %num* %5, align 8
  %28 = alloca %num, align 8
  store %num 1, %num* %28, align 8
  %29 = load %num, %num* %28, align 8
  %30 = add nsw %num %27, %29
  store %num %30, %num* %5, align 8
  br label %8
  31:
  %32 = load %struct.builtin.list*, %struct.builtin.list** %2, align 8
  ret %struct.builtin.list* %32
}

define %num @fn.user.solve(%bool %0, %struct.builtin.list* %1) {
  %3 = alloca %struct.builtin.dict*, align 8
  %4 = alloca i1 (%num, %num)*, align 8
  store i1 (%num, %num)* @compare_val, i1 (%num, %num)** %4, align 8
  %5 = load i1 (%num, %num)*, i1 (%num, %num)** %4, align 8
  %6 = call %struct.builtin.dict* @allocate_dict(i64 0, i1 (i64,i64)* %5)
  store %struct.builtin.dict* %6, %struct.builtin.dict** %3, align 8
  %7 = alloca %num, align 8
  store %num 0, %num* %7, align 8
  %8 = load %num, %num* %7, align 8
  ret %num %8
}

define %num @fn.user.main() {
  %1 = alloca %struct.builtin.list*, align 8
  %2 = alloca %struct.builtin.list* (%struct.builtin.list*)*, align 8
  store %struct.builtin.list* (%struct.builtin.list*)* @fn.user.parse, %struct.builtin.list* (%struct.builtin.list*)** %2, align 8
  %3 = load %struct.builtin.list* (%struct.builtin.list*)*, %struct.builtin.list* (%struct.builtin.list*)** %2, align 8
  %4 = alloca %struct.builtin.list* (%struct.builtin.io*)*, align 8
  store %struct.builtin.list* (%struct.builtin.io*)* @fn.user.io.member.lines, %struct.builtin.list* (%struct.builtin.io*)** %4, align 8
  %5 = load %struct.builtin.list* (%struct.builtin.io*)*, %struct.builtin.list* (%struct.builtin.io*)** %4, align 8
  %6 = alloca %struct.builtin.io* (%struct.builtin.str*, %struct.builtin.str*)*, align 8
  store %struct.builtin.io* (%struct.builtin.str*, %struct.builtin.str*)* @open_io, %struct.builtin.io* (%struct.builtin.str*, %struct.builtin.str*)** %6, align 8
  %7 = load %struct.builtin.io* (%struct.builtin.str*, %struct.builtin.str*)*, %struct.builtin.io* (%struct.builtin.str*, %struct.builtin.str*)** %6, align 8
  %8 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.1239024770498459957, %struct.builtin.str** %8, align 8
  %9 = load %struct.builtin.str*, %struct.builtin.str** %8, align 8
  %10 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.3189124330090367707, %struct.builtin.str** %10, align 8
  %11 = load %struct.builtin.str*, %struct.builtin.str** %10, align 8
  %12 = call %struct.builtin.io* %7(%struct.builtin.str* %9, %struct.builtin.str* %11)
  %13 = call %struct.builtin.list* %5(%struct.builtin.io* %12)
  %14 = call %struct.builtin.list* %3(%struct.builtin.list* %13)
  store %struct.builtin.list* %14, %struct.builtin.list** %1, align 8
  %15 = alloca void (%struct.builtin.str*)*, align 8
  store void (%struct.builtin.str*)* @println_str, void (%struct.builtin.str*)** %15, align 8
  %16 = load void (%struct.builtin.str*)*, void (%struct.builtin.str*)** %15, align 8
  %17 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.2624214094962961732, %struct.builtin.str** %17, align 8
  %18 = load %struct.builtin.str*, %struct.builtin.str** %17, align 8
  %19 = alloca %struct.builtin.str* (%num)*, align 8
  store %struct.builtin.str* (%num)* @num_to_str, %struct.builtin.str* (%num)** %19, align 8
  %20 = load %struct.builtin.str* (%num)*, %struct.builtin.str* (%num)** %19, align 8
  %21 = alloca %num (%bool, %struct.builtin.list*)*, align 8
  store %num (%bool, %struct.builtin.list*)* @fn.user.solve, %num (%bool, %struct.builtin.list*)** %21, align 8
  %22 = load %num (%bool, %struct.builtin.list*)*, %num (%bool, %struct.builtin.list*)** %21, align 8
  %23 = alloca %bool, align 1
  store %bool 1, %bool* %23, align 1
  %24 = load %bool, %bool* %23, align 1
  %25 = load %struct.builtin.list*, %struct.builtin.list** %1, align 8
  %26 = call %num %22(%bool %24, %struct.builtin.list* %25)
  %27 = call %struct.builtin.str* %20(%num %26)
  %28 = call %struct.builtin.str* @concat_strs(%struct.builtin.str* %18, %struct.builtin.str* %27)
  call void %16(%struct.builtin.str* %28)
  %29 = alloca void (%struct.builtin.str*)*, align 8
  store void (%struct.builtin.str*)* @println_str, void (%struct.builtin.str*)** %29, align 8
  %30 = load void (%struct.builtin.str*)*, void (%struct.builtin.str*)** %29, align 8
  %31 = alloca %struct.builtin.str*, align 8
  store %struct.builtin.str* @string.-2214786045379205812, %struct.builtin.str** %31, align 8
  %32 = load %struct.builtin.str*, %struct.builtin.str** %31, align 8
  %33 = alloca %struct.builtin.str* (%num)*, align 8
  store %struct.builtin.str* (%num)* @num_to_str, %struct.builtin.str* (%num)** %33, align 8
  %34 = load %struct.builtin.str* (%num)*, %struct.builtin.str* (%num)** %33, align 8
  %35 = alloca %num (%bool, %struct.builtin.list*)*, align 8
  store %num (%bool, %struct.builtin.list*)* @fn.user.solve, %num (%bool, %struct.builtin.list*)** %35, align 8
  %36 = load %num (%bool, %struct.builtin.list*)*, %num (%bool, %struct.builtin.list*)** %35, align 8
  %37 = alloca %bool, align 1
  store %bool 0, %bool* %37, align 1
  %38 = load %bool, %bool* %37, align 1
  %39 = load %struct.builtin.list*, %struct.builtin.list** %1, align 8
  %40 = call %num %36(%bool %38, %struct.builtin.list* %39)
  %41 = call %struct.builtin.str* %34(%num %40)
  %42 = call %struct.builtin.str* @concat_strs(%struct.builtin.str* %32, %struct.builtin.str* %41)
  call void %30(%struct.builtin.str* %42)
  %43 = alloca %num, align 8
  store %num 0, %num* %43, align 8
  %44 = load %num, %num* %43, align 8
  ret %num %44
  ret i64 0
}



