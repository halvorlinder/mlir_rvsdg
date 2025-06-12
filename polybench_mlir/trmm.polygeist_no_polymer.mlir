#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#set = affine_set<(d0, d1)[s0] : ((d0 + d1 * s0) mod 20 == 0)>
module attributes {} {
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str6("\0Aend   dump: %s\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str5("%0.2lf \00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str4("\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str3("B\00") {addr_space = 0 : i32}
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
    %alloca = memref.alloca() : memref<1xf64>
    %0 = llvm.mlir.undef : f64
    affine.store %0, %alloca[0] : memref<1xf64>
    %alloc = memref.alloc() : memref<1000x1000xf64>
    %alloc_0 = memref.alloc() : memref<1000x1200xf64>
    %cast = memref.cast %alloca : memref<1xf64> to memref<?xf64>
    %cast_1 = memref.cast %alloc : memref<1000x1000xf64> to memref<?x1000xf64>
    %cast_2 = memref.cast %alloc_0 : memref<1000x1200xf64> to memref<?x1200xf64>
    call @init_array(%c1000_i32, %c1200_i32, %cast, %cast_1, %cast_2) : (i32, i32, memref<?xf64>, memref<?x1000xf64>, memref<?x1200xf64>) -> ()
    %1 = affine.load %alloca[0] : memref<1xf64>
    %cast_3 = memref.cast %alloc : memref<1000x1000xf64> to memref<?x1000xf64>
    %cast_4 = memref.cast %alloc_0 : memref<1000x1200xf64> to memref<?x1200xf64>
    call @kernel_trmm(%c1000_i32, %c1200_i32, %1, %cast_3, %cast_4) : (i32, i32, f64, memref<?x1000xf64>, memref<?x1200xf64>) -> ()
    %2 = arith.cmpi sgt, %arg0, %c42_i32 : i32
    scf.if %2 {
      %3 = affine.load %arg1[0] : memref<?xmemref<?xi8>>
      %4 = llvm.mlir.addressof @str0 : !llvm.ptr
      %5 = "polygeist.pointer2memref"(%4) : (!llvm.ptr) -> memref<?xi8>
      %6 = func.call @strcmp(%3, %5) : (memref<?xi8>, memref<?xi8>) -> i32
      %7 = arith.cmpi eq, %6, %c0_i32 : i32
      scf.if %7 {
        %cast_5 = memref.cast %alloc_0 : memref<1000x1200xf64> to memref<?x1200xf64>
        func.call @print_array(%c1000_i32, %c1200_i32, %cast_5) : (i32, i32, memref<?x1200xf64>) -> ()
      }
    }
    memref.dealloc %alloc : memref<1000x1000xf64>
    memref.dealloc %alloc_0 : memref<1000x1200xf64>
    return %c0_i32 : i32
  }
  func.func private @init_array(%arg0: i32, %arg1: i32, %arg2: memref<?xf64>, %arg3: memref<?x1000xf64>, %arg4: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %cst = arith.constant 1.000000e+00 : f64
    %cst_0 = arith.constant 1.500000e+00 : f64
    affine.store %cst_0, %arg2[0] : memref<?xf64>
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.sitofp %arg0 : i32 to f64
    %2 = arith.index_cast %arg1 : i32 to index
    %3 = arith.sitofp %arg1 : i32 to f64
    affine.for %arg5 = 0 to %0 {
      %4 = arith.index_cast %arg5 : index to i32
      affine.for %arg6 = 0 to #map(%arg5) {
        %5 = arith.index_cast %arg6 : index to i32
        %6 = arith.addi %4, %5 : i32
        %7 = arith.remsi %6, %arg0 : i32
        %8 = arith.sitofp %7 : i32 to f64
        %9 = arith.divf %8, %1 : f64
        affine.store %9, %arg3[%arg5, %arg6] : memref<?x1000xf64>
      }
      affine.store %cst, %arg3[%arg5, %arg5] : memref<?x1000xf64>
      affine.for %arg6 = 0 to %2 {
        %5 = arith.index_cast %arg6 : index to i32
        %6 = arith.subi %4, %5 : i32
        %7 = arith.addi %arg1, %6 : i32
        %8 = arith.remsi %7, %arg1 : i32
        %9 = arith.sitofp %8 : i32 to f64
        %10 = arith.divf %9, %3 : f64
        affine.store %10, %arg4[%arg5, %arg6] : memref<?x1200xf64>
      }
    }
    return
  }
  func.func private @kernel_trmm(%arg0: i32, %arg1: i32, %arg2: f64, %arg3: memref<?x1000xf64>, %arg4: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %0 = arith.index_cast %arg1 : i32 to index
    %1 = arith.index_cast %arg0 : i32 to index
    affine.for %arg5 = 0 to %1 {
      affine.for %arg6 = 0 to %0 {
        affine.for %arg7 = #map1(%arg5) to %1 {
          %4 = affine.load %arg3[%arg7, %arg5] : memref<?x1000xf64>
          %5 = affine.load %arg4[%arg7, %arg6] : memref<?x1200xf64>
          %6 = arith.mulf %4, %5 : f64
          %7 = affine.load %arg4[%arg5, %arg6] : memref<?x1200xf64>
          %8 = arith.addf %7, %6 : f64
          affine.store %8, %arg4[%arg5, %arg6] : memref<?x1200xf64>
        }
        %2 = affine.load %arg4[%arg5, %arg6] : memref<?x1200xf64>
        %3 = arith.mulf %arg2, %2 : f64
        affine.store %3, %arg4[%arg5, %arg6] : memref<?x1200xf64>
      }
    }
    return
  }
  func.func private @strcmp(memref<?xi8>, memref<?xi8>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>}
  func.func private @print_array(%arg0: i32, %arg1: i32, %arg2: memref<?x1200xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = llvm.mlir.addressof @stderr : !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %3 = "polygeist.memref2pointer"(%2) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %4 = llvm.mlir.addressof @str1 : !llvm.ptr
    %5 = llvm.getelementptr %4[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<23 x i8>
    %6 = llvm.call @fprintf(%3, %5) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
    %7 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %8 = "polygeist.memref2pointer"(%7) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %9 = llvm.mlir.addressof @str2 : !llvm.ptr
    %10 = llvm.getelementptr %9[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<15 x i8>
    %11 = llvm.mlir.addressof @str3 : !llvm.ptr
    %12 = llvm.getelementptr %11[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    %13 = llvm.call @fprintf(%8, %10, %12) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %14 = arith.index_cast %arg0 : i32 to index
    %15 = arith.index_cast %arg1 : i32 to index
    %16 = llvm.mlir.addressof @str5 : !llvm.ptr
    %17 = llvm.getelementptr %16[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i8>
    %18 = llvm.mlir.addressof @str4 : !llvm.ptr
    %19 = llvm.getelementptr %18[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    affine.for %arg3 = 0 to %14 {
      affine.for %arg4 = 0 to %15 {
        affine.if #set(%arg4, %arg3)[%0] {
          %34 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
          %35 = "polygeist.memref2pointer"(%34) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
          %36 = llvm.call @fprintf(%35, %19) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
        }
        %30 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
        %31 = "polygeist.memref2pointer"(%30) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
        %32 = affine.load %arg2[%arg3, %arg4] : memref<?x1200xf64>
        %33 = llvm.call @fprintf(%31, %17, %32) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, f64) -> i32
      }
    }
    %20 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %21 = "polygeist.memref2pointer"(%20) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %22 = llvm.mlir.addressof @str6 : !llvm.ptr
    %23 = llvm.getelementptr %22[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<17 x i8>
    %24 = llvm.call @fprintf(%21, %23, %12) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> i32
    %25 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
    %26 = "polygeist.memref2pointer"(%25) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
    %27 = llvm.mlir.addressof @str7 : !llvm.ptr
    %28 = llvm.getelementptr %27[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<23 x i8>
    %29 = llvm.call @fprintf(%26, %28) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
    return
  }
}
