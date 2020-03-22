; ModuleID = '5.bc'
source_filename = "5.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"arr\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @minval(i32* %A, i32 %n) #0 !dbg !7 {
entry:
  %A.addr = alloca i32*, align 8
  %n.addr = alloca i32, align 4
  %currmin = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %A, i32** %A.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %A.addr, metadata !12, metadata !DIExpression()), !dbg !13
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %currmin, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %i, align 4, !dbg !20
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %1 = load i32, i32* %n.addr, align 4, !dbg !24
  %cmp = icmp slt i32 %0, %1, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %A.addr, align 8, !dbg !27
  %3 = load i32, i32* %i, align 4, !dbg !29
  %idxprom = sext i32 %3 to i64, !dbg !27
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 %idxprom, !dbg !27
  %4 = load i32, i32* %arrayidx, align 4, !dbg !27
  %5 = load i32, i32* %currmin, align 4, !dbg !30
  %cmp1 = icmp slt i32 %4, %5, !dbg !31
  br i1 %cmp1, label %if.then, label %for.inc, !dbg !32

if.then:                                          ; preds = %for.body
  %6 = load i32*, i32** %A.addr, align 8, !dbg !33
  %7 = load i32, i32* %i, align 4, !dbg !34
  %idxprom2 = sext i32 %7 to i64, !dbg !33
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %idxprom2, !dbg !33
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !33
  store i32 %8, i32* %currmin, align 4, !dbg !35
  br label %for.inc, !dbg !36

for.inc:                                          ; preds = %for.body, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !37
  %inc = add nsw i32 %9, 1, !dbg !37
  store i32 %inc, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond
  %10 = load i32, i32* %currmin, align 4, !dbg !41
  ret i32 %10, !dbg !42
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %arr = alloca [5 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %arr, metadata !46, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [5 x i32], [5 x i32]* %arr, i32 0, i32 0, !dbg !51
  %0 = bitcast i32* %arraydecay to i8*, !dbg !51
  call void @klee_make_symbolic(i8* %0, i64 20, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0)), !dbg !52
  ret i32 0, !dbg !53
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.1 (branches/release_60 355598)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "5.c", directory: "/home/klee/KLEE")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.1 (branches/release_60 355598)"}
!7 = distinct !DISubprogram(name: "minval", scope: !1, file: !1, line: 5, type: !8, isLocal: false, isDefinition: true, scopeLine: 5, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!12 = !DILocalVariable(name: "A", arg: 1, scope: !7, file: !1, line: 5, type: !11)
!13 = !DILocation(line: 5, column: 17, scope: !7)
!14 = !DILocalVariable(name: "n", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!15 = !DILocation(line: 5, column: 24, scope: !7)
!16 = !DILocalVariable(name: "currmin", scope: !7, file: !1, line: 6, type: !10)
!17 = !DILocation(line: 6, column: 9, scope: !7)
!18 = !DILocalVariable(name: "i", scope: !19, file: !1, line: 8, type: !10)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 5)
!20 = !DILocation(line: 8, column: 14, scope: !19)
!21 = !DILocation(line: 8, column: 10, scope: !19)
!22 = !DILocation(line: 8, column: 21, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 5)
!24 = !DILocation(line: 8, column: 25, scope: !23)
!25 = !DILocation(line: 8, column: 23, scope: !23)
!26 = !DILocation(line: 8, column: 5, scope: !19)
!27 = !DILocation(line: 9, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !1, line: 9, column: 13)
!29 = !DILocation(line: 9, column: 15, scope: !28)
!30 = !DILocation(line: 9, column: 20, scope: !28)
!31 = !DILocation(line: 9, column: 18, scope: !28)
!32 = !DILocation(line: 9, column: 13, scope: !23)
!33 = !DILocation(line: 10, column: 23, scope: !28)
!34 = !DILocation(line: 10, column: 25, scope: !28)
!35 = !DILocation(line: 10, column: 21, scope: !28)
!36 = !DILocation(line: 10, column: 13, scope: !28)
!37 = !DILocation(line: 8, column: 29, scope: !23)
!38 = !DILocation(line: 8, column: 5, scope: !23)
!39 = distinct !{!39, !26, !40}
!40 = !DILocation(line: 10, column: 26, scope: !19)
!41 = !DILocation(line: 11, column: 12, scope: !7)
!42 = !DILocation(line: 11, column: 5, scope: !7)
!43 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 14, type: !44, isLocal: false, isDefinition: true, scopeLine: 14, isOptimized: false, unit: !0, variables: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!10}
!46 = !DILocalVariable(name: "arr", scope: !43, file: !1, line: 15, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 160, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 5)
!50 = !DILocation(line: 15, column: 9, scope: !43)
!51 = !DILocation(line: 19, column: 24, scope: !43)
!52 = !DILocation(line: 19, column: 5, scope: !43)
!53 = !DILocation(line: 21, column: 5, scope: !43)
