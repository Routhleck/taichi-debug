#ifndef TAICHI_KERNEL_H
#define TAICHI_KERNEL_H
#include <taichi/cpp/taichi.hpp>
#include <taichi/taichi_cuda.h>
#include <fstream>
#include <ostream>


struct TaichiKernel{
    ti::Runtime runtime_;
    ti::AotModule module_;
    ti::Kernel kernel_;

    TaichiKernel(){
        runtime_ = ti::Runtime(TI_ARCH_CUDA);
        module_ = runtime_.load_aot_module("temp_aot_cuda");
        ti::check_last_error();
        kernel_ = module_.get_kernel("taichi_kernel_cuda");
        ti::check_last_error();
    }

    void launch(){
        kernel_.launch();
        runtime_.wait();
        ti::check_last_error();
    }
};

extern TaichiKernel *taichi_kernel;

template<typename data_type>
ti::NdArray<data_type> createNdArrayFromRawMemory(void* raw_memory, uint32_t dim_count, uint32_t element_count, TiDataType elem_type) {
// #ifdef TI_WITH_LLVM
    // import raw memory
    size_t memory_size = sizeof(float) * element_count;

    std::cout << "memory_size: " << memory_size << std::endl;
    
    auto memory = ti_import_cuda_memory(taichi_kernel->runtime_, raw_memory, memory_size);

    std::cout<< "prepare memory object done" << std::endl;

    // prepare tiNdArray
    TiNdArray tiNdArray;
    tiNdArray.memory = memory;
    tiNdArray.shape.dim_count = dim_count;
    tiNdArray.shape.dims[0] = element_count;
    tiNdArray.elem_shape.dim_count = 0;
    tiNdArray.elem_type = elem_type;

    std::cout<< "prepare tiNdArray done" << std::endl;

    auto ti_memory = ti::Memory(taichi_kernel->runtime_, memory, memory_size, false);
    // create NdArray
    auto ndarray = ti::NdArray<float>(std::move(ti_memory), tiNdArray);

    std::cout<< "create NdArray done" << std::endl;

    return ndarray;
// #else
//     TI_NOT_IMPLEMENTED
// #endif
}

#endif //TAICHI_KERNEL_H