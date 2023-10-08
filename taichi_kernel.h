#ifndef TAICHI_KERNEL_H
#define TAICHI_KERNEL_H
#include <taichi/cpp/taichi.hpp>
#include <taichi/c_api/src/taichi_llvm_impl.h>
#include <fstream>
#include <ostream>

struct TaichiKernel{
    ti::Runtime runtime_;
    ti::AotModule module_;
    ti::Kernel kernel_;

    TaichiKernel(){
        runtime_ = ti::Runtime(TI_ARCH_X64);
        module_ = runtime_.load_aot_module("temp_aot");
        ti::check_last_error();
        kernel_ = module_.get_kernel("taichi_kernel_cpu");
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

    // prepare runtime
    capi::LlvmRuntime *llvm_runtime=
        static_cast<capi::LlvmRuntime *>((Runtime *)taichi_kernel->runtime_.runtime());

    auto &device = llvm_runtime->get();
    auto &cpu_device = static_cast<taichi::lang::cpu::CpuDevice &>(device);

    std::cout << "prepare runtime done" << std::endl;

    // import raw memory
    size_t memory_size = sizeof(float) * element_count;

    std::cout << "memory_size: " << memory_size << std::endl;
    
    taichi::lang::DeviceAllocation device_alloc = cpu_device.import_memory(raw_memory, memory_size);

    std::cout<< "import raw memory done" << std::endl;

    // prepare memory object
    ti::Memory memoryObj(taichi_kernel->runtime_.runtime(), device_alloc, memory_size, /*should_destroy=*/false);

    std::cout<< "prepare memory object done" << std::endl;

    // prepare tiNdArray
    TiNdArray tiNdArray;
    tiNdArray.memory = memoryObj.memory();
    tiNdArray.shape.dim_count = dim_count;
    tiNdArray.shape.dims[0] = element_count;
    tiNdArray.elem_shape.dim_count = 0;
    tiNdArray.elem_type = elem_type;

    std::cout<< "prepare tiNdArray done" << std::endl;

    // create NdArray
    ti::NdArray<data_type> ndarray(std::move(memoryObj), tiNdArray);

    std::cout<< "create NdArray done" << std::endl;

    return ndarray;
// #else
//     TI_NOT_IMPLEMENTED
// #endif
}

#endif //TAICHI_KERNEL_H