`include "axi_interfaces.vh"
module acc_wrapper 
        #(
                MEM_PORTS_NUM = 15,
                CTRL_PORTS_NUM = 2
        )
        ( 
                input  logic aclk,
                input  logic aresetn,

                // input 2 ctrl bus
                input  logic  [61  :0]     s_lite_bundle_araddr,
                input  logic  [1   :0]     s_lite_bundle_arvalid,
                input  logic  [5   :0]     s_lite_bundle_arprot,
                output logic  [1   :0]     s_lite_bundle_arready,
                output logic  [127 :0]     s_lite_bundle_rdata,
                output logic  [3   :0]     s_lite_bundle_rresp,
                output logic  [1   :0]     s_lite_bundle_rvalid,
                input  logic  [1   :0]     s_lite_bundle_rready,
                input  logic  [61  :0]     s_lite_bundle_awaddr,
                input  logic  [1   :0]     s_lite_bundle_awvalid,
                input  logic  [5   :0]     s_lite_bundle_awprot,
                output logic  [1   :0]     s_lite_bundle_awready,
                input  logic  [127 :0]     s_lite_bundle_wdata,
                input  logic  [15  :0]     s_lite_bundle_wstrb,
                input  logic  [1   :0]     s_lite_bundle_wvalid,
                output logic  [1   :0]     s_lite_bundle_wready,
                output logic  [3   :0]     s_lite_bundle_bresp,
                output logic  [1   :0]     s_lite_bundle_bvalid,
                input  logic  [1   :0]     s_lite_bundle_bready, 

                // output 15 mem bus
                output logic  [32  * 15 - 1  :0]      m_axi3_bundle_awaddr,
                output logic  [4   * 15 - 1  :0]      m_axi3_bundle_awlen,
                output logic  [3   * 15 - 1  :0]      m_axi3_bundle_awsize,
                output logic  [2   * 15 - 1  :0]      m_axi3_bundle_awburst,
                output logic  [6   * 15 - 1  :0]      m_axi3_bundle_awid,
                output logic  [1   * 15 - 1  :0]      m_axi3_bundle_awvalid,
                input  logic  [1   * 15 - 1  :0]      m_axi3_bundle_awready,
                output logic  [256 * 15 - 1  :0]      m_axi3_bundle_wdata,
                output logic  [32  * 15 - 1  :0]      m_axi3_bundle_wstrb,
                output logic  [1   * 15 - 1  :0]      m_axi3_bundle_wlast,
                output logic  [1   * 15 - 1  :0]      m_axi3_bundle_wvalid,
                input  logic  [1   * 15 - 1  :0]      m_axi3_bundle_wready,
                input  logic  [2   * 15 - 1  :0]      m_axi3_bundle_bresp,
                input  logic  [6   * 15 - 1  :0]      m_axi3_bundle_bid,
                input  logic  [1   * 15 - 1  :0]      m_axi3_bundle_bvalid,
                output logic  [1   * 15 - 1  :0]      m_axi3_bundle_bready,
                output logic  [32  * 15 - 1  :0]      m_axi3_bundle_araddr,
                output logic  [4   * 15 - 1  :0]      m_axi3_bundle_arlen,
                output logic  [3   * 15 - 1  :0]      m_axi3_bundle_arsize,
                output logic  [2   * 15 - 1  :0]      m_axi3_bundle_arburst,
                output logic  [6   * 15 - 1  :0]      m_axi3_bundle_arid,
                output logic  [1   * 15 - 1  :0]      m_axi3_bundle_arvalid,
                input  logic  [1   * 15 - 1  :0]      m_axi3_bundle_arready,
                input  logic  [256 * 15 - 1  :0]      m_axi3_bundle_rdata,
                input  logic  [2   * 15 - 1  :0]      m_axi3_bundle_rresp,
                input  logic  [6   * 15 - 1  :0]      m_axi3_bundle_rid,
                input  logic  [1   * 15 - 1  :0]      m_axi3_bundle_rlast,
                input  logic  [1   * 15 - 1  :0]      m_axi3_bundle_rvalid,
                output logic  [1   * 15 - 1  :0]      m_axi3_bundle_rready

        );

        axi3_simple mem_port[MEM_PORTS_NUM - 1:0]();
        genvar i;
        for ( i = 0; i < MEM_PORTS_NUM; i++) 
                begin
                        assign m_axi3_bundle_araddr  [32 * (i+1) - 1 : 32 * i] = mem_port[i].ar_addr    ;
                        assign m_axi3_bundle_arburst [2  * (i+1) - 1 : 2  * i] = mem_port[i].ar_burst   ;
                        assign m_axi3_bundle_arid    [6  * (i+1) - 1 : 6  * i] = mem_port[i].ar_id      ;
                        assign m_axi3_bundle_arlen   [4  * (i+1) - 1 : 4  * i] = mem_port[i].ar_len     ;
                        assign m_axi3_bundle_arsize  [3  * (i+1) - 1 : 3  * i] = mem_port[i].ar_size    ;
                        assign m_axi3_bundle_arvalid [i]                       = mem_port[i].ar_valid   ;
                        assign m_axi3_bundle_awaddr  [32 * (i+1) - 1 : 32 * i] = mem_port[i].aw_addr    ;
                        assign m_axi3_bundle_awburst [2  * (i+1) - 1 : 2  * i] = mem_port[i].aw_burst   ;
                        assign m_axi3_bundle_awid    [6  * (i+1) - 1 : 6  * i] = mem_port[i].aw_id      ;
                        assign m_axi3_bundle_awlen   [4  * (i+1) - 1 : 4  * i] = mem_port[i].aw_len     ;
                        assign m_axi3_bundle_awsize  [3  * (i+1) - 1 : 3  * i] = mem_port[i].aw_size    ;
                        assign m_axi3_bundle_awvalid [i]                       = mem_port[i].aw_valid   ;
                        assign m_axi3_bundle_wdata   [256* (i+1) - 1 : 256* i] = mem_port[i].w_data     ;
                        assign m_axi3_bundle_wlast   [i]                       = mem_port[i].w_last     ;
                        assign m_axi3_bundle_wstrb   [32 * (i+1) - 1 : 32 * i] = mem_port[i].w_strb     ;
                        assign m_axi3_bundle_wvalid  [i]                       = mem_port[i].w_valid    ;
                        assign m_axi3_bundle_rready  [i]                       = mem_port[i].r_ready    ;
                        assign m_axi3_bundle_bready  [i]                       = mem_port[i].b_ready    ;
                        
                        assign mem_port[i].r_id      = m_axi3_bundle_rid     [6  * (i+1) - 1 : 6  * i]  ;
                        assign mem_port[i].r_data    = m_axi3_bundle_rdata   [256* (i+1) - 1 : 256* i]  ;
                        assign mem_port[i].r_last    = m_axi3_bundle_rlast   [i]                        ;
                        assign mem_port[i].r_resp    = m_axi3_bundle_rresp   [2  * (i+1) - 1 : 2  * i]  ;
                        assign mem_port[i].r_valid   = m_axi3_bundle_rvalid  [i]                        ;
                        assign mem_port[i].ar_ready  = m_axi3_bundle_arready [i]                        ;
                        assign mem_port[i].aw_ready  = m_axi3_bundle_awready [i]                        ;
                        assign mem_port[i].w_ready   = m_axi3_bundle_wready  [i]                        ;
                        assign mem_port[i].b_id      = m_axi3_bundle_bid     [6  * (i+1) - 1 : 6  * i]  ;
                        assign mem_port[i].b_resp    = m_axi3_bundle_bresp   [2  * (i+1) - 1 : 2  * i]  ;
                        assign mem_port[i].b_valid   = m_axi3_bundle_bvalid  [i]                        ;
                end

        lite_simple ctrl_port[CTRL_PORTS_NUM - 1:0]();
        for ( i = 0; i < CTRL_PORTS_NUM; i++)
                begin
                        assign ctrl_port[i].ar_addr   = s_lite_bundle_araddr  [15 * (i+1) - 1 : 15 * i] ;
                        assign ctrl_port[i].ar_prot   = s_lite_bundle_arprot  [3  * (i+1) - 1 :  3 * i] ;
                        assign ctrl_port[i].ar_valid  = s_lite_bundle_arvalid [i]                       ;
                        assign ctrl_port[i].aw_addr   = s_lite_bundle_awaddr  [15 * (i+1) - 1 : 15 * i] ;
                        assign ctrl_port[i].aw_prot   = s_lite_bundle_awprot  [3  * (i+1) - 1 :  3 * i] ;
                        assign ctrl_port[i].aw_valid  = s_lite_bundle_awvalid [i]                       ;
                        assign ctrl_port[i].w_data    = s_lite_bundle_wdata   [64 * (i+1) - 1 : 64 * i] ;
                        assign ctrl_port[i].w_strb    = s_lite_bundle_wstrb   [8  * (i+1) - 1 :  8 * i] ;
                        assign ctrl_port[i].w_valid   = s_lite_bundle_wvalid  [i]                       ;
                        assign ctrl_port[i].r_ready   = s_lite_bundle_rready  [i]                       ;
                        assign ctrl_port[i].b_ready   = s_lite_bundle_bready  [i]                       ;

                        assign s_lite_bundle_rdata   [64 * (i+1) - 1 : 64 * i]  = ctrl_port[i].r_data   ;
                        assign s_lite_bundle_rresp   [2  * (i+1) - 1 : 2  * i]  = ctrl_port[i].r_resp   ;
                        assign s_lite_bundle_bresp   [2  * (i+1) - 1 : 2  * i]  = ctrl_port[i].b_resp   ;
                        assign s_lite_bundle_bvalid  [i]                        = ctrl_port[i].b_valid  ;
                        assign s_lite_bundle_rvalid  [i]                        = ctrl_port[i].r_valid  ;
                        assign s_lite_bundle_arready [i]                        = ctrl_port[i].ar_ready ;
                        assign s_lite_bundle_awready [i]                        = ctrl_port[i].aw_ready ;
                        assign s_lite_bundle_wready  [i]                        = ctrl_port[i].w_ready  ;


                end

        huge_acc#(
                        .MEM_PORTS_NUM(MEM_PORTS_NUM), 
                        .CTRL_PORTS_NUM(CTRL_PORTS_NUM)
                )
                 huge_acc_inst
                (
                        .aclk(aclk),
                        .aresetn(aresetn),
                        .mem_port(mem_port),
                        .ctrl_port(ctrl_port)
                );

endmodule : acc_wrapper
