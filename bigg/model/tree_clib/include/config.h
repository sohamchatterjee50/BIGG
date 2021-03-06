#ifndef cfg_H
#define cfg_H

#include <iostream>
#include <cstring>
#include <random>
#include <fstream>
#include <set>
#include <map>

typedef float Dtype;

struct cfg
{
    static int max_num_nodes;
    static bool directed, self_loop, bfs_permute;
    static int bits_compress;
    static int dim_embed;
    static int gpu;
    static int seed;

    static std::default_random_engine generator;

    static void LoadParams(const int argc, const char** argv);

    static void SetRandom();
};

#endif
