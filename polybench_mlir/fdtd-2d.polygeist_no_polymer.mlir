#map = affine_map<()[s0] -> (s0 - 1)>
#set = affine_set<(d0, d1)[s0] : ((d0 + d1 * s0) mod 20 == 0)>
module attributes {} {
  llvm.mlir.global internal constant @str9("hz\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str8("ey\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str6("\0Aend   dump: %s\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str5("%0.2lf \00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str4("\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str3("ex\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str2("begin dump: %s\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str1("==BEGIN DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global external @stderr() {addr_space = 0 : i32} : memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr, !llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("\00") {addr_space = 0 : i32}
  func.func @main(%arg0: i32, %arg1: memref<?xmemref<?xi8>>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %c42_i32 = arith.constant 42 : i32
    %c1200_i32 = arith.constant 1200 : i32
    %c1000_i32 = arith.constant 1000 : i32
    %c500_i32 = arith.constant 500 : i32
    %alloc = memref.alloc() : memref<1000x1200xf64>
    %alloc_0 = memref.alloc() : memref<1000x1200xf64>
    %alloc_1 = memref.alloc() : memref<1000x1200xf64>
    %alloc_2 = memref.alloc() : memref<500xf64>
    %cast = memref.cast %alloc : memref<1000x1200xf64> to memref<?x1200xf64>
    %cast_3 = memref.cast %alloc_0 : memref<1000x1200xf64> to memref<?x1200xf64>
    %cast_4 = memref.cast %alloc_1 : memref<1000x1200xf64> to memref<?x1200xf64>
    %cast_5 = memref.cast %alloc_2 : memref<500xf64> to memref<?xf64>
    call @init_array(%c500_i32, %c1000_i32, %c1200_i32, %cast, %cast_3, %cast_4, %cast_5) : (i32, i32, i32, memref<?x1200xf64>, memref<?x1200xf64>, memref<?x1200xf64>, memref<?xf64>) -> ()
    %cast_6 = memref.cast %alloc : memref<1000x1200xf64> to memref<?x1200xf64>
    %cast_7 = memref.cast %alloc_0 : memref<1000x1200xf64> to memref<?x1200xf64>
    %cast_8 = memref.cast %alloc_1 : memref<1000x1200xf64> to memref<?x1200xf64>
    %cast_9 = memref.cast %alloc_2 : memref<500xf64> to memref<?xf64>
    call @kernel_fdtd_2d(%c500_i32, %c1000_i32, %c1200_i32, %cast_6, %cast_7, %cast_8, %cast_9) : (i32, i32, i32, memref<?x1200xf64>, memref<?x1200xf64>, memref<?x1200xf64>, memref<?xf64>) -> ()
    %0 = arith.cmpi sgt, %arg0, %c42_i32 : i32
    scf.if %0 {
      %1 = affine.load %arg1[0] : memref<?xmemref<?xi8>>
      %2 = llvm.mlir.addressof @str0 : !llvm.ptr
      %3 = "polygeist.pointer2memref"(%2) : (!llvm.ptr) -> memref<?xi8>
      %4 = func.call @strcmp(%1, %3) : (memref<?xi8>, memref<?xi8>) -> i32
      %5 = arith.cmpi eq, %4, %c0_i32 : i32
      scf.if %5 {
        %cast_10 = memref.cast %alloc : memref<1000x1200xf64> to memref<?x1200xf64>
        %cast_11 = memref.cast %alloc_0 : memref<1000x1200xf64> to memref<?x1200xf64>
        %cast_12 = memref.cast %alloc_1 : memref<1000x1200xf64> to memref<?x1200xf64>
        func.call @print_array(%c1000_i32, %c1200_i32, %cast_10, %cast_11, %cast_12) : (i32, i32, memref<?x1200xf64>, memref<?x1200xf64>, memref<?x1200xf64>) -> ()
      }
    }
    memref.dealloc %alloc : memref<1000x1200xf64>
    memref.dealloc %alloc_0 : memref<1000x1200xf64>
    memref.dealloc %alloc_1 : memref<1000x1200xf64>
    memref.dealloc %alloc_2 : memref<500xf64>
    return %c0_i32 : i32
  }
  func.func private @init_array(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<?x1200xf64>, %arg4: memref<?x1200xf64>, %arg5: memref<?x1200xf64>, %arg6: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %c3_i32 = arith.constant 3 : i32
    %c2_i32 = arith.constant 2 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = arith.index_cast %arg0 : i32 to index
    affine.for %arg7 = 0 to %0 {
      %5 = arith.index_cast %arg7 : index to i32
      %6 = arith.sitofp %5 : i32 to f64
      affine.store %6, %arg6[%arg7] : memref<?xf64>
    }
    %1 = arith.index_cast %arg1 : i32 to index
    %2 = arith.index_cast %arg2 : i32 to index
    %3 = arith.sitofp %arg1 : i32 to f64
    %4 = arith.sitofp %arg2 : i32 to f64
    affine.for %arg7 = 0 to %1 {
      %5 = arith.index_cast %arg7 : index to i32
      %6 = arith.sitofp %5 : i32 to f64
      affine.for %arg8 = 0 to %2 {
        %7 = arith.index_cast %arg8 : index to i32
        %8 = arith.addi %7, %c1_i32 : i32
        %9 = arith.sitofp %8 : i32 to f64
        %10 = arith.mulf %6, %9 : f64
        %11 = arith.divf %10, %3 : f64
        affine.store %11, %arg3[%arg7, %arg8] : memref<?x1200xf64>
        %12 = arith.addi %7, %c2_i32 : i32
        %13 = arith.sitofp %12 : i32 to f64
        %14 = arith.mulf %6, %13 : f64
        %15 = arith.divf %14, %4 : f64
        affine.store %15, %arg4[%arg7, %arg8] : memref<?x1200xf64>
        %16 = arith.addi %7, %c3_i32 : i32
        %17 = arith.sitofp %16 : i32 to f64
        %18 = arith.mulf %6, %17 : f64
        %19 = arith.divf %18, %3 : f64
        affine.store %19, %arg5[%arg7, %arg8] : memref<?x1200xf64>
      }
    }
    return
  }
  func.func private @kernel_fdtd_2d(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: memref<?x1200xf64>, %arg4: memref<?x1200xf64>, %arg5: memref<?x1200xf64>, %arg6: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %cst = arith.constant 5.000000e-01 : f64
    %cst_0 = arith.constant 0.69999999999999996 : f64
    %0 = arith.index_cast %arg1 : i32 to index
    %1 = arith.index_cast %arg2 : i32 to index
    %2 = arith.index_cast %arg0 : i32 to index
    affine.for %arg7 = 0 to %2 {
      affine.for %arg8 = 0 to %1 {
        %3 = affine.load %arg6[%arg7] : memref<?xf64>
        affine.store %3, %arg4[0, %arg8] : memref<?x1200xf64>
      }
      affine.for %arg8 = 1 to %0 {
        affine.for %arg9 = 0 to %1 {
          %3 = affine.load %arg4[%arg8, %arg9] : memref<?x1200xf64>
          %4 = affine.load %arg5[%arg8, %arg9] : memref<?x1200xf64>
          %5 = affine.load %arg5[%arg8 - 1, %arg9] : memref<?x1200xf64>
          %6 = arith.subf %4, %5 : f64
          %7 = arith.mulf %6, %cst : f64
          %8 = arith.subf %3, %7 : f64
          affine.store %8, %arg4[%arg8, %arg9] : memref<?x1200xf64>
        }
      }
      affine.for %arg8 = 0 to %0 {
        affine.for %arg9 = 1 to %1 {
          %3 = affine.load %arg3[%arg8, %arg9] : memref<?x1200xf64>
          %4 = affine.load %arg5[%arg8, %arg9] : memref<?x1200xf64>
          %5 = affine.load %arg5[%arg8, %arg9 - 1] : memref<?x1200xf64>
          %6 = arith.subf %4, %5 : f64
          %7 = arith.mulf %6, %cst : f64
          %8 = arith.subf %3, %7 : f64
          affine.store %8, %arg3[%arg8, %arg9] : memref<?x1200xf64>
        }
      }
      affine.for %arg8 = 0 to #map()[%0] {
        affine.for %arg9 = 0 to #map()[%1] {
          %3 = affine.load %arg5[%arg8, %arg9] : memref<?x1200xf64>
          %4 = affine.load %arg3[%arg8, %arg9 + 1] : memref<?x1200xf64>
          %5 = affine.load %arg3[%arg8, %arg9] : memref<?x1200xf64>
          %6 = arith.subf %4, %5 : f64
          %7 = affine.load %arg4[%arg8 + 1, %arg9] : memref<?x1200xf64>
          %8 = arith.addf %6, %7 : f64
          %9 = affine.load %arg4[%arg8, %arg9] : memref<?x1200xf64>
          %10 = arith.subf %8, %9 : f64
          %11 = arith.mulf %10, %cst_0 : f64
          %12 = arith.subf %3, %11 : f64
          affine.store %12, %arg5[%arg8, %arg9] : memref<?x1200xf64>
        }
      }
    }
    return
  }
  func.func private @strcmp(memref<?xi8>, memref<?xi8>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>}
  func.func private @print_array(%arg0: i32, %arg1: i32, %arg2: memref<?x1200xf64>, %arg3: memref<?x1200xf64>, %arg4: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %arg0 : i32 to index
    %2 = arith.index_cast %arg0 : i32 to index
    %3 = llvm.mlir.addressof @stderr : !llvm.ptr
    %4 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %5 = "polygeist.memref2pointer"(%4) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %6 = llvm.mlir.addressof @str1 : !llvm.ptr
    %7 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<23 x i8>
    %8 = llvm.call @fprintf(%5, %7) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
    %9 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %10 = "polygeist.memref2pointer"(%9) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %11 = llvm.mlir.addressof @str2 : !llvm.ptr
    %12 = llvm.getelementptr %11[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<15 x i8>
    %13 = llvm.mlir.addressof @str3 : !llvm.ptr
    %14 = llvm.getelementptr %13[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x i8>
    %15 = llvm.call @fprintf(%10, %12, %14) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %16 = arith.index_cast %arg0 : i32 to index
    %17 = arith.index_cast %arg1 : i32 to index
    %18 = llvm.mlir.addressof @str5 : !llvm.ptr
    %19 = llvm.getelementptr %18[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i8>
    %20 = llvm.mlir.addressof @str4 : !llvm.ptr
    %21 = llvm.getelementptr %20[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    affine.for %arg5 = 0 to %16 {
      affine.for %arg6 = 0 to %17 {
        affine.if #set(%arg6, %arg5)[%0] {
          %72 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
          %73 = "polygeist.memref2pointer"(%72) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
          %74 = llvm.call @fprintf(%73, %21) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
        }
        %68 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
        %69 = "polygeist.memref2pointer"(%68) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
        %70 = affine.load %arg2[%arg5, %arg6] : memref<?x1200xf64>
        %71 = llvm.call @fprintf(%69, %19, %70) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, f64) -> i32
      }
    }
    %22 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %23 = "polygeist.memref2pointer"(%22) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %24 = llvm.mlir.addressof @str6 : !llvm.ptr
    %25 = llvm.getelementptr %24[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<17 x i8>
    %26 = llvm.call @fprintf(%23, %25, %14) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %27 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %28 = "polygeist.memref2pointer"(%27) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %29 = llvm.mlir.addressof @str7 : !llvm.ptr
    %30 = llvm.getelementptr %29[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<23 x i8>
    %31 = llvm.call @fprintf(%28, %30) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
    %32 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %33 = "polygeist.memref2pointer"(%32) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %34 = llvm.mlir.addressof @str8 : !llvm.ptr
    %35 = llvm.getelementptr %34[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x i8>
    %36 = llvm.call @fprintf(%33, %12, %35) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %37 = arith.index_cast %arg0 : i32 to index
    %38 = arith.index_cast %arg1 : i32 to index
    %39 = llvm.mlir.addressof @str5 : !llvm.ptr
    %40 = llvm.getelementptr %39[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i8>
    %41 = llvm.mlir.addressof @str4 : !llvm.ptr
    %42 = llvm.getelementptr %41[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    affine.for %arg5 = 0 to %37 {
      affine.for %arg6 = 0 to %38 {
        affine.if #set(%arg6, %arg5)[%1] {
          %72 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
          %73 = "polygeist.memref2pointer"(%72) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
          %74 = llvm.call @fprintf(%73, %42) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
        }
        %68 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
        %69 = "polygeist.memref2pointer"(%68) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
        %70 = affine.load %arg3[%arg5, %arg6] : memref<?x1200xf64>
        %71 = llvm.call @fprintf(%69, %40, %70) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, f64) -> i32
      }
    }
    %43 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %44 = "polygeist.memref2pointer"(%43) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %45 = llvm.mlir.addressof @str6 : !llvm.ptr
    %46 = llvm.getelementptr %45[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<17 x i8>
    %47 = llvm.mlir.addressof @str8 : !llvm.ptr
    %48 = llvm.getelementptr %47[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x i8>
    %49 = llvm.call @fprintf(%44, %46, %48) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %50 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %51 = "polygeist.memref2pointer"(%50) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %52 = llvm.mlir.addressof @str9 : !llvm.ptr
    %53 = llvm.getelementptr %52[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x i8>
    %54 = llvm.call @fprintf(%51, %12, %53) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %55 = arith.index_cast %arg0 : i32 to index
    %56 = arith.index_cast %arg1 : i32 to index
    %57 = llvm.mlir.addressof @str5 : !llvm.ptr
    %58 = llvm.getelementptr %57[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i8>
    %59 = llvm.mlir.addressof @str4 : !llvm.ptr
    %60 = llvm.getelementptr %59[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    affine.for %arg5 = 0 to %55 {
      affine.for %arg6 = 0 to %56 {
        affine.if #set(%arg6, %arg5)[%2] {
          %72 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
          %73 = "polygeist.memref2pointer"(%72) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
          %74 = llvm.call @fprintf(%73, %60) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
        }
        %68 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
        %69 = "polygeist.memref2pointer"(%68) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
        %70 = affine.load %arg4[%arg5, %arg6] : memref<?x1200xf64>
        %71 = llvm.call @fprintf(%69, %58, %70) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, f64) -> i32
      }
    }
    %61 = llvm.load %3 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %62 = "polygeist.memref2pointer"(%61) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %63 = llvm.mlir.addressof @str6 : !llvm.ptr
    %64 = llvm.getelementptr %63[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<17 x i8>
    %65 = llvm.mlir.addressof @str9 : !llvm.ptr
    %66 = llvm.getelementptr %65[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<3 x i8>
    %67 = llvm.call @fprintf(%62, %64, %66) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    return
  }
}
