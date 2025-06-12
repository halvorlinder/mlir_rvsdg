#set = affine_set<(d0) : (d0 mod 20 == 0)>
module attributes {dlti.dl_spec = #dlti.dl_spec<#dlti.dl_entry<i32, dense<32> : vector<2xi32>>, #dlti.dl_entry<f16, dense<16> : vector<2xi32>>, #dlti.dl_entry<f64, dense<64> : vector<2xi32>>, #dlti.dl_entry<f128, dense<128> : vector<2xi32>>, #dlti.dl_entry<i8, dense<[8, 32]> : vector<2xi32>>, #dlti.dl_entry<i16, dense<[16, 32]> : vector<2xi32>>, #dlti.dl_entry<i64, dense<64> : vector<2xi32>>, #dlti.dl_entry<i128, dense<128> : vector<2xi32>>, #dlti.dl_entry<!llvm.ptr, dense<64> : vector<4xi32>>, #dlti.dl_entry<i1, dense<8> : vector<2xi32>>, #dlti.dl_entry<"dlti.endianness", "little">, #dlti.dl_entry<"dlti.stack_alignment", 128 : i32>>, llvm.data_layout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128", llvm.target_triple = "aarch64-unknown-linux-gnu", "polygeist.target-cpu" = "generic", "polygeist.target-features" = "+fp-armv8,+neon,+outline-atomics,+v8a,-fmv"} {
  llvm.mlir.global internal constant @str7("==END   DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str6("\0Aend   dump: %s\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str5("%0.2lf \00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str4("\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str3("w\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str2("begin dump: %s\00") {addr_space = 0 : i32}
  llvm.mlir.global internal constant @str1("==BEGIN DUMP_ARRAYS==\0A\00") {addr_space = 0 : i32}
  llvm.mlir.global external @stderr() {addr_space = 0 : i32} : memref<?x!llvm.struct<(i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i16, i8, array<1 x i8>, ptr, i64, ptr, ptr, ptr, ptr, i64, i32, array<20 x i8>)>>
  llvm.func @fprintf(!llvm.ptr, !llvm.ptr, ...) -> i32
  llvm.mlir.global internal constant @str0("\00") {addr_space = 0 : i32}
  func.func @main(%arg0: i32, %arg1: memref<?xmemref<?xi8>>) -> i32 attributes {llvm.linkage = #llvm.linkage<external>} {
    %c0_i32 = arith.constant 0 : i32
    %c42_i32 = arith.constant 42 : i32
    %c2000_i32 = arith.constant 2000 : i32
    %alloca = memref.alloca() : memref<1xf64>
    %0 = llvm.mlir.undef : f64
    affine.store %0, %alloca[0] : memref<1xf64>
    %alloca_0 = memref.alloca() : memref<1xf64>
    affine.store %0, %alloca_0[0] : memref<1xf64>
    %alloc = memref.alloc() : memref<2000x2000xf64>
    %alloc_1 = memref.alloc() : memref<2000xf64>
    %alloc_2 = memref.alloc() : memref<2000xf64>
    %alloc_3 = memref.alloc() : memref<2000xf64>
    %alloc_4 = memref.alloc() : memref<2000xf64>
    %alloc_5 = memref.alloc() : memref<2000xf64>
    %alloc_6 = memref.alloc() : memref<2000xf64>
    %alloc_7 = memref.alloc() : memref<2000xf64>
    %alloc_8 = memref.alloc() : memref<2000xf64>
    %cast = memref.cast %alloca_0 : memref<1xf64> to memref<?xf64>
    %cast_9 = memref.cast %alloca : memref<1xf64> to memref<?xf64>
    %cast_10 = memref.cast %alloc : memref<2000x2000xf64> to memref<?x2000xf64>
    %cast_11 = memref.cast %alloc_1 : memref<2000xf64> to memref<?xf64>
    %cast_12 = memref.cast %alloc_2 : memref<2000xf64> to memref<?xf64>
    %cast_13 = memref.cast %alloc_3 : memref<2000xf64> to memref<?xf64>
    %cast_14 = memref.cast %alloc_4 : memref<2000xf64> to memref<?xf64>
    %cast_15 = memref.cast %alloc_5 : memref<2000xf64> to memref<?xf64>
    %cast_16 = memref.cast %alloc_6 : memref<2000xf64> to memref<?xf64>
    %cast_17 = memref.cast %alloc_7 : memref<2000xf64> to memref<?xf64>
    %cast_18 = memref.cast %alloc_8 : memref<2000xf64> to memref<?xf64>
    call @init_array(%c2000_i32, %cast, %cast_9, %cast_10, %cast_11, %cast_12, %cast_13, %cast_14, %cast_15, %cast_16, %cast_17, %cast_18) : (i32, memref<?xf64>, memref<?xf64>, memref<?x2000xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>) -> ()
    %1 = affine.load %alloca_0[0] : memref<1xf64>
    %2 = affine.load %alloca[0] : memref<1xf64>
    %cast_19 = memref.cast %alloc : memref<2000x2000xf64> to memref<?x2000xf64>
    %cast_20 = memref.cast %alloc_1 : memref<2000xf64> to memref<?xf64>
    %cast_21 = memref.cast %alloc_2 : memref<2000xf64> to memref<?xf64>
    %cast_22 = memref.cast %alloc_3 : memref<2000xf64> to memref<?xf64>
    %cast_23 = memref.cast %alloc_4 : memref<2000xf64> to memref<?xf64>
    %cast_24 = memref.cast %alloc_5 : memref<2000xf64> to memref<?xf64>
    %cast_25 = memref.cast %alloc_6 : memref<2000xf64> to memref<?xf64>
    %cast_26 = memref.cast %alloc_7 : memref<2000xf64> to memref<?xf64>
    %cast_27 = memref.cast %alloc_8 : memref<2000xf64> to memref<?xf64>
    call @kernel_gemver(%c2000_i32, %1, %2, %cast_19, %cast_20, %cast_21, %cast_22, %cast_23, %cast_24, %cast_25, %cast_26, %cast_27) : (i32, f64, f64, memref<?x2000xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>, memref<?xf64>) -> ()
    %3 = arith.cmpi sgt, %arg0, %c42_i32 : i32
    scf.if %3 {
      %4 = affine.load %arg1[0] : memref<?xmemref<?xi8>>
      %5 = llvm.mlir.addressof @str0 : !llvm.ptr
      %6 = "polygeist.pointer2memref"(%5) : (!llvm.ptr) -> memref<?xi8>
      %7 = func.call @strcmp(%4, %6) : (memref<?xi8>, memref<?xi8>) -> i32
      %8 = arith.cmpi eq, %7, %c0_i32 : i32
      scf.if %8 {
        %cast_28 = memref.cast %alloc_5 : memref<2000xf64> to memref<?xf64>
        func.call @print_array(%c2000_i32, %cast_28) : (i32, memref<?xf64>) -> ()
      }
    }
    memref.dealloc %alloc : memref<2000x2000xf64>
    memref.dealloc %alloc_1 : memref<2000xf64>
    memref.dealloc %alloc_2 : memref<2000xf64>
    memref.dealloc %alloc_3 : memref<2000xf64>
    memref.dealloc %alloc_4 : memref<2000xf64>
    memref.dealloc %alloc_5 : memref<2000xf64>
    memref.dealloc %alloc_6 : memref<2000xf64>
    memref.dealloc %alloc_7 : memref<2000xf64>
    memref.dealloc %alloc_8 : memref<2000xf64>
    return %c0_i32 : i32
  }
  func.func private @init_array(%arg0: i32, %arg1: memref<?xf64>, %arg2: memref<?xf64>, %arg3: memref<?x2000xf64>, %arg4: memref<?xf64>, %arg5: memref<?xf64>, %arg6: memref<?xf64>, %arg7: memref<?xf64>, %arg8: memref<?xf64>, %arg9: memref<?xf64>, %arg10: memref<?xf64>, %arg11: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %cst = arith.constant 0.000000e+00 : f64
    %cst_0 = arith.constant 9.000000e+00 : f64
    %cst_1 = arith.constant 8.000000e+00 : f64
    %cst_2 = arith.constant 6.000000e+00 : f64
    %cst_3 = arith.constant 4.000000e+00 : f64
    %cst_4 = arith.constant 2.000000e+00 : f64
    %c1_i32 = arith.constant 1 : i32
    %cst_5 = arith.constant 1.200000e+00 : f64
    %cst_6 = arith.constant 1.500000e+00 : f64
    affine.store %cst_6, %arg1[0] : memref<?xf64>
    affine.store %cst_5, %arg2[0] : memref<?xf64>
    %0 = arith.sitofp %arg0 : i32 to f64
    %1 = arith.index_cast %arg0 : i32 to index
    %2 = arith.index_cast %arg0 : i32 to index
    affine.for %arg12 = 0 to %1 {
      %3 = arith.index_cast %arg12 : index to i32
      %4 = arith.sitofp %3 : i32 to f64
      affine.store %4, %arg4[%arg12] : memref<?xf64>
      %5 = arith.addi %3, %c1_i32 : i32
      %6 = arith.sitofp %5 : i32 to f64
      %7 = arith.divf %6, %0 : f64
      %8 = arith.divf %7, %cst_4 : f64
      affine.store %8, %arg6[%arg12] : memref<?xf64>
      %9 = arith.divf %7, %cst_3 : f64
      affine.store %9, %arg5[%arg12] : memref<?xf64>
      %10 = arith.divf %7, %cst_2 : f64
      affine.store %10, %arg7[%arg12] : memref<?xf64>
      %11 = arith.divf %7, %cst_1 : f64
      affine.store %11, %arg10[%arg12] : memref<?xf64>
      %12 = arith.divf %7, %cst_0 : f64
      affine.store %12, %arg11[%arg12] : memref<?xf64>
      affine.store %cst, %arg9[%arg12] : memref<?xf64>
      affine.store %cst, %arg8[%arg12] : memref<?xf64>
      affine.for %arg13 = 0 to %2 {
        %13 = arith.index_cast %arg13 : index to i32
        %14 = arith.muli %3, %13 : i32
        %15 = arith.remsi %14, %arg0 : i32
        %16 = arith.sitofp %15 : i32 to f64
        %17 = arith.divf %16, %0 : f64
        affine.store %17, %arg3[%arg12, %arg13] : memref<?x2000xf64>
      }
    }
    return
  }
  func.func private @kernel_gemver(%arg0: i32, %arg1: f64, %arg2: f64, %arg3: memref<?x2000xf64>, %arg4: memref<?xf64>, %arg5: memref<?xf64>, %arg6: memref<?xf64>, %arg7: memref<?xf64>, %arg8: memref<?xf64>, %arg9: memref<?xf64>, %arg10: memref<?xf64>, %arg11: memref<?xf64>) attributes {llvm.linkage = #llvm.linkage<internal>} {
    %0 = arith.index_cast %arg0 : i32 to index
    affine.for %arg12 = 0 to %0 {
      affine.for %arg13 = 0 to %0 {
        %1 = affine.load %arg3[%arg12, %arg13] : memref<?x2000xf64>
        %2 = affine.load %arg4[%arg12] : memref<?xf64>
        %3 = affine.load %arg5[%arg13] : memref<?xf64>
        %4 = arith.mulf %2, %3 : f64
        %5 = arith.addf %1, %4 : f64
        %6 = affine.load %arg6[%arg12] : memref<?xf64>
        %7 = affine.load %arg7[%arg13] : memref<?xf64>
        %8 = arith.mulf %6, %7 : f64
        %9 = arith.addf %5, %8 : f64
        affine.store %9, %arg3[%arg12, %arg13] : memref<?x2000xf64>
      }
    }
    affine.for %arg12 = 0 to %0 {
      affine.for %arg13 = 0 to %0 {
        %1 = affine.load %arg9[%arg12] : memref<?xf64>
        %2 = affine.load %arg3[%arg13, %arg12] : memref<?x2000xf64>
        %3 = arith.mulf %arg2, %2 : f64
        %4 = affine.load %arg10[%arg13] : memref<?xf64>
        %5 = arith.mulf %3, %4 : f64
        %6 = arith.addf %1, %5 : f64
        affine.store %6, %arg9[%arg12] : memref<?xf64>
      }
    }
    affine.for %arg12 = 0 to %0 {
      %1 = affine.load %arg9[%arg12] : memref<?xf64>
      %2 = affine.load %arg11[%arg12] : memref<?xf64>
      %3 = arith.addf %1, %2 : f64
      affine.store %3, %arg9[%arg12] : memref<?xf64>
    }
    affine.for %arg12 = 0 to %0 {
      affine.for %arg13 = 0 to %0 {
        %1 = affine.load %arg8[%arg12] : memref<?xf64>
        %2 = affine.load %arg3[%arg12, %arg13] : memref<?x2000xf64>
        %3 = arith.mulf %arg1, %2 : f64
        %4 = affine.load %arg9[%arg13] : memref<?xf64>
        %5 = arith.mulf %3, %4 : f64
        %6 = arith.addf %1, %5 : f64
        affine.store %6, %arg8[%arg12] : memref<?xf64>
      }
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
