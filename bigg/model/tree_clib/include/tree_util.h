#ifndef TREE_UTIL_H
#define TREE_UTIL_H

#include <vector>
#include <map>
#include "struct_util.h"  // NOLINT

class AdjNode;
extern int total_job_nums;
extern std::vector<AdjNode*> global_job_nodes;

class AdjNode
{
 public:
    AdjNode(){}
    AdjNode(AdjNode* parent, int row, int col_begin, int col_end, int depth);
    ~AdjNode();
    void init(AdjNode* parent, int row, int col_begin, int col_end, int depth);
    void split();
    void update_bits();

    AdjNode *parent, *lch, *rch;
    int global_idx;
    int row, col_begin, col_end, mid;
    int depth, n_cols;
    bool is_leaf, is_root;
    bool has_edge, is_lowlevel;
    BitSet bits_rep;
    int job_idx;
};

extern PtHolder<AdjNode> node_holder;

class AdjRow
{
 public:
    AdjRow(){}
    AdjRow(int row, int col_start, int col_end);
    ~AdjRow();
    void init(int row, int col_start, int col_end);

    void insert_edges(std::vector<int>& col_indices);
    AdjNode* root;
    int row, max_col;

 private:
    void add_edges(AdjNode* node, ColAutomata* col_sm);
};

extern PtHolder<AdjRow> row_holder;


#endif
