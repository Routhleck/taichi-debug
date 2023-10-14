; ModuleID = '<string>'
source_filename = "kernel"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.RuntimeContext.0 = type { ptr, ptr, [64 x i64], [32 x [12 x i32]], i32, ptr }
%struct.LLVMRuntime = type { %struct.PreallocatedMemoryChunk, ptr, ptr, ptr, ptr, ptr, [512 x ptr], [512 x i64], ptr, ptr, [1024 x ptr], [1024 x ptr], ptr, [1024 x ptr], ptr, ptr, ptr, ptr, ptr, [2048 x i8], [32 x i64], i32, i64, ptr, i32, i32, i64 }
%struct.PreallocatedMemoryChunk = type { ptr, ptr, i64 }
%struct.range_task_helper_context = type { ptr, ptr, ptr, ptr, i64, i32, i32, i32, i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define void @taichi_kernel_cpu_c74_0_kernel_0_serial(ptr nocapture readonly %context) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds %struct.RuntimeContext.0, ptr %context, i64 0, i32 3, i64 0
  %1 = load i32, ptr %0, align 4
  %2 = getelementptr inbounds %struct.RuntimeContext.0, ptr %context, i64 0, i32 1
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.LLVMRuntime, ptr %3, i64 0, i32 14
  %5 = load ptr, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  ret void
}

; Function Attrs: nounwind
define void @taichi_kernel_cpu_c74_0_kernel_1_range_for(ptr %context) local_unnamed_addr #1 {
entry:
  %0 = alloca %struct.range_task_helper_context, align 8
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %0)
  %1 = getelementptr inbounds %struct.range_task_helper_context, ptr %0, i64 0, i32 1
  %2 = getelementptr inbounds %struct.range_task_helper_context, ptr %0, i64 0, i32 4
  store ptr %context, ptr %0, align 8
  store ptr null, ptr %1, align 8
  store i64 1, ptr %2, align 8
  %3 = getelementptr inbounds %struct.range_task_helper_context, ptr %0, i64 0, i32 2
  store ptr @function_body, ptr %3, align 8
  %4 = getelementptr inbounds %struct.range_task_helper_context, ptr %0, i64 0, i32 3
  store ptr null, ptr %4, align 8
  %5 = getelementptr inbounds %struct.range_task_helper_context, ptr %0, i64 0, i32 5
  store <4 x i32> <i32 0, i32 16, i32 1, i32 1>, ptr %5, align 8
  %6 = getelementptr inbounds %struct.RuntimeContext.0, ptr %context, i64 0, i32 1
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %struct.LLVMRuntime, ptr %7, i64 0, i32 9
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.LLVMRuntime, ptr %7, i64 0, i32 8
  %11 = load ptr, ptr %10, align 8
  call void %9(ptr noundef %11, i32 noundef 16, i32 noundef 16, ptr noundef nonnull %0, ptr noundef nonnull @cpu_parallel_range_for_task) #1
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %0)
  ret void
}

; Function Attrs: nofree nosync nounwind
define internal void @function_body(ptr nocapture readonly %0, ptr nocapture readnone %1, i32 %2) #2 {
allocs:
  %3 = getelementptr inbounds %struct.RuntimeContext.0, ptr %0, i64 0, i32 1
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.LLVMRuntime, ptr %4, i64 0, i32 14
  %6 = load ptr, ptr %5, align 8
  %7 = load i32, ptr %6, align 4
  %8 = add i32 %7, 15
  %9 = sdiv i32 %8, 16
  %.lobit = lshr i32 %8, 31
  %10 = shl nsw i32 %9, 4
  %11 = icmp ne i32 %8, 0
  %12 = zext i1 %11 to i32
  %13 = icmp ne i32 %10, %8
  %14 = zext i1 %13 to i32
  %15 = and i32 %.lobit, %12
  %16 = and i32 %15, %14
  %17 = sub nsw i32 %9, %16
  %18 = tail call i32 @llvm.smax.i32(i32 %17, i32 512)
  %19 = mul i32 %18, %2
  %20 = add i32 %19, %18
  %21 = tail call i32 @llvm.smin.i32(i32 %7, i32 %20)
  %22 = load ptr, ptr %0, align 8
  %23 = load ptr, ptr %22, align 8
  %24 = ptrtoint ptr %23 to i64
  %25 = getelementptr { ptr, ptr, float }, ptr %22, i64 0, i32 2
  %26 = load float, ptr %25, align 4
  %27 = getelementptr { ptr, ptr, float }, ptr %22, i64 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = ptrtoint ptr %28 to i64
  %30 = icmp slt i32 %19, %21
  br i1 %30, label %for_loop_body.preheader, label %after_for

for_loop_body.preheader:                          ; preds = %allocs
  %31 = sext i32 %19 to i64
  %wide.trip.count = sext i32 %21 to i64
  %32 = sub nsw i64 %wide.trip.count, %31
  %min.iters.check = icmp ult i64 %32, 12
  br i1 %min.iters.check, label %for_loop_body.preheader9, label %vector.memcheck

vector.memcheck:                                  ; preds = %for_loop_body.preheader
  %33 = shl nsw i64 %31, 2
  %34 = add i64 %33, %29
  %35 = add i64 %33, %24
  %36 = sub i64 %34, %35
  %diff.check = icmp ult i64 %36, 32
  br i1 %diff.check, label %for_loop_body.preheader9, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %32, -8
  %broadcast.splatinsert = insertelement <4 x float> poison, float %26, i64 0
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> poison, <4 x i32> zeroinitializer
  %37 = getelementptr i8, ptr %23, i64 %33
  %uglygep1117 = getelementptr i8, ptr %37, i64 16
  %38 = getelementptr i8, ptr %28, i64 %33
  %uglygep1418 = getelementptr i8, ptr %38, i64 16
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %39 = shl i64 %index, 2
  %uglygep12 = getelementptr i8, ptr %uglygep1117, i64 %39
  %uglygep13 = getelementptr i8, ptr %uglygep12, i64 -16
  %wide.load = load <4 x float>, ptr %uglygep13, align 4
  %wide.load6 = load <4 x float>, ptr %uglygep12, align 4
  %40 = fadd reassoc ninf nsz <4 x float> %wide.load, %broadcast.splat
  %41 = fadd reassoc ninf nsz <4 x float> %wide.load6, %broadcast.splat
  %uglygep15 = getelementptr i8, ptr %uglygep1418, i64 %39
  %uglygep16 = getelementptr i8, ptr %uglygep15, i64 -16
  store <4 x float> %40, ptr %uglygep16, align 4
  store <4 x float> %41, ptr %uglygep15, align 4
  %index.next = add nuw i64 %index, 8
  %42 = icmp eq i64 %n.vec, %index.next
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %ind.end = add nsw i64 %n.vec, %31
  %cmp.n = icmp eq i64 %32, %n.vec
  br i1 %cmp.n, label %after_for, label %for_loop_body.preheader9

for_loop_body.preheader9:                         ; preds = %middle.block, %vector.memcheck, %for_loop_body.preheader
  %indvars.iv.ph = phi i64 [ %31, %vector.memcheck ], [ %31, %for_loop_body.preheader ], [ %ind.end, %middle.block ]
  br label %for_loop_body

for_loop_body:                                    ; preds = %for_loop_body, %for_loop_body.preheader9
  %indvars.iv = phi i64 [ %indvars.iv.next, %for_loop_body ], [ %indvars.iv.ph, %for_loop_body.preheader9 ]
  %43 = shl i64 %indvars.iv, 2
  %uglygep = getelementptr i8, ptr %23, i64 %43
  %44 = load float, ptr %uglygep, align 4
  %45 = fadd reassoc ninf nsz float %44, %26
  %uglygep10 = getelementptr i8, ptr %28, i64 %43
  store float %45, ptr %uglygep10, align 4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %wide.trip.count, %indvars.iv.next
  br i1 %exitcond.not, label %after_for.loopexit, label %for_loop_body, !llvm.loop !8

after_for.loopexit:                               ; preds = %for_loop_body
  br label %after_for

after_for:                                        ; preds = %after_for.loopexit, %middle.block, %allocs
  ret void
}

; Function Attrs: alwaysinline mustprogress nounwind uwtable
define internal void @cpu_parallel_range_for_task(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) #3 {
  %4 = alloca %struct.RuntimeContext.0, align 8
  %.sroa.0.0.copyload = load ptr, ptr %0, align 8
  %.sroa.4.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 8
  %.sroa.4.0.copyload = load ptr, ptr %.sroa.4.0..sroa_idx, align 8
  %.sroa.5.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 16
  %.sroa.5.0.copyload = load ptr, ptr %.sroa.5.0..sroa_idx, align 8
  %.sroa.7.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 24
  %.sroa.7.0.copyload = load ptr, ptr %.sroa.7.0..sroa_idx, align 8
  %.sroa.8.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 32
  %.sroa.8.0.copyload = load i64, ptr %.sroa.8.0..sroa_idx, align 8
  %.sroa.9.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 40
  %.sroa.9.0.copyload = load i32, ptr %.sroa.9.0..sroa_idx, align 8
  %.sroa.12.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 44
  %.sroa.12.0.copyload = load i32, ptr %.sroa.12.0..sroa_idx, align 4
  %.sroa.15.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 48
  %.sroa.15.0.copyload = load i32, ptr %.sroa.15.0..sroa_idx, align 8
  %.sroa.17.0..sroa_idx = getelementptr inbounds i8, ptr %0, i64 52
  %.sroa.17.0.copyload = load i32, ptr %.sroa.17.0..sroa_idx, align 4
  %5 = alloca i8, i64 %.sroa.8.0.copyload, align 8
  %.not = icmp eq ptr %.sroa.4.0.copyload, null
  br i1 %.not, label %7, label %6

6:                                                ; preds = %3
  call void %.sroa.4.0.copyload(ptr noundef %.sroa.0.0.copyload, ptr noundef nonnull %5) #1
  br label %7

7:                                                ; preds = %6, %3
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(2080) %4, ptr noundef nonnull align 8 dereferenceable(2080) %.sroa.0.0.copyload, i64 2080, i1 false)
  %8 = getelementptr inbounds %struct.RuntimeContext.0, ptr %4, i64 0, i32 4
  store i32 %1, ptr %8, align 8
  switch i32 %.sroa.17.0.copyload, label %.loopexit [
    i32 1, label %9
    i32 -1, label %17
  ]

9:                                                ; preds = %7
  %10 = mul nsw i32 %.sroa.15.0.copyload, %2
  %11 = add nsw i32 %10, %.sroa.9.0.copyload
  %12 = add nsw i32 %11, %.sroa.15.0.copyload
  %13 = call i32 @llvm.smin.i32(i32 %.sroa.12.0.copyload, i32 %12)
  %14 = icmp slt i32 %11, %13
  br i1 %14, label %.lr.ph.preheader, label %.loopexit

.lr.ph.preheader:                                 ; preds = %9
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %.02039 = phi i32 [ %15, %.lr.ph ], [ %11, %.lr.ph.preheader ]
  call void %.sroa.5.0.copyload(ptr noundef nonnull %4, ptr noundef nonnull %5, i32 noundef %.02039) #1
  %15 = add nsw i32 %.02039, 1
  %16 = icmp slt i32 %15, %13
  br i1 %16, label %.lr.ph, label %.loopexit.loopexit, !llvm.loop !9

17:                                               ; preds = %7
  %18 = mul nsw i32 %.sroa.15.0.copyload, %2
  %19 = sub nsw i32 %.sroa.12.0.copyload, %18
  %20 = mul nsw i32 %19, %.sroa.15.0.copyload
  %21 = call i32 @llvm.smax.i32(i32 %.sroa.9.0.copyload, i32 %20)
  %.not25.not40 = icmp sgt i32 %19, %21
  br i1 %.not25.not40, label %.lr.ph42.preheader, label %.loopexit

.lr.ph42.preheader:                               ; preds = %17
  br label %.lr.ph42

.lr.ph42:                                         ; preds = %.lr.ph42, %.lr.ph42.preheader
  %.0.in41 = phi i32 [ %.0, %.lr.ph42 ], [ %19, %.lr.ph42.preheader ]
  %.0 = add nsw i32 %.0.in41, -1
  call void %.sroa.5.0.copyload(ptr noundef nonnull %4, ptr noundef nonnull %5, i32 noundef %.0) #1
  %.not25.not = icmp sgt i32 %.0, %21
  br i1 %.not25.not, label %.lr.ph42, label %.loopexit.loopexit47, !llvm.loop !11

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit.loopexit47:                             ; preds = %.lr.ph42
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit47, %.loopexit.loopexit, %17, %9, %7
  %.not24 = icmp eq ptr %.sroa.7.0.copyload, null
  br i1 %.not24, label %23, label %22

22:                                               ; preds = %.loopexit
  call void %.sroa.7.0.copyload(ptr noundef %.sroa.0.0.copyload, ptr noundef nonnull %5) #1
  br label %23

23:                                               ; preds = %22, %.loopexit
  ret void
}

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #5

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #5

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #6

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn }
attributes #1 = { nounwind }
attributes #2 = { nofree nosync nounwind }
attributes #3 = { alwaysinline mustprogress nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nocallback nofree nounwind willreturn }
attributes #5 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #6 = { argmemonly nocallback nofree nosync nounwind willreturn }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 15.0.7"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.isvectorized", i32 1}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
