#set = affine_set<(d0) : (d0 mod 20 == 0)>
module attributes {} {
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str6("\0Aend   dump: %s\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str5("%0.2lf \00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str4("\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str3("y\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str2("begin dump: %s\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str1("==BEGIN DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global external @stderr() {addr_space = 0 : i32} : memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr, !llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("\00") {addr_space = 0 : i32}
  func.func @main(%arg0: i32, %arg1: memref<?xmemref<?xi8>>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %c42_i32 = arith.constant 42 : i32
    %c1300_i32 = arith.constant 1300 : i32
    %alloca = memref.alloca() : memref<1xf64>
    %0 = llvm.mlir.undef : f64
    affine.store %0, %alloca[0] : memref<1xf64>
    %alloca_0 = memref.alloca() : memref<1xf64>
    affine.store %0, %alloca_0[0] : memref<1xf64>
    %alloc = memref.alloc() : memref<1300x1300xf64>
    %alloc_1 = memref.alloc() : memref<1300x1300xf64>
    %alloc_2 = memref.alloc() : memref<1300xf64>
    %alloc_3 = memref.alloc() : memref<1300xf64>
    %alloc_4 = memref.alloc() : memref<1300xf64>
    %cast = memref.cast %alloca_0 : memref<1xf64> to memref<?xf64>
    %cast_5 = memref.cast %alloca : memref<1xf64> to memref<?xf64>
    %cast_6 = memref.cast %alloc : memref<1300x1300xf64> to memref<?x1300xf64>
    %cast_7 = memref.cast %alloc_1 : memref<1300x1300xf64> to memref<?x1300xf64>
    %cast_8 = memref.cast %alloc_3 : memref<1300xf64> to memref<?xf64>
    call @init_array(%c1300_i32, %cast, %cast_5, %cast_6, %cast_7, %cast_8) : (i32, memref<?xf64>, memref<?xf64>, memref<?x1300xf64>, memref<?x1300xf64>, memref<?xf64>) -> ()
    %1 = affine.load %alloca_0[0] : memref<1xf64>
    %2 = affine.load %alloca[0] : memref<1xf64>
    %cast_9 = memref.cast %alloc : memref<1300x1300xf64> to memref<?x1300xf64>
    %cast_10 = memref.cast %alloc_1 : memref<1300x1300xf64> to memref<?x1300xf64>
    %cast_11 = memref.cast %alloc_2 : memref<1300xf64> to memref<?xf64>
    %cast_12 = memref.cast %alloc_3 : memref<1300xf64> to memref<?xf64>
    %cast_13 = memref.cast %alloc_4 : memref<1300xf64> to memref<?xf64>
    call @kernel_gesummv(%c1300_i32, %1, %2, %cast_9, %cast_10, %cast_11, %cast_12, %cast_13) : (i32, f64, f64, memref<?x1300xf64>, memref<?x1300xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>) -> ()
    %3 = arith.cmpi sgt, %arg0, %c42_i32 : i32
    scf.if %3 {
      %4 = affine.load %arg1[0] : memref<?xmemref<?xi8>>
      %5 = llvm.mlir.addressof @str0 : !llvm.ptr
      %6 = "polygeist.pointer2memref"(%5) : (!llvm.ptr) -> memref<?xi8>
      %7 = func.call @strcmp(%4, %6) : (memref<?xi8>, memref<?xi8>) -> i32
      %8 = arith.cmpi eq, %7, %c0_i32 : i32
      scf.if %8 {
        %cast_14 = memref.cast %alloc_4 : memref<1300xf64> to memref<?xf64>
        func.call @print_array(%c1300_i32, %cast_14) : (i32, memref<?xf64>) -> ()
      }
    }
    memref.dealloc %alloc : memref<1300x1300xf64>
    memref.dealloc %alloc_1 : memref<1300x1300xf64>
    memref.dealloc %alloc_2 : memref<1300xf64>
    memref.dealloc %alloc_3 : memref<1300xf64>
    memref.dealloc %alloc_4 : memref<1300xf64>
    return %c0_i32 : i32
  }
  func.func private @init_array(%arg0: i32, %arg1: memref<?xf64>, %arg2: memref<?xf64>, %arg3: memref<?x1300xf64>, %arg4: memref<?x1300xf64>, %arg5: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %cst = arith.constant 1.200000e+00 : f64
    %cst_0 = arith.constant 1.500000e+00 : f64
    affine.store %cst_0, %arg1[0] : memref<?xf64>
    affine.store %cst, %arg2[0] : memref<?xf64>
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.sitofp %arg0 : i32 to f64
    %2 = arith.index_cast %arg0 : i32 to index
    affine.for %arg6 = 0 to %0 {
      %3 = arith.index_cast %arg6 : index to i32
      %4 = arith.remsi %3, %arg0 : i32
      %5 = arith.sitofp %4 : i32 to f64
      %6 = arith.divf %5, %1 : f64
      affine.store %6, %arg5[%arg6] : memref<?xf64>
      affine.for %arg7 = 0 to %2 {
        %7 = arith.index_cast %arg7 : index to i32
        %8 = arith.muli %3, %7 : i32
        %9 = arith.addi %8, %c1_i32 : i32
        %10 = arith.remsi %9, %arg0 : i32
        %11 = arith.sitofp %10 : i32 to f64
        %12 = arith.divf %11, %1 : f64
        affine.store %12, %arg3[%arg6, %arg7] : memref<?x1300xf64>
        %13 = arith.addi %8, %c2_i32 : i32
        %14 = arith.remsi %13, %arg0 : i32
        %15 = arith.sitofp %14 : i32 to f64
        %16 = arith.divf %15, %1 : f64
        affine.store %16, %arg4[%arg6, %arg7] : memref<?x1300xf64>
      }
    }
    return
  }
  func.func private @kernel_gesummv(%arg0: i32, %arg1: f64, %arg2: f64, %arg3: memref<?x1300xf64>, %arg4: memref<?x1300xf64>, %arg5: memref<?xf64>, %arg6: memref<?xf64>, %arg7: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = arith.index_cast %arg0 : i32 to index
    affine.for %arg8 = 0 to %0 {
      affine.store %cst, %arg5[%arg8] : memref<?xf64>
      affine.store %cst, %arg7[%arg8] : memref<?xf64>
      affine.for %arg9 = 0 to %0 {
        %6 = affine.load %arg3[%arg8, %arg9] : memref<?x1300xf64>
        %7 = affine.load %arg6[%arg9] : memref<?xf64>
        %8 = arith.mulf %6, %7 : f64
        %9 = affine.load %arg5[%arg8] : memref<?xf64>
        %10 = arith.addf %8, %9 : f64
        affine.store %10, %arg5[%arg8] : memref<?xf64>
        %11 = affine.load %arg4[%arg8, %arg9] : memref<?x1300xf64>
        %12 = affine.load %arg6[%arg9] : memref<?xf64>
        %13 = arith.mulf %11, %12 : f64
        %14 = affine.load %arg7[%arg8] : memref<?xf64>
        %15 = arith.addf %13, %14 : f64
        affine.store %15, %arg7[%arg8] : memref<?xf64>
      }
      %1 = affine.load %arg5[%arg8] : memref<?xf64>
      %2 = arith.mulf %arg1, %1 : f64
      %3 = affine.load %arg7[%arg8] : memref<?xf64>
      %4 = arith.mulf %arg2, %3 : f64
      %5 = arith.addf %2, %4 : f64
      affine.store %5, %arg7[%arg8] : memref<?xf64>
    }
    return
  }
  func.func private @strcmp(memref<?xi8>, memref<?xi8>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>}
  func.func private @print_array(%arg0: i32, %arg1: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %0 = llvm.mlir.addressof @stderr : !llvm.ptr
    %1 = llvm.load %0 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %2 = "polygeist.memref2pointer"(%1) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %3 = llvm.mlir.addressof @str1 : !llvm.ptr
    %4 = llvm.getelementptr %3[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<23 x i8>
    %5 = llvm.call @fprintf(%2, %4) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
    %6 = llvm.load %0 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %7 = "polygeist.memref2pointer"(%6) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %8 = llvm.mlir.addressof @str2 : !llvm.ptr
    %9 = llvm.getelementptr %8[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<15 x i8>
    %10 = llvm.mlir.addressof @str3 : !llvm.ptr
    %11 = llvm.getelementptr %10[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    %12 = llvm.call @fprintf(%7, %9, %11) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %13 = arith.index_cast %arg0 : i32 to index
    %14 = llvm.mlir.addressof @str5 : !llvm.ptr
    %15 = llvm.getelementptr %14[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i8>
    %16 = llvm.mlir.addressof @str4 : !llvm.ptr
    %17 = llvm.getelementptr %16[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    affine.for %arg2 = 0 to %13 {
      affine.if #set(%arg2) {
        %32 = llvm.load %0 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
        %33 = "polygeist.memref2pointer"(%32) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
        %34 = llvm.call @fprintf(%33, %17) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
      }
      %28 = llvm.load %0 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
      %29 = "polygeist.memref2pointer"(%28) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
      %30 = affine.load %arg1[%arg2] : memref<?xf64>
      %31 = llvm.call @fprintf(%29, %15, %30) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, f64) -> i32
    }
    %18 = llvm.load %0 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %19 = "polygeist.memref2pointer"(%18) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %20 = llvm.mlir.addressof @str6 : !llvm.ptr
    %21 = llvm.getelementptr %20[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<17 x i8>
    %22 = llvm.call @fprintf(%19, %21, %11) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %23 = llvm.load %0 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %24 = "polygeist.memref2pointer"(%23) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %25 = llvm.mlir.addressof @str7 : !llvm.ptr
    %26 = llvm.getelementptr %25[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<23 x i8>
    %27 = llvm.call @fprintf(%24, %26) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
    return
  }
}
