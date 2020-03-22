; ModuleID = 'get_sign.bc'
source_filename = "get_sign.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @get_sign(i32 %x) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !11, metadata !DIExpression()), !dbg !12
  %0 = load i32, i32* %x.addr, align 4, !dbg !13
  %cmp = icmp slt i32 %0, 0, !dbg !15
  br i1 %cmp, label %if.then, label %if.else, !dbg !16

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !17
  br label %return, !dbg !17

if.else:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !18
  br label %return, !dbg !18

return:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %retval, align 4, !dbg !19
  ret i32 %1, !dbg !19
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define i32 @main() #0 !dbg !20 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = bitcast i32* %a to i8*, !dbg !25
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0)), !dbg !26
  %1 = load i32, i32* %a, align 4, !dbg !27
  %call = call i32 @get_sign(i32 %1), !dbg !28
  ret i32 %call, !dbg !29
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.1 (branches/release_60 355598)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "get_sign.c", directory: "/home/klee/KLEE")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.1 (branches/release_60 355598)"}
!7 = distinct !DISubprogram(name: "get_sign", scope: !1, file: !1, line: 8, type: !8, isLocal: false, isDefinition: true, scopeLine: 8, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", arg: 1, scope: !7, file: !1, line: 8, type: !10)
!12 = !DILocation(line: 8, column: 18, scope: !7)
!13 = !DILocation(line: 10, column: 9, scope: !14)
!14 = distinct !DILexicalBlock(scope: !7, file: !1, line: 10, column: 9)
!15 = !DILocation(line: 10, column: 11, scope: !14)
!16 = !DILocation(line: 10, column: 9, scope: !7)
!17 = !DILocation(line: 11, column: 9, scope: !14)
!18 = !DILocation(line: 13, column: 9, scope: !14)
!19 = !DILocation(line: 16, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 18, type: !21, isLocal: false, isDefinition: true, scopeLine: 18, isOptimized: false, unit: !0, variables: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{!10}
!23 = !DILocalVariable(name: "a", scope: !20, file: !1, line: 19, type: !10)
!24 = !DILocation(line: 19, column: 9, scope: !20)
!25 = !DILocation(line: 20, column: 24, scope: !20)
!26 = !DILocation(line: 20, column: 5, scope: !20)
!27 = !DILocation(line: 21, column: 21, scope: !20)
!28 = !DILocation(line: 21, column: 12, scope: !20)
!29 = !DILocation(line: 21, column: 5, scope: !20)
