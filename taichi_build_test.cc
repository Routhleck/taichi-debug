#include "taichi_kernel.h"
#include <taichi/c_api/src/c_api_test_utils.h>
#include <iostream>

namespace taichi_kernel_call {

    void launch_taichi_kernel(void **out, const void **in) {
        const float base = *reinterpret_cast<const float *>(in[1]);

        ti::NdArray<float> x = createNdArrayFromRawMemory<float>(const_cast<void*>(in[0]), 1, 4, TI_DATA_TYPE_F32);

        std::cout << "prepare x done" << std::endl;

        ti::NdArray<float> out_y = createNdArrayFromRawMemory<float>(out[0], 1, 4, TI_DATA_TYPE_F32);

        std::cout << "prepare out_y done" << std::endl;

        // prepare args
        taichi_kernel->kernel_.push_arg(x);
        taichi_kernel->kernel_.push_arg(out_y);
        taichi_kernel->kernel_.push_arg(base);

        // launch
        taichi_kernel->launch();
    }

}

int main() {
    float data_x[4] = {1.0, 2.0, 3.0, 4.0};
    float base = 5.0;
    float data_out_y[4] = {0};

    void* cuda_data_x;
    void* cuda_data_out_y;
    void* cuda_base;

    size_t cuda_data_x_size = sizeof(data_x);
    size_t cuda_data_out_y_size = sizeof(data_out_y);
    // size_t cuda_base_size = sizeof(base);

    capi::utils::cudaMalloc(&cuda_data_x, cuda_data_x_size);
    capi::utils::cudaMalloc(&cuda_data_out_y, cuda_data_out_y_size);
    // capi::utils::cudaMalloc(&cuda_base, cuda_base_size);

    capi::utils::cudaMemcpy(cuda_data_x, data_x, cuda_data_x_size);
    capi::utils::cudaMemcpy(cuda_data_out_y, data_out_y, cuda_data_out_y_size);
    // capi::utils::cudaMemcpy(cuda_base, &base, cuda_base_size);
    const void *inputs[] = {cuda_data_x, &base};
    void *outputs[] = {cuda_data_out_y};

    taichi_kernel_call::launch_taichi_kernel(outputs, inputs);

    capi::utils::cudaMemcpyFromDevice(&data_out_y, cuda_data_out_y, sizeof(data_out_y));

    // 输出结果以进行检查
    for (int i = 0; i < 4; i++) {
        std::cout << "Result[" << i << "] = " << data_out_y[i] << std::endl;
    }

    return 0;
}
