; ModuleID = 'kernel'
source_filename = "kernel"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.RuntimeContext.7 = type { i8*, %struct.LLVMRuntime.6*, i32, i64* }
%struct.LLVMRuntime.6 = type { %struct.PreallocatedMemoryChunk.1, %struct.PreallocatedMemoryChunk.1, i8* (i8*, i64, i64)*, void (i8*)*, void (i8*, ...)*, i32 (i8*, i64, i8*, %struct.__va_list_tag.2*)*, i8*, [512 x i8*], [512 x i64], i8*, void (i8*, i32, i32, i8*, void (i8*, i32, i32)*)*, [1024 x %struct.ListManager.3*], [1024 x %struct.NodeManager.4*], [1024 x i8*], i8*, %struct.RandState.5*, i8*, void (i8*, i8*)*, void (i8*)*, [2048 x i8], [32 x i64], i32, i64, i8*, i32, i32, i64 }
%struct.PreallocatedMemoryChunk.1 = type { i8*, i8*, i64 }
%struct.__va_list_tag.2 = type { i32, i32, i8*, i8* }
%struct.ListManager.3 = type { [131072 x i8*], i64, i64, i32, i32, i32, %struct.LLVMRuntime.6* }
%struct.NodeManager.4 = type <{ %struct.LLVMRuntime.6*, i32, i32, i32, i32, %struct.ListManager.3*, %struct.ListManager.3*, %struct.ListManager.3*, i32, [4 x i8] }>
%struct.RandState.5 = type { i32, i32, i32, i32, i32 }
%struct.range_task_helper_context = type { %struct.RuntimeContext.7*, void (%struct.RuntimeContext.7*, i8*)*, void (%struct.RuntimeContext.7*, i8*, i32)*, void (%struct.RuntimeContext.7*, i8*)*, i64, i32, i32, i32, i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define void @taichi_kernel_cpu_c76_0_kernel_0_serial(%struct.RuntimeContext.7* nocapture readonly %context) local_unnamed_addr #0 {
entry:
  %0 = bitcast %struct.RuntimeContext.7* %context to { { { i32 }, float* }, { { i32 }, float* }, float }**
  %1 = load { { { i32 }, float* }, { { i32 }, float* }, float }*, { { { i32 }, float* }, { { i32 }, float* }, float }** %0, align 8
  %2 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %1, i64 0, i32 0, i32 0, i32 0
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds %struct.RuntimeContext.7, %struct.RuntimeContext.7* %context, i64 0, i32 1
  %5 = load %struct.LLVMRuntime.6*, %struct.LLVMRuntime.6** %4, align 8
  %6 = getelementptr inbounds %struct.LLVMRuntime.6, %struct.LLVMRuntime.6* %5, i64 0, i32 14
  %7 = bitcast i8** %6 to i32**
  %8 = load i32*, i32** %7, align 8
  store i32 %3, i32* %8, align 4
  ret void
}

; Function Attrs: nounwind
define void @taichi_kernel_cpu_c76_0_kernel_1_range_for(%struct.RuntimeContext.7* %context) local_unnamed_addr #1 {
entry:
  %0 = alloca %struct.range_task_helper_context, align 8
  %1 = bitcast %struct.range_task_helper_context* %0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 56, i8* nonnull %1)
  %2 = getelementptr inbounds %struct.range_task_helper_context, %struct.range_task_helper_context* %0, i64 0, i32 1
  %3 = getelementptr inbounds %struct.range_task_helper_context, %struct.range_task_helper_context* %0, i64 0, i32 4
  %4 = getelementptr inbounds %struct.range_task_helper_context, %struct.range_task_helper_context* %0, i64 0, i32 0
  store %struct.RuntimeContext.7* %context, %struct.RuntimeContext.7** %4, align 8
  store void (%struct.RuntimeContext.7*, i8*)* null, void (%struct.RuntimeContext.7*, i8*)** %2, align 8
  store i64 1, i64* %3, align 8
  %5 = getelementptr inbounds %struct.range_task_helper_context, %struct.range_task_helper_context* %0, i64 0, i32 2
  store void (%struct.RuntimeContext.7*, i8*, i32)* @function_body, void (%struct.RuntimeContext.7*, i8*, i32)** %5, align 8
  %6 = getelementptr inbounds %struct.range_task_helper_context, %struct.range_task_helper_context* %0, i64 0, i32 3
  store void (%struct.RuntimeContext.7*, i8*)* null, void (%struct.RuntimeContext.7*, i8*)** %6, align 8
  %7 = getelementptr inbounds %struct.range_task_helper_context, %struct.range_task_helper_context* %0, i64 0, i32 5
  %8 = bitcast i32* %7 to <4 x i32>*
  store <4 x i32> <i32 0, i32 12, i32 1, i32 1>, <4 x i32>* %8, align 8
  %9 = getelementptr inbounds %struct.RuntimeContext.7, %struct.RuntimeContext.7* %context, i64 0, i32 1
  %10 = load %struct.LLVMRuntime.6*, %struct.LLVMRuntime.6** %9, align 8
  %11 = getelementptr inbounds %struct.LLVMRuntime.6, %struct.LLVMRuntime.6* %10, i64 0, i32 10
  %12 = load void (i8*, i32, i32, i8*, void (i8*, i32, i32)*)*, void (i8*, i32, i32, i8*, void (i8*, i32, i32)*)** %11, align 8
  %13 = getelementptr inbounds %struct.LLVMRuntime.6, %struct.LLVMRuntime.6* %10, i64 0, i32 9
  %14 = load i8*, i8** %13, align 8
  call void %12(i8* noundef %14, i32 noundef 12, i32 noundef 12, i8* noundef nonnull %1, void (i8*, i32, i32)* noundef nonnull @cpu_parallel_range_for_task) #1
  call void @llvm.lifetime.end.p0i8(i64 56, i8* nonnull %1)
  ret void
}

; Function Attrs: nofree nosync nounwind
define internal void @function_body(%struct.RuntimeContext.7* nocapture readonly %0, i8* nocapture readnone %1, i32 %2) #2 {
allocs:
  %3 = getelementptr inbounds %struct.RuntimeContext.7, %struct.RuntimeContext.7* %0, i64 0, i32 1
  %4 = load %struct.LLVMRuntime.6*, %struct.LLVMRuntime.6** %3, align 8
  %5 = getelementptr inbounds %struct.LLVMRuntime.6, %struct.LLVMRuntime.6* %4, i64 0, i32 14
  %6 = bitcast i8** %5 to i32**
  %7 = load i32*, i32** %6, align 8
  %8 = load i32, i32* %7, align 4
  %9 = add i32 %8, 11
  %10 = sdiv i32 %9, 12
  %11 = icmp slt i32 %9, 0
  %12 = mul nsw i32 %10, 12
  %13 = icmp ne i32 %12, %9
  %14 = and i1 %11, %13
  %.neg = sext i1 %14 to i32
  %15 = add nsw i32 %10, %.neg
  %16 = tail call i32 @llvm.smax.i32(i32 %15, i32 512)
  %17 = mul i32 %16, %2
  %18 = add i32 %17, %16
  %19 = tail call i32 @llvm.smin.i32(i32 %8, i32 %18)
  %20 = bitcast %struct.RuntimeContext.7* %0 to { { { i32 }, float* }, { { i32 }, float* }, float }**
  %21 = load { { { i32 }, float* }, { { i32 }, float* }, float }*, { { { i32 }, float* }, { { i32 }, float* }, float }** %20, align 8
  %22 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %21, i64 0, i32 2
  %23 = load float, float* %22, align 4
  %24 = icmp slt i32 %17, %19
  br i1 %24, label %for_loop_body.lr.ph, label %after_for

for_loop_body.lr.ph:                              ; preds = %allocs
  %25 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %21, i64 0, i32 0, i32 1
  %26 = getelementptr { { { i32 }, float* }, { { i32 }, float* }, float }, { { { i32 }, float* }, { { i32 }, float* }, float }* %21, i64 0, i32 1, i32 1
  %27 = sext i32 %17 to i64
  %wide.trip.count = sext i32 %19 to i64
  %28 = sub nsw i64 %wide.trip.count, %27
  %29 = xor i64 %27, -1
  %30 = add nsw i64 %29, %wide.trip.count
  %xtraiter = and i64 %28, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for_loop_body.prol.loopexit, label %for_loop_body.prol.preheader

for_loop_body.prol.preheader:                     ; preds = %for_loop_body.lr.ph
  %31 = shl nuw nsw i64 %xtraiter, 2
  br label %for_loop_body.prol

for_loop_body.prol:                               ; preds = %for_loop_body.prol, %for_loop_body.prol.preheader
  %lsr.iv = phi i64 [ %31, %for_loop_body.prol.preheader ], [ %lsr.iv.next, %for_loop_body.prol ]
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for_loop_body.prol ], [ %27, %for_loop_body.prol.preheader ]
  %32 = load float*, float** %25, align 8
  %scevgep20 = getelementptr float, float* %32, i64 %indvars.iv.prol
  %33 = load float, float* %scevgep20, align 4
  %34 = fadd reassoc ninf nsz float %33, %23
  %35 = load float*, float** %26, align 8
  %scevgep19 = getelementptr float, float* %35, i64 %indvars.iv.prol
  store float %34, float* %scevgep19, align 4
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, 1
  %lsr.iv.next = add nsw i64 %lsr.iv, -4
  %prol.iter.cmp.not = icmp eq i64 %lsr.iv.next, 0
  br i1 %prol.iter.cmp.not, label %for_loop_body.prol.loopexit.loopexit, label %for_loop_body.prol, !llvm.loop !6

for_loop_body.prol.loopexit.loopexit:             ; preds = %for_loop_body.prol
  br label %for_loop_body.prol.loopexit

for_loop_body.prol.loopexit:                      ; preds = %for_loop_body.prol.loopexit.loopexit, %for_loop_body.lr.ph
  %indvars.iv.unr = phi i64 [ %27, %for_loop_body.lr.ph ], [ %indvars.iv.next.prol, %for_loop_body.prol.loopexit.loopexit ]
  %36 = icmp ult i64 %30, 3
  br i1 %36, label %after_for, label %for_loop_body.preheader

for_loop_body.preheader:                          ; preds = %for_loop_body.prol.loopexit
  br label %for_loop_body

for_loop_body:                                    ; preds = %for_loop_body, %for_loop_body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for_loop_body ], [ %indvars.iv.unr, %for_loop_body.preheader ]
  %37 = load float*, float** %25, align 8
  %scevgep13 = getelementptr float, float* %37, i64 %indvars.iv
  %38 = load float, float* %scevgep13, align 4
  %39 = fadd reassoc ninf nsz float %38, %23
  %40 = load float*, float** %26, align 8
  %scevgep14 = getelementptr float, float* %40, i64 %indvars.iv
  store float %39, float* %scevgep14, align 4
  %41 = load float*, float** %25, align 8
  %scevgep17 = getelementptr float, float* %41, i64 1
  %scevgep18 = getelementptr float, float* %scevgep17, i64 %indvars.iv
  %42 = load float, float* %scevgep18, align 4
  %43 = fadd reassoc ninf nsz float %42, %23
  %44 = load float*, float** %26, align 8
  %scevgep15 = getelementptr float, float* %44, i64 1
  %scevgep16 = getelementptr float, float* %scevgep15, i64 %indvars.iv
  store float %43, float* %scevgep16, align 4
  %45 = load float*, float** %25, align 8
  %scevgep11 = getelementptr float, float* %45, i64 2
  %scevgep12 = getelementptr float, float* %scevgep11, i64 %indvars.iv
  %46 = load float, float* %scevgep12, align 4
  %47 = fadd reassoc ninf nsz float %46, %23
  %48 = load float*, float** %26, align 8
  %scevgep9 = getelementptr float, float* %48, i64 2
  %scevgep10 = getelementptr float, float* %scevgep9, i64 %indvars.iv
  store float %47, float* %scevgep10, align 4
  %49 = load float*, float** %25, align 8
  %scevgep7 = getelementptr float, float* %49, i64 3
  %scevgep8 = getelementptr float, float* %scevgep7, i64 %indvars.iv
  %50 = load float, float* %scevgep8, align 4
  %51 = fadd reassoc ninf nsz float %50, %23
  %52 = load float*, float** %26, align 8
  %scevgep = getelementptr float, float* %52, i64 3
  %scevgep6 = getelementptr float, float* %scevgep, i64 %indvars.iv
  store float %51, float* %scevgep6, align 4
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.not.3 = icmp eq i64 %wide.trip.count, %indvars.iv.next.3
  br i1 %exitcond.not.3, label %after_for.loopexit, label %for_loop_body

after_for.loopexit:                               ; preds = %for_loop_body
  br label %after_for

after_for:                                        ; preds = %after_for.loopexit, %for_loop_body.prol.loopexit, %allocs
  ret void
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal void @cpu_parallel_range_for_task(i8* nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) #3 {
  %4 = alloca %struct.RuntimeContext.7, align 8
  %.sroa.0.0..sroa_cast = bitcast i8* %0 to %struct.RuntimeContext.7**
  %.sroa.0.0.copyload = load %struct.RuntimeContext.7*, %struct.RuntimeContext.7** %.sroa.0.0..sroa_cast, align 8
  %.sroa.4.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 8
  %.sroa.4.0..sroa_cast = bitcast i8* %.sroa.4.0..sroa_idx to void (%struct.RuntimeContext.7*, i8*)**
  %.sroa.4.0.copyload = load void (%struct.RuntimeContext.7*, i8*)*, void (%struct.RuntimeContext.7*, i8*)** %.sroa.4.0..sroa_cast, align 8
  %.sroa.5.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 16
  %.sroa.5.0..sroa_cast = bitcast i8* %.sroa.5.0..sroa_idx to void (%struct.RuntimeContext.7*, i8*, i32)**
  %.sroa.5.0.copyload = load void (%struct.RuntimeContext.7*, i8*, i32)*, void (%struct.RuntimeContext.7*, i8*, i32)** %.sroa.5.0..sroa_cast, align 8
  %.sroa.7.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 24
  %.sroa.7.0..sroa_cast = bitcast i8* %.sroa.7.0..sroa_idx to void (%struct.RuntimeContext.7*, i8*)**
  %.sroa.7.0.copyload = load void (%struct.RuntimeContext.7*, i8*)*, void (%struct.RuntimeContext.7*, i8*)** %.sroa.7.0..sroa_cast, align 8
  %.sroa.8.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 32
  %.sroa.8.0..sroa_cast = bitcast i8* %.sroa.8.0..sroa_idx to i64*
  %.sroa.8.0.copyload = load i64, i64* %.sroa.8.0..sroa_cast, align 8
  %.sroa.9.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 40
  %.sroa.9.0..sroa_cast = bitcast i8* %.sroa.9.0..sroa_idx to i32*
  %.sroa.9.0.copyload = load i32, i32* %.sroa.9.0..sroa_cast, align 8
  %.sroa.12.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 44
  %.sroa.12.0..sroa_cast = bitcast i8* %.sroa.12.0..sroa_idx to i32*
  %.sroa.12.0.copyload = load i32, i32* %.sroa.12.0..sroa_cast, align 4
  %.sroa.15.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 48
  %.sroa.15.0..sroa_cast = bitcast i8* %.sroa.15.0..sroa_idx to i32*
  %.sroa.15.0.copyload = load i32, i32* %.sroa.15.0..sroa_cast, align 8
  %.sroa.17.0..sroa_idx = getelementptr inbounds i8, i8* %0, i64 52
  %.sroa.17.0..sroa_cast = bitcast i8* %.sroa.17.0..sroa_idx to i32*
  %.sroa.17.0.copyload = load i32, i32* %.sroa.17.0..sroa_cast, align 4
  %5 = alloca i8, i64 %.sroa.8.0.copyload, align 8
  %.not = icmp eq void (%struct.RuntimeContext.7*, i8*)* %.sroa.4.0.copyload, null
  br i1 %.not, label %7, label %6

6:                                                ; preds = %3
  call void %.sroa.4.0.copyload(%struct.RuntimeContext.7* noundef %.sroa.0.0.copyload, i8* noundef nonnull %5) #1
  br label %7

7:                                                ; preds = %6, %3
  %8 = bitcast %struct.RuntimeContext.7* %.sroa.0.0.copyload to i8*
  %9 = bitcast %struct.RuntimeContext.7* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %9, i8* noundef nonnull align 8 dereferenceable(32) %8, i64 32, i1 false)
  %10 = getelementptr inbounds %struct.RuntimeContext.7, %struct.RuntimeContext.7* %4, i64 0, i32 2
  store i32 %1, i32* %10, align 8
  switch i32 %.sroa.17.0.copyload, label %.loopexit [
    i32 1, label %11
    i32 -1, label %19
  ]

11:                                               ; preds = %7
  %12 = mul nsw i32 %.sroa.15.0.copyload, %2
  %13 = add nsw i32 %12, %.sroa.9.0.copyload
  %14 = add nsw i32 %13, %.sroa.15.0.copyload
  %15 = call i32 @llvm.smin.i32(i32 %.sroa.12.0.copyload, i32 %14)
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %11
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.02039 = phi i32 [ %17, %.lr.ph ], [ %13, %.lr.ph.preheader ]
  call void %.sroa.5.0.copyload(%struct.RuntimeContext.7* noundef nonnull %4, i8* noundef nonnull %5, i32 noundef %.02039) #1
  %17 = add nsw i32 %.02039, 1
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph, label %.loopexit.loopexit, !llvm.loop !8

19:                                               ; preds = %7
  %20 = mul nsw i32 %.sroa.15.0.copyload, %2
  %21 = sub nsw i32 %.sroa.12.0.copyload, %20
  %22 = mul nsw i32 %21, %.sroa.15.0.copyload
  %23 = call i32 @llvm.smax.i32(i32 %.sroa.9.0.copyload, i32 %22)
  %.not25.not40 = icmp sgt i32 %21, %23
  br i1 %.not25.not40, label %.lr.ph42.preheader, label %.loopexit

.lr.ph42.preheader:                               ; preds = %19
  br label %.lr.ph42

.lr.ph42:                                         ; preds = %.lr.ph42, %.lr.ph42.preheader
  %.0.in41 = phi i32 [ %.0, %.lr.ph42 ], [ %21, %.lr.ph42.preheader ]
  %.0 = add nsw i32 %.0.in41, -1
  call void %.sroa.5.0.copyload(%struct.RuntimeContext.7* noundef nonnull %4, i8* noundef nonnull %5, i32 noundef %.0) #1
  %.not25.not = icmp sgt i32 %.0, %23
  br i1 %.not25.not, label %.lr.ph42, label %.loopexit.loopexit47, !llvm.loop !10

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit.loopexit47:                             ; preds = %.lr.ph42
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit47, %.loopexit.loopexit, %19, %11, %7
  %.not24 = icmp eq void (%struct.RuntimeContext.7*, i8*)* %.sroa.7.0.copyload, null
  br i1 %.not24, label %25, label %24

24:                                               ; preds = %.loopexit
  call void %.sroa.7.0.copyload(%struct.RuntimeContext.7* noundef %.sroa.0.0.copyload, i8* noundef nonnull %5) #1
  br label %25

25:                                               ; preds = %24, %.loopexit
  ret void
}

; Function Attrs: argmemonly mustprogress nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #5

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #5

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn }
attributes #1 = { nounwind }
attributes #2 = { nofree nosync nounwind }
attributes #3 = { alwaysinline mustprogress nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nocallback nofree nounwind willreturn }
attributes #5 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { argmemonly nocallback nofree nosync nounwind willreturn }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = distinct !{!10, !9}
