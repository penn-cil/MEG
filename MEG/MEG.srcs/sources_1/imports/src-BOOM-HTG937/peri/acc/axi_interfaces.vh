interface axi3_simple ; // 32'addr, 6'id, 256'data
        logic  [31 :0]  aw_addr;
        logic  [3  :0]  aw_len;
        logic  [2  :0]  aw_size;
        logic  [1  :0]  aw_burst;
        logic  [5  :0]  aw_id;
        logic           aw_valid;
        logic           aw_ready;
        logic  [255:0]  w_data;
        logic  [31 :0]  w_strb;
        logic           w_last;
        logic           w_valid;
        logic           w_ready;
        logic  [1  :0]  b_resp;
        logic  [5  :0]  b_id;
        logic           b_valid;
        logic           b_ready;
        logic  [31 :0]  ar_addr;
        logic  [3  :0]  ar_len;
        logic  [2  :0]  ar_size;
        logic  [1  :0]  ar_burst;
        logic  [5  :0]  ar_id;
        logic           ar_valid;
        logic           ar_ready;
        logic  [255:0]  r_data;
        logic  [1  :0]  r_resp;
        logic  [5  :0]  r_id;
        logic           r_last;
        logic           r_valid;
        logic           r_ready;
        modport master(
                output  ar_addr, ar_valid, ar_len, ar_size, ar_burst, ar_id, aw_addr, aw_valid, aw_len, aw_size, aw_burst, aw_id, w_data, w_strb, w_valid, w_last, r_ready, b_ready,
                input   ar_ready, aw_ready, w_ready, r_data, r_resp, r_valid, r_id, r_last, b_resp, b_valid, b_id
                );
        modport slave(
                output  ar_ready, aw_ready, w_ready, r_data, r_resp, r_valid, r_id, r_last, b_resp, b_valid, b_id,
                input   ar_addr, ar_valid, ar_len, ar_size, ar_burst, ar_id, aw_addr, aw_valid, aw_len, aw_size, aw_burst, aw_id, w_data, w_strb, w_valid, w_last, r_ready, b_ready
                );
endinterface: axi3_simple

interface lite_simple ; // 16' addr, 64'data
        logic  [15 :0]  ar_addr;
        logic           ar_valid;
        logic           ar_ready;
        logic  [2  :0]  ar_prot;
        logic  [63 :0]  r_data;
        logic  [1  :0]  r_resp;
        logic           r_valid;
        logic           r_ready;
        logic  [15 :0]  aw_addr;
        logic           aw_valid;
        logic           aw_ready;
        logic  [2  :0]  aw_prot;
        logic  [63 :0]  w_data;
        logic  [7  :0]  w_strb;
        logic           w_valid;
        logic           w_ready;
        logic  [1  :0]  b_resp;
        logic           b_valid;
        logic           b_ready;
        modport master(
                output  ar_addr, ar_valid, ar_prot, aw_addr, aw_valid, aw_prot, w_data, w_strb, w_valid, r_ready, b_ready,
                input   ar_ready, aw_ready, w_ready, r_data, r_resp, r_valid, b_resp, b_valid
                );
        modport slave(
                output  ar_ready, aw_ready, w_ready, r_data, r_resp, r_valid, b_resp, b_valid,
                input   ar_addr, ar_valid, ar_prot, aw_addr, aw_valid, aw_prot, w_data, w_strb, w_valid, r_ready, b_ready
                );
endinterface: lite_simple
