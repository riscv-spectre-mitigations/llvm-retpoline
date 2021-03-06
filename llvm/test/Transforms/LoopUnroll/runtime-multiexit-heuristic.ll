; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -unroll-runtime-other-exit-predictable=false -loop-unroll -unroll-runtime=true -verify-dom-info -verify-loop-info -instcombine -S | FileCheck %s
; RUN: opt < %s -unroll-runtime-other-exit-predictable=false -loop-unroll -unroll-runtime=true -verify-dom-info -unroll-runtime-multi-exit=false -verify-loop-info -S | FileCheck %s -check-prefix=NOUNROLL

; this tests when unrolling multiple exit loop occurs by default (i.e. without specifying -unroll-runtime-multi-exit)

; the second exit block is a deopt block. The loop has one exiting block other than the latch.
define i32 @test1(i32* nocapture %a, i64 %n) {
;
; CHECK-LABEL: @test1(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[TMP0:%.*]] = add i64 [[N:%.*]], -1
; CHECK-NEXT:    [[XTRAITER:%.*]] = and i64 [[N]], 7
; CHECK-NEXT:    [[TMP1:%.*]] = icmp ult i64 [[TMP0]], 7
; CHECK-NEXT:    br i1 [[TMP1]], label [[LATCHEXIT_UNR_LCSSA:%.*]], label [[ENTRY_NEW:%.*]]
; CHECK:       entry.new:
; CHECK-NEXT:    [[UNROLL_ITER:%.*]] = and i64 [[N]], -8
; CHECK-NEXT:    br label [[HEADER:%.*]]
; CHECK:       header:
; CHECK-NEXT:    [[INDVARS_IV:%.*]] = phi i64 [ 0, [[ENTRY_NEW]] ], [ [[INDVARS_IV_NEXT_7:%.*]], [[LATCH_7:%.*]] ]
; CHECK-NEXT:    [[SUM_02:%.*]] = phi i32 [ 0, [[ENTRY_NEW]] ], [ [[ADD_7:%.*]], [[LATCH_7]] ]
; CHECK-NEXT:    [[NITER:%.*]] = phi i64 [ 0, [[ENTRY_NEW]] ], [ [[NITER_NEXT_7:%.*]], [[LATCH_7]] ]
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK:%.*]]
; CHECK:       for.exiting_block:
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP]], label [[OTHEREXIT_LOOPEXIT:%.*]], label [[LATCH:%.*]]
; CHECK:       latch:
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds i32, i32* [[A:%.*]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    [[TMP2:%.*]] = load i32, i32* [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[ADD:%.*]] = add nsw i32 [[TMP2]], [[SUM_02]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT:%.*]] = or i64 [[INDVARS_IV]], 1
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_1:%.*]]
; CHECK:       for.exiting_block.1:
; CHECK-NEXT:    [[CMP_1:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_1]], label [[OTHEREXIT_LOOPEXIT]], label [[LATCH_1:%.*]]
; CHECK:       latch.1:
; CHECK-NEXT:    [[ARRAYIDX_1:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_NEXT]]
; CHECK-NEXT:    [[TMP3:%.*]] = load i32, i32* [[ARRAYIDX_1]], align 4
; CHECK-NEXT:    [[ADD_1:%.*]] = add nsw i32 [[TMP3]], [[ADD]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_1:%.*]] = or i64 [[INDVARS_IV]], 2
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_2:%.*]]
; CHECK:       for.exiting_block.2:
; CHECK-NEXT:    [[CMP_2:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_2]], label [[OTHEREXIT_LOOPEXIT]], label [[LATCH_2:%.*]]
; CHECK:       latch.2:
; CHECK-NEXT:    [[ARRAYIDX_2:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_NEXT_1]]
; CHECK-NEXT:    [[TMP4:%.*]] = load i32, i32* [[ARRAYIDX_2]], align 4
; CHECK-NEXT:    [[ADD_2:%.*]] = add nsw i32 [[TMP4]], [[ADD_1]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_2:%.*]] = or i64 [[INDVARS_IV]], 3
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_3:%.*]]
; CHECK:       for.exiting_block.3:
; CHECK-NEXT:    [[CMP_3:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_3]], label [[OTHEREXIT_LOOPEXIT]], label [[LATCH_3:%.*]]
; CHECK:       latch.3:
; CHECK-NEXT:    [[ARRAYIDX_3:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_NEXT_2]]
; CHECK-NEXT:    [[TMP5:%.*]] = load i32, i32* [[ARRAYIDX_3]], align 4
; CHECK-NEXT:    [[ADD_3:%.*]] = add nsw i32 [[TMP5]], [[ADD_2]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_3:%.*]] = or i64 [[INDVARS_IV]], 4
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_4:%.*]]
; CHECK:       for.exiting_block.4:
; CHECK-NEXT:    [[CMP_4:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_4]], label [[OTHEREXIT_LOOPEXIT]], label [[LATCH_4:%.*]]
; CHECK:       latch.4:
; CHECK-NEXT:    [[ARRAYIDX_4:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_NEXT_3]]
; CHECK-NEXT:    [[TMP6:%.*]] = load i32, i32* [[ARRAYIDX_4]], align 4
; CHECK-NEXT:    [[ADD_4:%.*]] = add nsw i32 [[TMP6]], [[ADD_3]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_4:%.*]] = or i64 [[INDVARS_IV]], 5
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_5:%.*]]
; CHECK:       for.exiting_block.5:
; CHECK-NEXT:    [[CMP_5:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_5]], label [[OTHEREXIT_LOOPEXIT]], label [[LATCH_5:%.*]]
; CHECK:       latch.5:
; CHECK-NEXT:    [[ARRAYIDX_5:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_NEXT_4]]
; CHECK-NEXT:    [[TMP7:%.*]] = load i32, i32* [[ARRAYIDX_5]], align 4
; CHECK-NEXT:    [[ADD_5:%.*]] = add nsw i32 [[TMP7]], [[ADD_4]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_5:%.*]] = or i64 [[INDVARS_IV]], 6
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_6:%.*]]
; CHECK:       for.exiting_block.6:
; CHECK-NEXT:    [[CMP_6:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_6]], label [[OTHEREXIT_LOOPEXIT]], label [[LATCH_6:%.*]]
; CHECK:       latch.6:
; CHECK-NEXT:    [[ARRAYIDX_6:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_NEXT_5]]
; CHECK-NEXT:    [[TMP8:%.*]] = load i32, i32* [[ARRAYIDX_6]], align 4
; CHECK-NEXT:    [[ADD_6:%.*]] = add nsw i32 [[TMP8]], [[ADD_5]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_6:%.*]] = or i64 [[INDVARS_IV]], 7
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_7:%.*]]
; CHECK:       for.exiting_block.7:
; CHECK-NEXT:    [[CMP_7:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_7]], label [[OTHEREXIT_LOOPEXIT]], label [[LATCH_7]]
; CHECK:       latch.7:
; CHECK-NEXT:    [[ARRAYIDX_7:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_NEXT_6]]
; CHECK-NEXT:    [[TMP9:%.*]] = load i32, i32* [[ARRAYIDX_7]], align 4
; CHECK-NEXT:    [[ADD_7]] = add nsw i32 [[TMP9]], [[ADD_6]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_7]] = add i64 [[INDVARS_IV]], 8
; CHECK-NEXT:    [[NITER_NEXT_7]] = add i64 [[NITER]], 8
; CHECK-NEXT:    [[NITER_NCMP_7:%.*]] = icmp eq i64 [[NITER_NEXT_7]], [[UNROLL_ITER]]
; CHECK-NEXT:    br i1 [[NITER_NCMP_7]], label [[LATCHEXIT_UNR_LCSSA_LOOPEXIT:%.*]], label [[HEADER]]
; CHECK:       latchexit.unr-lcssa.loopexit:
; CHECK-NEXT:    br label [[LATCHEXIT_UNR_LCSSA]]
; CHECK:       latchexit.unr-lcssa:
; CHECK-NEXT:    [[SUM_0_LCSSA_PH:%.*]] = phi i32 [ undef, [[ENTRY:%.*]] ], [ [[ADD_7]], [[LATCHEXIT_UNR_LCSSA_LOOPEXIT]] ]
; CHECK-NEXT:    [[INDVARS_IV_UNR:%.*]] = phi i64 [ 0, [[ENTRY]] ], [ [[INDVARS_IV_NEXT_7]], [[LATCHEXIT_UNR_LCSSA_LOOPEXIT]] ]
; CHECK-NEXT:    [[SUM_02_UNR:%.*]] = phi i32 [ 0, [[ENTRY]] ], [ [[ADD_7]], [[LATCHEXIT_UNR_LCSSA_LOOPEXIT]] ]
; CHECK-NEXT:    [[LCMP_MOD_NOT:%.*]] = icmp eq i64 [[XTRAITER]], 0
; CHECK-NEXT:    br i1 [[LCMP_MOD_NOT]], label [[LATCHEXIT:%.*]], label [[HEADER_EPIL_PREHEADER:%.*]]
; CHECK:       header.epil.preheader:
; CHECK-NEXT:    br label [[HEADER_EPIL:%.*]]
; CHECK:       header.epil:
; CHECK-NEXT:    [[INDVARS_IV_EPIL:%.*]] = phi i64 [ [[INDVARS_IV_NEXT_EPIL:%.*]], [[LATCH_EPIL:%.*]] ], [ [[INDVARS_IV_UNR]], [[HEADER_EPIL_PREHEADER]] ]
; CHECK-NEXT:    [[SUM_02_EPIL:%.*]] = phi i32 [ [[ADD_EPIL:%.*]], [[LATCH_EPIL]] ], [ [[SUM_02_UNR]], [[HEADER_EPIL_PREHEADER]] ]
; CHECK-NEXT:    [[EPIL_ITER:%.*]] = phi i64 [ [[EPIL_ITER_NEXT:%.*]], [[LATCH_EPIL]] ], [ 0, [[HEADER_EPIL_PREHEADER]] ]
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK_EPIL:%.*]]
; CHECK:       for.exiting_block.epil:
; CHECK-NEXT:    [[CMP_EPIL:%.*]] = icmp eq i64 [[N]], 42
; CHECK-NEXT:    br i1 [[CMP_EPIL]], label [[OTHEREXIT_LOOPEXIT3:%.*]], label [[LATCH_EPIL]]
; CHECK:       latch.epil:
; CHECK-NEXT:    [[ARRAYIDX_EPIL:%.*]] = getelementptr inbounds i32, i32* [[A]], i64 [[INDVARS_IV_EPIL]]
; CHECK-NEXT:    [[TMP10:%.*]] = load i32, i32* [[ARRAYIDX_EPIL]], align 4
; CHECK-NEXT:    [[ADD_EPIL]] = add nsw i32 [[TMP10]], [[SUM_02_EPIL]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT_EPIL]] = add i64 [[INDVARS_IV_EPIL]], 1
; CHECK-NEXT:    [[EPIL_ITER_NEXT]] = add i64 [[EPIL_ITER]], 1
; CHECK-NEXT:    [[EPIL_ITER_CMP_NOT:%.*]] = icmp eq i64 [[EPIL_ITER_NEXT]], [[XTRAITER]]
; CHECK-NEXT:    br i1 [[EPIL_ITER_CMP_NOT]], label [[LATCHEXIT_EPILOG_LCSSA:%.*]], label [[HEADER_EPIL]], !llvm.loop [[LOOP0:![0-9]+]]
; CHECK:       latchexit.epilog-lcssa:
; CHECK-NEXT:    br label [[LATCHEXIT]]
; CHECK:       latchexit:
; CHECK-NEXT:    [[SUM_0_LCSSA:%.*]] = phi i32 [ [[SUM_0_LCSSA_PH]], [[LATCHEXIT_UNR_LCSSA]] ], [ [[ADD_EPIL]], [[LATCHEXIT_EPILOG_LCSSA]] ]
; CHECK-NEXT:    ret i32 [[SUM_0_LCSSA]]
; CHECK:       otherexit.loopexit:
; CHECK-NEXT:    [[SUM_02_LCSSA_PH:%.*]] = phi i32 [ [[SUM_02]], [[FOR_EXITING_BLOCK]] ], [ [[ADD]], [[FOR_EXITING_BLOCK_1]] ], [ [[ADD_1]], [[FOR_EXITING_BLOCK_2]] ], [ [[ADD_2]], [[FOR_EXITING_BLOCK_3]] ], [ [[ADD_3]], [[FOR_EXITING_BLOCK_4]] ], [ [[ADD_4]], [[FOR_EXITING_BLOCK_5]] ], [ [[ADD_5]], [[FOR_EXITING_BLOCK_6]] ], [ [[ADD_6]], [[FOR_EXITING_BLOCK_7]] ]
; CHECK-NEXT:    br label [[OTHEREXIT:%.*]]
; CHECK:       otherexit.loopexit3:
; CHECK-NEXT:    br label [[OTHEREXIT]]
; CHECK:       otherexit:
; CHECK-NEXT:    [[SUM_02_LCSSA:%.*]] = phi i32 [ [[SUM_02_LCSSA_PH]], [[OTHEREXIT_LOOPEXIT]] ], [ [[SUM_02_EPIL]], [[OTHEREXIT_LOOPEXIT3]] ]
; CHECK-NEXT:    [[RVAL:%.*]] = call i32 (...) @llvm.experimental.deoptimize.i32() [ "deopt"(i32 [[SUM_02_LCSSA]]) ]
; CHECK-NEXT:    ret i32 [[RVAL]]
;
; NOUNROLL-LABEL: @test1(
; NOUNROLL-NEXT:  entry:
; NOUNROLL-NEXT:    br label [[HEADER:%.*]]
; NOUNROLL:       header:
; NOUNROLL-NEXT:    [[INDVARS_IV:%.*]] = phi i64 [ [[INDVARS_IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[ENTRY:%.*]] ]
; NOUNROLL-NEXT:    [[SUM_02:%.*]] = phi i32 [ [[ADD:%.*]], [[LATCH]] ], [ 0, [[ENTRY]] ]
; NOUNROLL-NEXT:    br label [[FOR_EXITING_BLOCK:%.*]]
; NOUNROLL:       for.exiting_block:
; NOUNROLL-NEXT:    [[CMP:%.*]] = icmp eq i64 [[N:%.*]], 42
; NOUNROLL-NEXT:    br i1 [[CMP]], label [[OTHEREXIT:%.*]], label [[LATCH]]
; NOUNROLL:       latch:
; NOUNROLL-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds i32, i32* [[A:%.*]], i64 [[INDVARS_IV]]
; NOUNROLL-NEXT:    [[TMP0:%.*]] = load i32, i32* [[ARRAYIDX]], align 4
; NOUNROLL-NEXT:    [[ADD]] = add nsw i32 [[TMP0]], [[SUM_02]]
; NOUNROLL-NEXT:    [[INDVARS_IV_NEXT]] = add i64 [[INDVARS_IV]], 1
; NOUNROLL-NEXT:    [[EXITCOND:%.*]] = icmp eq i64 [[INDVARS_IV_NEXT]], [[N]]
; NOUNROLL-NEXT:    br i1 [[EXITCOND]], label [[LATCHEXIT:%.*]], label [[HEADER]]
; NOUNROLL:       latchexit:
; NOUNROLL-NEXT:    [[SUM_0_LCSSA:%.*]] = phi i32 [ [[ADD]], [[LATCH]] ]
; NOUNROLL-NEXT:    ret i32 [[SUM_0_LCSSA]]
; NOUNROLL:       otherexit:
; NOUNROLL-NEXT:    [[SUM_02_LCSSA:%.*]] = phi i32 [ [[SUM_02]], [[FOR_EXITING_BLOCK]] ]
; NOUNROLL-NEXT:    [[RVAL:%.*]] = call i32 (...) @llvm.experimental.deoptimize.i32() [ "deopt"(i32 [[SUM_02_LCSSA]]) ]
; NOUNROLL-NEXT:    ret i32 [[RVAL]]
;
entry:
  br label %header

header:
  %indvars.iv = phi i64 [ %indvars.iv.next, %latch ], [ 0, %entry ]
  %sum.02 = phi i32 [ %add, %latch ], [ 0, %entry ]
  br label %for.exiting_block

for.exiting_block:
  %cmp = icmp eq i64 %n, 42
  br i1 %cmp, label %otherexit, label %latch

latch:
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4
  %add = add nsw i32 %0, %sum.02
  %indvars.iv.next = add i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %n
  br i1 %exitcond, label %latchexit, label %header

latchexit:                                          ; preds = %latch
  %sum.0.lcssa = phi i32 [ %add, %latch ]
  ret i32 %sum.0.lcssa

otherexit:
  %rval = call i32(...) @llvm.experimental.deoptimize.i32() [ "deopt"(i32 %sum.02) ]
  ret i32 %rval
}

; the exit block is not a deopt block.
define i32 @test2(i32* nocapture %a, i64 %n) {
;
; CHECK-LABEL: @test2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[HEADER:%.*]]
; CHECK:       header:
; CHECK-NEXT:    [[INDVARS_IV:%.*]] = phi i64 [ [[INDVARS_IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[SUM_02:%.*]] = phi i32 [ [[ADD:%.*]], [[LATCH]] ], [ 0, [[ENTRY]] ]
; CHECK-NEXT:    br label [[FOR_EXITING_BLOCK:%.*]]
; CHECK:       for.exiting_block:
; CHECK-NEXT:    [[CMP:%.*]] = icmp eq i64 [[N:%.*]], 42
; CHECK-NEXT:    br i1 [[CMP]], label [[OTHEREXIT:%.*]], label [[LATCH]]
; CHECK:       latch:
; CHECK-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds i32, i32* [[A:%.*]], i64 [[INDVARS_IV]]
; CHECK-NEXT:    [[TMP0:%.*]] = load i32, i32* [[ARRAYIDX]], align 4
; CHECK-NEXT:    [[ADD]] = add nsw i32 [[TMP0]], [[SUM_02]]
; CHECK-NEXT:    [[INDVARS_IV_NEXT]] = add i64 [[INDVARS_IV]], 1
; CHECK-NEXT:    [[EXITCOND:%.*]] = icmp eq i64 [[INDVARS_IV_NEXT]], [[N]]
; CHECK-NEXT:    br i1 [[EXITCOND]], label [[LATCHEXIT:%.*]], label [[HEADER]]
; CHECK:       latchexit:
; CHECK-NEXT:    ret i32 [[ADD]]
; CHECK:       otherexit:
; CHECK-NEXT:    ret i32 [[SUM_02]]
;
; NOUNROLL-LABEL: @test2(
; NOUNROLL-NEXT:  entry:
; NOUNROLL-NEXT:    br label [[HEADER:%.*]]
; NOUNROLL:       header:
; NOUNROLL-NEXT:    [[INDVARS_IV:%.*]] = phi i64 [ [[INDVARS_IV_NEXT:%.*]], [[LATCH:%.*]] ], [ 0, [[ENTRY:%.*]] ]
; NOUNROLL-NEXT:    [[SUM_02:%.*]] = phi i32 [ [[ADD:%.*]], [[LATCH]] ], [ 0, [[ENTRY]] ]
; NOUNROLL-NEXT:    br label [[FOR_EXITING_BLOCK:%.*]]
; NOUNROLL:       for.exiting_block:
; NOUNROLL-NEXT:    [[CMP:%.*]] = icmp eq i64 [[N:%.*]], 42
; NOUNROLL-NEXT:    br i1 [[CMP]], label [[OTHEREXIT:%.*]], label [[LATCH]]
; NOUNROLL:       latch:
; NOUNROLL-NEXT:    [[ARRAYIDX:%.*]] = getelementptr inbounds i32, i32* [[A:%.*]], i64 [[INDVARS_IV]]
; NOUNROLL-NEXT:    [[TMP0:%.*]] = load i32, i32* [[ARRAYIDX]], align 4
; NOUNROLL-NEXT:    [[ADD]] = add nsw i32 [[TMP0]], [[SUM_02]]
; NOUNROLL-NEXT:    [[INDVARS_IV_NEXT]] = add i64 [[INDVARS_IV]], 1
; NOUNROLL-NEXT:    [[EXITCOND:%.*]] = icmp eq i64 [[INDVARS_IV_NEXT]], [[N]]
; NOUNROLL-NEXT:    br i1 [[EXITCOND]], label [[LATCHEXIT:%.*]], label [[HEADER]]
; NOUNROLL:       latchexit:
; NOUNROLL-NEXT:    [[SUM_0_LCSSA:%.*]] = phi i32 [ [[ADD]], [[LATCH]] ]
; NOUNROLL-NEXT:    ret i32 [[SUM_0_LCSSA]]
; NOUNROLL:       otherexit:
; NOUNROLL-NEXT:    [[RVAL:%.*]] = phi i32 [ [[SUM_02]], [[FOR_EXITING_BLOCK]] ]
; NOUNROLL-NEXT:    ret i32 [[RVAL]]
;
entry:
  br label %header

header:
  %indvars.iv = phi i64 [ %indvars.iv.next, %latch ], [ 0, %entry ]
  %sum.02 = phi i32 [ %add, %latch ], [ 0, %entry ]
  br label %for.exiting_block

for.exiting_block:
  %cmp = icmp eq i64 %n, 42
  br i1 %cmp, label %otherexit, label %latch

latch:
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4
  %add = add nsw i32 %0, %sum.02
  %indvars.iv.next = add i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %n
  br i1 %exitcond, label %latchexit, label %header

latchexit:                                          ; preds = %latch
  %sum.0.lcssa = phi i32 [ %add, %latch ]
  ret i32 %sum.0.lcssa

otherexit:
  %rval = phi i32 [%sum.02, %for.exiting_block ]
  ret i32 %rval
}
declare i32 @llvm.experimental.deoptimize.i32(...)
