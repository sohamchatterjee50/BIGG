#ifndef CUDA_OP_H
#define CUDA_OP_H

#include <cstdint>

void build_binary_mat(int n_rows, int n_ints, int n_feats, int* lens,
                      uint32_t* bits, float* outptr);

#endif
