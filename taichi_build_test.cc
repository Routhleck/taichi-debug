#include "taichi_kernel.h"
#include <iostream>

namespace taichi_kernel_call {

    void launch_taichi_kernel(void **out, const void **in) {
        const float *data_x = reinterpret_cast<const float *>(in[0]);
        const float *data_y = reinterpret_cast<const float *>(in[1]);
        const float base = *reinterpret_cast<const float *>(in[2]);

        float *data_out_y = reinterpret_cast<float *>(out[0]);
        memset(data_out_y, 0, sizeof(float) * 4);

        std::cout << "prepare data done" << std::endl;

        ti::NdArray<float> x = createNdArrayFromRawMemory<float>(const_cast<void*>(in[0]), 1, 4, TI_DATA_TYPE_F32);

        std::cout << "prepare x done" << std::endl;

        ti::NdArray<float> y = createNdArrayFromRawMemory<float>(const_cast<void*>(in[1]), 1, 4, TI_DATA_TYPE_F32);

        ti::NdArray<float> out_y = createNdArrayFromRawMemory<float>(out[0], 1, 4, TI_DATA_TYPE_F32);

        std::cout << "prepare out_y done" << std::endl;

        // prepare args
        // taichi_kernel->kernel_.push_arg(x);
        taichi_kernel->kernel_.push_arg(out_y);
        taichi_kernel->kernel_.push_arg(base);

        // launch
        taichi_kernel->launch();
    }

}

int main() {
    float data_x[4] = {1.0, 2.0, 3.0, 4.0};
    float data_y[4] = {1.0, 2.0, 3.0, 4.0};
    float base = 5.0;
    float data_out_y[4] = {0};

    const void *inputs[] = {data_x, data_y, &base};
    void *outputs[] = {data_out_y};

    taichi_kernel_call::launch_taichi_kernel(outputs, inputs);

    // 输出结果以进行检查
    for (int i = 0; i < 4; i++) {
        std::cout << "Result[" << i << "] = " << data_out_y[i] << std::endl;
    }

    return 0;
}
