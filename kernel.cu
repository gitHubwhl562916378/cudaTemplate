#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>

__global__ void addArray(int *ary1, int *ary2)
{
    int indx = threadIdx.x;
    ary1[indx] = ary2[indx];
}

int main(int argc,char **argv)
{
    int ary[32]{0};
    int res[32]{0};

    for(int i = 0; i < 32; i++){
        ary[i] = 2*i;
    }
    int *d_ary, *d_res;
    cudaMalloc((void**)&d_ary, 32 * sizeof(int));
    cudaMalloc((void**)&d_res, 32 * sizeof(int));
    cudaMemcpy((void*)d_ary, (void*)ary, 32 * sizeof(int), cudaMemcpyHostToDevice);
    addArray<<<1,32>>>(d_res, d_ary);

    cudaMemcpy((void*)res, (void*)d_res, 32 * sizeof(int), cudaMemcpyDeviceToHost);

    for(int i = 0; i < 32; i++){
        std::cout << "result:" << res[i] << std::endl;
    }

    cudaFree(d_ary);
    cudaFree(d_res);
    return 0;
}
