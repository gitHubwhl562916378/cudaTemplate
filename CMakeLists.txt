cmake_minimum_required(VERSION 2.8)

project(cudaTemplate)
find_package(CUDA REQUIRED)
message(STATUS "CUDA library status:")
message(STATUS "     version: ${CUDA_VERSION}")
message(STATUS "     include path: ${CUDA_INCLUDE_DIRS}")
message(STATUS "     libraries path: ${CUDA_LIBS}")
#设置头文件包含路径
#include_directories(${CUDA_INCLUDE_DIRS})
#设置库包含路径
#link_directories()
#设置指定编译参数
#SET(CUDA_NVCC_FLAGS "${CUDA_NVCC_FLAGS};-gencode arch=compute_61,code=sm_61;-std=c++11;")
#添加编译参数
add_compile_options(-std=c++11)
#编译
cuda_add_executable(${PROJECT_NAME} kernel.cu)

#target_link_libraries()
