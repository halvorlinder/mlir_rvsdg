#map = affine_map<()[s0] -> (s0 - 1)>
#set = affine_set<(d0, d1)[s0] : ((d0 + d1 * s0) mod 20 == 0)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>, #dlti.dl_entry<"dlti.endianness", "little">>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str6("\0Aend   dump: %s\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str5("%0.2lf \00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str4("\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str3("A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str2("begin dump: %s\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str1("==BEGIN DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global external @stderr() {addr_space = 0 : i32} : memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr, !llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("\00") {addr_space = 0 : i32}
  func.func @main(%arg0: i32, %arg1: memref<?xmemref<?xi8>>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %c42_i32 = arith.constant 42 : i32
    %c500_i32 = arith.constant 500 : i32
    %c1300_i32 = arith.constant 1300 : i32
    %alloc = memref.alloc() : memref<1300x1300xf64>
    %alloc_0 = memref.alloc() : memref<1300x1300xf64>
    %cast = memref.cast %alloc : memref<1300x1300xf64> to memref<?x1300xf64>
    %cast_1 = memref.cast %alloc_0 : memref<1300x1300xf64> to memref<?x1300xf64>
    call @init_array(%c1300_i32, %cast, %cast_1) : (i32, memref<?x1300xf64>, memref<?x1300xf64>) -> ()
    %cast_2 = memref.cast %alloc : memref<1300x1300xf64> to memref<?x1300xf64>
    %cast_3 = memref.cast %alloc_0 : memref<1300x1300xf64> to memref<?x1300xf64>
    call @kernel_jacobi_2d(%c500_i32, %c1300_i32, %cast_2, %cast_3) : (i32, i32, memref<?x1300xf64>, memref<?x1300xf64>) -> ()
    %0 = arith.cmpi sgt, %arg0, %c42_i32 : i32
    scf.if %0 {
      %1 = affine.load %arg1[0] : memref<?xmemref<?xi8>>
      %2 = llvm.mlir.addressof @str0 : !llvm.ptr
      %3 = "polygeist.pointer2memref"(%2) : (!llvm.ptr) -> memref<?xi8>
      %4 = func.call @strcmp(%1, %3) : (memref<?xi8>, memref<?xi8>) -> i32
      %5 = arith.cmpi eq, %4, %c0_i32 : i32
      scf.if %5 {
        %cast_4 = memref.cast %alloc : memref<1300x1300xf64> to memref<?x1300xf64>
        func.call @print_array(%c1300_i32, %cast_4) : (i32, memref<?x1300xf64>) -> ()
      }
    }
    memref.dealloc %alloc : memref<1300x1300xf64>
    memref.dealloc %alloc_0 : memref<1300x1300xf64>
    return %c0_i32 : i32
  }
  func.func private @init_array(%arg0: i32, %arg1: memref<?x1300xf64>, %arg2: memref<?x1300xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %cst = arith.constant 3.000000e+00 : f64
    %c3_i32 = arith.constant 3 : i32
    %cst_0 = arith.constant 2.000000e+00 : f64
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.index_cast %arg0 : i32 to index
    %1 = arith.index_cast %arg0 : i32 to index
    %2 = arith.sitofp %arg0 : i32 to f64
    affine.for %arg3 = 0 to %0 {
      %3 = arith.index_cast %arg3 : index to i32
      %4 = arith.sitofp %3 : i32 to f64
      affine.for %arg4 = 0 to %1 {
        %5 = arith.index_cast %arg4 : index to i32
        %6 = arith.addi %5, %c2_i32 : i32
        %7 = arith.sitofp %6 : i32 to f64
        %8 = arith.mulf %4, %7 : f64
        %9 = arith.addf %8, %cst_0 : f64
        %10 = arith.divf %9, %2 : f64
        affine.store %10, %arg1[%arg3, %arg4] : memref<?x1300xf64>
        %11 = arith.addi %5, %c3_i32 : i32
        %12 = arith.sitofp %11 : i32 to f64
        %13 = arith.mulf %4, %12 : f64
        %14 = arith.addf %13, %cst : f64
        %15 = arith.divf %14, %2 : f64
        affine.store %15, %arg2[%arg3, %arg4] : memref<?x1300xf64>
      }
    }
    return
  }
  func.func private @kernel_jacobi_2d(%arg0: i32, %arg1: i32, %arg2: memref<?x1300xf64>, %arg3: memref<?x1300xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %cst = arith.constant 2.000000e-01 : f64
    %0 = arith.index_cast %arg1 : i32 to index
    %1 = arith.index_cast %arg1 : i32 to index
    %2 = arith.index_cast %arg1 : i32 to index
    %3 = arith.index_cast %arg1 : i32 to index
    %4 = arith.index_cast %arg0 : i32 to index
    affine.for %arg4 = 0 to %4 {
      affine.for %arg5 = 1 to #map()[%0] {
        affine.for %arg6 = 1 to #map()[%1] {
          %5 = affine.load %arg2[%arg5, %arg6] : memref<?x1300xf64>
          %6 = affine.load %arg2[%arg5, %arg6 - 1] : memref<?x1300xf64>
          %7 = arith.addf %5, %6 : f64
          %8 = affine.load %arg2[%arg5, %arg6 + 1] : memref<?x1300xf64>
          %9 = arith.addf %7, %8 : f64
          %10 = affine.load %arg2[%arg5 + 1, %arg6] : memref<?x1300xf64>
          %11 = arith.addf %9, %10 : f64
          %12 = affine.load %arg2[%arg5 - 1, %arg6] : memref<?x1300xf64>
          %13 = arith.addf %11, %12 : f64
          %14 = arith.mulf %13, %cst : f64
          affine.store %14, %arg3[%arg5, %arg6] : memref<?x1300xf64>
        }
      }
      affine.for %arg5 = 1 to #map()[%2] {
        affine.for %arg6 = 1 to #map()[%3] {
          %5 = affine.load %arg3[%arg5, %arg6] : memref<?x1300xf64>
          %6 = affine.load %arg3[%arg5, %arg6 - 1] : memref<?x1300xf64>
          %7 = arith.addf %5, %6 : f64
          %8 = affine.load %arg3[%arg5, %arg6 + 1] : memref<?x1300xf64>
          %9 = arith.addf %7, %8 : f64
          %10 = affine.load %arg3[%arg5 + 1, %arg6] : memref<?x1300xf64>
          %11 = arith.addf %9, %10 : f64
          %12 = affine.load %arg3[%arg5 - 1, %arg6] : memref<?x1300xf64>
          %13 = arith.addf %11, %12 : f64
          %14 = arith.mulf %13, %cst : f64
          affine.store %14, %arg2[%arg5, %arg6] : memref<?x1300xf64>
        }
      }
    }
    return
  }
  func.func private @strcmp(memref<?xi8>, memref<?xi8>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>}
  func.func private @print_array(%arg0: i32, %arg1: memref<?x1300xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
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
    %15 = arith.index_cast %arg0 : i32 to index
    %16 = llvm.mlir.addressof @str5 : !llvm.ptr
    %17 = llvm.getelementptr %16[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<8 x i8>
    %18 = llvm.mlir.addressof @str4 : !llvm.ptr
    %19 = llvm.getelementptr %18[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.array<2 x i8>
    affine.for %arg2 = 0 to %14 {
      affine.for %arg3 = 0 to %15 {
        affine.if #set(%arg3, %arg2)[%0] {
          %34 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
          %35 = "polygeist.memref2pointer"(%34) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
          %36 = llvm.call @fprintf(%35, %19) vararg(!llvm.func<i32 (ptr, ptr, ...)>) : (!llvm.ptr, !llvm.ptr) -> i32
        }
        %30 = llvm.load %1 : !llvm.ptr -> memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
        %31 = "polygeist.memref2pointer"(%30) : (memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>) -> !llvm.ptr
        %32 = affine.load %arg1[%arg2, %arg3] : memref<?x1300xf64>
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
