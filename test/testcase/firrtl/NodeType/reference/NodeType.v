module NodeType(
    input clock
);
    wire rf_port_clk;
    wire rf_port_en;
    wire rf_port_mask;
    wire [4:0] rf_port_addr;
    wire [63:0] rf_port_data;
    wire rf_wdata;
    assign rf_wdata = 1'h0;
    PAD_UNSIGNED #(.width(1), .n(5)) u_pad_1 (
        .y(rf_port_addr),
        .in(1'd0)
    );
    assign rf_port_en = 1'h1;
    assign rf_port_clk = clock;
    assign rf_port_mask = 1'h1;
    PAD_UNSIGNED #(.width(1), .n(64)) u_pad_2 (
        .y(rf_port_data),
        .in(1'h0)
    );
endmodule //NodeType
module PAD_UNSIGNED(y, in);
    parameter width = 4;
    parameter n = 4;
    output [(n > width ? n : width)-1:0] y;
    input [width-1:0] in;
    assign y = (n > width) ? {{(n - width){1'b0}}, in} : in;
endmodule // PAD_UNSIGNED
