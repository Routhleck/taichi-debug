; ModuleID = 'kernel'
source_filename = "kernel"
target triple = "nvptx64-nvidia-cuda"

%struct.RuntimeContext.7 = type { i8*, %struct.LLVMRuntime.6*, i32, i64* }
%struct.LLVMRuntime.6 = type { %struct.PreallocatedMemoryChunk.1, %struct.PreallocatedMemoryChunk.1, i8* (i8*, i64, i64)*, void (i8*)*, void (i8*, ...)*, i32 (i8*, i64, i8*, %struct.__va_list_tag.2*)*, i8*, [512 x i8*], [512 x i64], i8*, void (i8*, i32, i32, i8*, void (i8*, i32, i32)*)*, [1024 x %struct.ListManager.3*], [1024 x %struct.NodeManager.4*], [1024 x i8*], i8*, %struct.RandState.5*, i8*, void (i8*, i8*)*, void (i8*)*, [2048 x i8], [32 x i64], i32, i64, i8*, i32, i32, i64 }
%struct.PreallocatedMemoryChunk.1 = type { i8*, i8*, i64 }
%struct.__va_list_tag.2 = type { i32, i32, i8*, i8* }
%struct.ListManager.3 = type { [131072 x i8*], i64, i64, i32, i32, i32, %struct.LLVMRuntime.6* }
%struct.NodeManager.4 = type <{ %struct.LLVMRuntime.6*, i32, i32, i32, i32, %struct.ListManager.3*, %struct.ListManager.3*, %struct.ListManager.3*, i32, [4 x i8] }>
%struct.RandState.5 = type { i32, i32, i32, i32, i32 }

define void @taichi_kernel_cuda_c76_0_kernel_0_serial(%struct.RuntimeContext.7* byval(%struct.RuntimeContext.7) %context) {
entry:
  br label %body

final:                                            ; preds = %body
  ret void

body:                                             ; preds = %entry
  %0 = getelementptr %struct.RuntimeContext.7, %struct.RuntimeContext.7* %context, i32 0, i32 0
  %1 = bitcast i8** %0 to { { { i32 }, float* }, { { i32 }, float* }, float }**
  %2 = load { { { i32 }, float* }, { { i32 }, float* }, float }*, { { { i32 }, float* }, { { i32 }, float* }, float }** %1, align 8
  %3 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %2, i32 0, i32 0, i32 0, i32 0
  %4 = load i32, i32* %3, align 4
  %5 = call %struct.LLVMRuntime.6* @RuntimeContext_get_runtime(%struct.RuntimeContext.7* %context)
  %6 = call i8* @get_temporary_pointer(%struct.LLVMRuntime.6* %5, i64 0)
  %7 = bitcast i8* %6 to i32*
  store i32 %4, i32* %7, align 4
  br label %final
}

define void @taichi_kernel_cuda_c76_0_kernel_1_range_for(%struct.RuntimeContext.7* byval(%struct.RuntimeContext.7) %context) {
entry:
  br label %body

final:                                            ; preds = %body
  ret void

body:                                             ; preds = %entry
  %0 = call %struct.LLVMRuntime.6* @RuntimeContext_get_runtime(%struct.RuntimeContext.7* %context)
  %1 = call i8* @get_temporary_pointer(%struct.LLVMRuntime.6* %0, i64 0)
  %2 = bitcast i8* %1 to i32*
  %3 = load i32, i32* %2, align 4
  call void @gpu_parallel_range_for(%struct.RuntimeContext.7* %context, i32 0, i32 %3, void (%struct.RuntimeContext.7*, i8*)* null, void (%struct.RuntimeContext.7*, i8*, i32)* @function_body, void (%struct.RuntimeContext.7*, i8*)* null, i64 1)
  br label %final
}

define internal void @function_body(%struct.RuntimeContext.7* %0, i8* %1, i32 %2) {
allocs:
  %3 = alloca i32, align 4
  br label %entry

final:                                            ; preds = %function_body
  ret void

entry:                                            ; preds = %allocs
  br label %function_body

function_body:                                    ; preds = %entry
  store i32 %2, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = getelementptr %struct.RuntimeContext.7, %struct.RuntimeContext.7* %0, i32 0, i32 0
  %6 = bitcast i8** %5 to { { { i32 }, float* }, { { i32 }, float* }, float }**
  %7 = load { { { i32 }, float* }, { { i32 }, float* }, float }*, { { { i32 }, float* }, { { i32 }, float* }, float }** %6, align 8
  %8 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %7, i32 0, i32 0
  %9 = getelementptr { { i32 }, float* }, { { i32 }, float* }* %8, i32 0, i32 1
  %10 = load float*, float** %9, align 8
  %11 = getelementptr { { i32 }, float* }, { { i32 }, float* }* %8, i32 0, i32 0, i32 0
  %12 = load i32, i32* %11, align 4
  %13 = mul i32 0, %12
  %14 = add i32 %13, %4
  %15 = getelementptr float, float* %10, i32 %14
  %16 = load float, float* %15, align 4
  %17 = getelementptr %struct.RuntimeContext.7, %struct.RuntimeContext.7* %0, i32 0, i32 0
  %18 = bitcast i8** %17 to { { { i32 }, float* }, { { i32 }, float* }, float }**
  %19 = load { { { i32 }, float* }, { { i32 }, float* }, float }*, { { { i32 }, float* }, { { i32 }, float* }, float }** %18, align 8
  %20 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %19, i32 0, i32 2
  %21 = load float, float* %20, align 4
  %22 = fadd reassoc ninf nsz float %16, %21
  %23 = getelementptr %struct.RuntimeContext.7, %struct.RuntimeContext.7* %0, i32 0, i32 0
  %24 = bitcast i8** %23 to { { { i32 }, float* }, { { i32 }, float* }, float }**
  %25 = load { { { i32 }, float* }, { { i32 }, float* }, float }*, { { { i32 }, float* }, { { i32 }, float* }, float }** %24, align 8
  %26 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %25, i32 0, i32 1
  %27 = getelementptr { { i32 }, float* }, { { i32 }, float* }* %26, i32 0, i32 1
  %28 = load float*, float** %27, align 8
  %29 = getelementptr { { i32 }, float* }, { { i32 }, float* }* %26, i32 0, i32 0, i32 0
  %30 = load i32, i32* %29, align 4
  %31 = mul i32 0, %30
  %32 = add i32 %31, %4
  %33 = getelementptr float, float* %28, i32 %32
  store float %22, float* %33, align 4
  br label %final
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal %struct.LLVMRuntime.6* @RuntimeContext_get_runtime(%struct.RuntimeContext.7* noundef %0) #0 {
  %2 = alloca %struct.RuntimeContext.7*, align 8
  store %struct.RuntimeContext.7* %0, %struct.RuntimeContext.7** %2, align 8
  %3 = load %struct.RuntimeContext.7*, %struct.RuntimeContext.7** %2, align 8
  %4 = getelementptr inbounds %struct.RuntimeContext.7, %struct.RuntimeContext.7* %3, i32 0, i32 1
  %5 = load %struct.LLVMRuntime.6*, %struct.LLVMRuntime.6** %4, align 8
  ret %struct.LLVMRuntime.6* %5
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal i8* @get_temporary_pointer(%struct.LLVMRuntime.6* noundef %0, i64 noundef %1) #0 {
  %3 = alloca %struct.LLVMRuntime.6*, align 8
  %4 = alloca i64, align 8
  store %struct.LLVMRuntime.6* %0, %struct.LLVMRuntime.6** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load %struct.LLVMRuntime.6*, %struct.LLVMRuntime.6** %3, align 8
  %6 = getelementptr inbounds %struct.LLVMRuntime.6, %struct.LLVMRuntime.6* %5, i32 0, i32 14
  %7 = load i8*, i8** %6, align 8
  %8 = load i64, i64* %4, align 8
  %9 = getelementptr inbounds i8, i8* %7, i64 %8
  ret i8* %9
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal void @gpu_parallel_range_for(%struct.RuntimeContext.7* noundef %0, i32 noundef %1, i32 noundef %2, void (%struct.RuntimeContext.7*, i8*)* noundef %3, void (%struct.RuntimeContext.7*, i8*, i32)* noundef %4, void (%struct.RuntimeContext.7*, i8*)* noundef %5, i64 noundef %6) #0 {
  %8 = alloca %struct.RuntimeContext.7*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca void (%struct.RuntimeContext.7*, i8*)*, align 8
  %12 = alloca void (%struct.RuntimeContext.7*, i8*, i32)*, align 8
  %13 = alloca void (%struct.RuntimeContext.7*, i8*)*, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i8*, align 8
  %17 = alloca i64, align 8
  %18 = alloca i8*, align 8
  store %struct.RuntimeContext.7* %0, %struct.RuntimeContext.7** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store void (%struct.RuntimeContext.7*, i8*)* %3, void (%struct.RuntimeContext.7*, i8*)** %11, align 8
  store void (%struct.RuntimeContext.7*, i8*, i32)* %4, void (%struct.RuntimeContext.7*, i8*, i32)** %12, align 8
  store void (%struct.RuntimeContext.7*, i8*)* %5, void (%struct.RuntimeContext.7*, i8*)** %13, align 8
  store i64 %6, i64* %14, align 8
  %19 = call i32 @thread_idx()
  %20 = call i32 @block_dim()
  %21 = call i32 @block_idx()
  %22 = mul nsw i32 %20, %21
  %23 = add nsw i32 %19, %22
  %24 = load i32, i32* %9, align 4
  %25 = add nsw i32 %23, %24
  store i32 %25, i32* %15, align 4
  %26 = load i64, i64* %14, align 8
  %27 = call i8* @llvm.stacksave()
  store i8* %27, i8** %16, align 8
  %28 = alloca i8, i64 %26, align 8
  store i64 %26, i64* %17, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 0
  store i8* %29, i8** %18, align 8
  %30 = load void (%struct.RuntimeContext.7*, i8*)*, void (%struct.RuntimeContext.7*, i8*)** %11, align 8
  %31 = icmp ne void (%struct.RuntimeContext.7*, i8*)* %30, null
  br i1 %31, label %32, label %36

32:                                               ; preds = %7
  %33 = load void (%struct.RuntimeContext.7*, i8*)*, void (%struct.RuntimeContext.7*, i8*)** %11, align 8
  %34 = load %struct.RuntimeContext.7*, %struct.RuntimeContext.7** %8, align 8
  %35 = load i8*, i8** %18, align 8
  call void %33(%struct.RuntimeContext.7* noundef %34, i8* noundef %35)
  br label %36

36:                                               ; preds = %32, %7
  br label %37

37:                                               ; preds = %41, %36
  %38 = load i32, i32* %15, align 4
  %39 = load i32, i32* %10, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %51

41:                                               ; preds = %37
  %42 = load void (%struct.RuntimeContext.7*, i8*, i32)*, void (%struct.RuntimeContext.7*, i8*, i32)** %12, align 8
  %43 = load %struct.RuntimeContext.7*, %struct.RuntimeContext.7** %8, align 8
  %44 = load i8*, i8** %18, align 8
  %45 = load i32, i32* %15, align 4
  call void %42(%struct.RuntimeContext.7* noundef %43, i8* noundef %44, i32 noundef %45)
  %46 = call i32 @block_dim()
  %47 = call i32 @grid_dim()
  %48 = mul nsw i32 %46, %47
  %49 = load i32, i32* %15, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, i32* %15, align 4
  br label %37, !llvm.loop !17

51:                                               ; preds = %37
  %52 = load void (%struct.RuntimeContext.7*, i8*)*, void (%struct.RuntimeContext.7*, i8*)** %13, align 8
  %53 = icmp ne void (%struct.RuntimeContext.7*, i8*)* %52, null
  br i1 %53, label %54, label %58

54:                                               ; preds = %51
  %55 = load void (%struct.RuntimeContext.7*, i8*)*, void (%struct.RuntimeContext.7*, i8*)** %13, align 8
  %56 = load %struct.RuntimeContext.7*, %struct.RuntimeContext.7** %8, align 8
  %57 = load i8*, i8** %18, align 8
  call void %55(%struct.RuntimeContext.7* noundef %56, i8* noundef %57)
  br label %58

58:                                               ; preds = %54, %51
  %59 = load i8*, i8** %16, align 8
  call void @llvm.stackrestore(i8* %59)
  ret void
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal i32 @thread_idx() #0 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.tid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal i32 @block_dim() #0 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ntid.x()
  ret i32 %0
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal i32 @block_idx() #0 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.ctaid.x()
  ret i32 %0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #1

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal i32 @grid_dim() #0 {
entry:
  %0 = call i32 @llvm.nvvm.read.ptx.sreg.nctaid.x()
  ret i32 %0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.nctaid.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ctaid.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.ntid.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.nvvm.read.ptx.sreg.tid.x() #2

attributes #0 = { alwaysinline mustprogress nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !6, !8, !8, !8, !8, !9, !9, !8}
!llvm.ident = !{!10}
!nvvmir.version = !{!11}
!llvm.module.flags = !{!12, !13, !14, !15, !16}

!0 = !{void (%struct.RuntimeContext.7*)* @taichi_kernel_cuda_c76_0_kernel_0_serial, !"kernel", i32 1}
!1 = !{void (%struct.RuntimeContext.7*)* @taichi_kernel_cuda_c76_0_kernel_0_serial, !"maxntidx", i32 1}
!2 = !{void (%struct.RuntimeContext.7*)* @taichi_kernel_cuda_c76_0_kernel_0_serial, !"minctasm", i32 2}
!3 = !{void (%struct.RuntimeContext.7*)* @taichi_kernel_cuda_c76_0_kernel_1_range_for, !"kernel", i32 1}
!4 = !{void (%struct.RuntimeContext.7*)* @taichi_kernel_cuda_c76_0_kernel_1_range_for, !"maxntidx", i32 128}
!5 = !{void (%struct.RuntimeContext.7*)* @taichi_kernel_cuda_c76_0_kernel_1_range_for, !"minctasm", i32 2}
!6 = !{null, !"align", i32 8}
!7 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!8 = !{null, !"align", i32 16}
!9 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!10 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!11 = !{i32 1, i32 4}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"PIE Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.mustprogress"}
