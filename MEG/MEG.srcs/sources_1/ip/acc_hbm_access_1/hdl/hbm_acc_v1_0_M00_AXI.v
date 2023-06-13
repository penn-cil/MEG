
`timescale 1 ns / 1 ps

module hbm_acc_v1_0_M00_AXI #
(
    // Users to add parameters here

    // User parameters ends
    // Do not modify the parameters beyond this line

    // Base address of targeted slave
    parameter  C_M_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
    // Burst Length. Supports 1 and only 1
    parameter integer C_M_AXI_BURST_LEN	= 1,
    // Thread ID Width
    parameter integer C_M_AXI_ID_WIDTH	= 1,
    // Width of Address Bus
    parameter integer C_M_AXI_ADDR_WIDTH	= 32,
    // Width of Data Bus
    parameter integer C_M_AXI_DATA_WIDTH	= 256
)
(
    // Users to add ports here
    input wire start_pulse,
    output reg set_done,
    input wire mode,
    input wire [C_M_AXI_ADDR_WIDTH-1:0] addr,
    input wire [C_M_AXI_DATA_WIDTH-1:0] write_data,
    output reg [C_M_AXI_DATA_WIDTH-1:0] read_data,
    // User ports ends
    // Do not modify the ports beyond this line

    // Global Clock Signal.
    input wire  M_AXI_ACLK,
    // Global Reset Singal. This Signal is Active Low
    input wire  M_AXI_ARESETN,
    // Master Interface Write Address ID
    output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_AWID,
    // Master Interface Write Address
    output reg [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_AWADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    output wire [7 : 0] M_AXI_AWLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    output wire [2 : 0] M_AXI_AWSIZE,
    // Burst type. The burst type and the size information, 
// determine how the address for each transfer within the burst is calculated.
    output wire [1 : 0] M_AXI_AWBURST,
    // Lock type. Provides additional information about the
// atomic characteristics of the transfer.
    output wire  M_AXI_AWLOCK,
    // Memory type. This signal indicates how transactions
// are required to progress through a system.
    output wire [3 : 0] M_AXI_AWCACHE,
    // Protection type. This signal indicates the privilege
// and security level of the transaction, and whether
// the transaction is a data access or an instruction access.
    output wire [2 : 0] M_AXI_AWPROT,
    // Quality of Service, QoS identifier sent for each write transaction.
    output wire [3 : 0] M_AXI_AWQOS,
    // Write address valid. This signal indicates that
// the channel is signaling valid write address and control information.
    output reg  M_AXI_AWVALID,
    // Write address ready. This signal indicates that
// the slave is ready to accept an address and associated control signals
    input wire  M_AXI_AWREADY,
    // Master Interface Write Data.
    output reg [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_WDATA,
    // Write strobes. This signal indicates which byte
// lanes hold valid data. There is one write strobe
// bit for each eight bits of the write data bus.
    output wire [C_M_AXI_DATA_WIDTH/8-1 : 0] M_AXI_WSTRB,
    // Write last. This signal indicates the last transfer in a write burst.
    output wire  M_AXI_WLAST,
    // Write valid. This signal indicates that valid write
// data and strobes are available
    output reg  M_AXI_WVALID,
    // Write ready. This signal indicates that the slave
// can accept the write data.
    input wire  M_AXI_WREADY,
    // Master Interface Write Response.
    input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_BID,
    // Write response. This signal indicates the status of the write transaction.
    input wire [1 : 0] M_AXI_BRESP,
    // Write response valid. This signal indicates that the
// channel is signaling a valid write response.
    input wire  M_AXI_BVALID,
    // Response ready. This signal indicates that the master
// can accept a write response.
    output wire  M_AXI_BREADY,
    // Master Interface Read Address.
    output wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_ARID,
    // Read address. This signal indicates the initial
// address of a read burst transaction.
    output reg [C_M_AXI_ADDR_WIDTH-1 : 0] M_AXI_ARADDR,
    // Burst length. The burst length gives the exact number of transfers in a burst
    output wire [7 : 0] M_AXI_ARLEN,
    // Burst size. This signal indicates the size of each transfer in the burst
    output wire [2 : 0] M_AXI_ARSIZE,
    // Burst type. The burst type and the size information, 
// determine how the address for each transfer within the burst is calculated.
    output wire [1 : 0] M_AXI_ARBURST,
    // Lock type. Provides additional information about the
// atomic characteristics of the transfer.
    output wire  M_AXI_ARLOCK,
    // Memory type. This signal indicates how transactions
// are required to progress through a system.
    output wire [3 : 0] M_AXI_ARCACHE,
    // Protection type. This signal indicates the privilege
// and security level of the transaction, and whether
// the transaction is a data access or an instruction access.
    output wire [2 : 0] M_AXI_ARPROT,
    // Quality of Service, QoS identifier sent for each read transaction
    output wire [3 : 0] M_AXI_ARQOS,
    // Write address valid. This signal indicates that
// the channel is signaling valid read address and control information
    output reg  M_AXI_ARVALID,
    // Read address ready. This signal indicates that
// the slave is ready to accept an address and associated control signals
    input wire  M_AXI_ARREADY,
    // Read ID tag. This signal is the identification tag
// for the read data group of signals generated by the slave.
    input wire [C_M_AXI_ID_WIDTH-1 : 0] M_AXI_RID,
    // Master Read Data
    input wire [C_M_AXI_DATA_WIDTH-1 : 0] M_AXI_RDATA,
    // Read response. This signal indicates the status of the read transfer
    input wire [1 : 0] M_AXI_RRESP,
    // Read last. This signal indicates the last transfer in a read burst
    input wire  M_AXI_RLAST,
    // Read valid. This signal indicates that the channel
// is signaling the required read data.
    input wire  M_AXI_RVALID,
    // Read ready. This signal indicates that the master can
// accept the read data and response information.
    output reg  M_AXI_RREADY
);

// Create state machine
localparam SIZE = 3;
localparam IDLE = 3'b001, WRITE_ADDR = 3'b010, WRITE_DATA = 3'b011, READ_ADDR = 3'b100,
           READ_DATA = 3'b101;
(* mark_debug = "true" *) reg [SIZE-1:0]  state;
(* mark_debug = "true" *) reg [SIZE-1:0] next_state;

// State logic
always @ (posedge M_AXI_ACLK) begin
    if (M_AXI_ARESETN == 1'b0) begin
        state <= IDLE;
    end else begin
        state <= next_state;
    end
end


always @(*) begin
    M_AXI_AWADDR = addr;
    M_AXI_AWVALID = 1'b0;
    M_AXI_WDATA = write_data;
    M_AXI_WVALID = 1'b0;
    M_AXI_ARADDR = addr;
    M_AXI_ARVALID = 1'b0;
    M_AXI_RREADY = 1'b0;
    set_done = 1'b0;
    read_data = M_AXI_RDATA;
    case (state)
        IDLE: begin
            if (start_pulse == 1'b1) begin
                if (mode == 1'b1) begin
                    next_state = WRITE_ADDR;
                end else begin
                    next_state = READ_ADDR;
                end
            end else begin
                next_state = IDLE;
            end
        end
        WRITE_ADDR: begin
            M_AXI_AWVALID = 1'b1;
            if (M_AXI_AWREADY == 1'b1) begin
                next_state = WRITE_DATA;
            end else begin
                next_state = WRITE_ADDR;
            end
        end
        WRITE_DATA: begin
            M_AXI_WVALID = 1'b1;
            if (M_AXI_WREADY == 1'b1) begin
                set_done = 1'b1;
                next_state = IDLE;
            end else begin
                next_state = WRITE_DATA;
            end
        end
        READ_ADDR: begin
            M_AXI_ARVALID = 1'b1;
            if (M_AXI_ARREADY == 1'b1) begin
                next_state = READ_DATA;
            end else begin
                next_state = READ_ADDR;
            end
        end
        READ_DATA: begin
            M_AXI_RREADY = 1'b1;
            if (M_AXI_RVALID == 1'b1) begin
                set_done = 1'b1;
                next_state = IDLE;
            end else begin
                next_state = READ_DATA;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

// Hardcoded AXI values
// Map for outputs
// Write address
assign M_AXI_AWID = 1'b0;
//assign m00_axi_awaddr = um_tx_wr_addr + C_M00_AXI_TARGET_SLAVE_BASE_ADDR;
assign M_AXI_AWLEN = C_M_AXI_BURST_LEN - 1;
assign M_AXI_AWSIZE = 3'b101;     // HBM only allows 256 bits/beat
assign M_AXI_AWBURST = 2'b01;     // Incrementing burst
assign M_AXI_AWLOCK = 1'b0;
assign M_AXI_AWCACHE = 4'b0011;
assign M_AXI_AWPROT = 1'b0;
assign M_AXI_AWQOS = 1'b0;
//assign m00_axi_awvalid = um_tx_wr_valid;
// Write data
//assign m00_axi_wdata = um_tx_data;
assign M_AXI_WSTRB = {64{1'b1}};        // TODO may need to implementing strobing/masking
assign M_AXI_WLAST = 1'b1;             // Always drive high since every beat is the last beat
//assign m00_axi_wvalid = um_tx_wr_valid; 
// Write back
assign M_AXI_BREADY = 1'b1;               // doesn't use wb so it always is ready
// Read address
assign M_AXI_ARID = 1'b0;
//assign m00_axi_araddr = um_tx_rd_addr;
assign M_AXI_ARLEN = C_M_AXI_BURST_LEN - 1;
assign M_AXI_ARSIZE = 3'b101;     // HBM only allows 256 bits/beat
assign M_AXI_ARBURST =2'b01;     // Incrementing burst but isn't used since one beat/burst
assign M_AXI_ARLOCK = 1'b0;
assign M_AXI_ARCACHE = 4'b0011;
assign M_AXI_ARPROT = 1'b0;
assign M_AXI_ARQOS = 1'b0;
//assign m00_axi_arvalid = um_tx_rd_valid;
// Read data
//assign m00_axi_rready = um_rx_rd_ready;

endmodule
