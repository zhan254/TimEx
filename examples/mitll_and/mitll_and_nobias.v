// ---------------------------------------------------------------------------
// Automatically extracted verilog file, created with TimEx v2.00.13
// Timing description and structural design for IARPA-BAA-14-03 via
// U.S. Air Force Research Laboratory contract FA8750-15-C-0203 and
// IARPA-BAA-16-03 via U.S. Army Research Office grant W911NF-17-1-0120.
// For questions about TimEx, contact CJ Fourie, coenrad@sun.ac.za
// (c) 2016-2018 Stellenbosch University
// ---------------------------------------------------------------------------
`timescale 1ps/100fs
module mitll_and (a, b, clk, out);

input
  a, b, clk;

output
  out;

reg
  out;

real
  delay_state3_clk_out = 9.0,
  ct_state0_clk_a = 2.4,
  ct_state0_clk_b = 2.5,
  ct_state1_a_b = 4.1,
  ct_state1_a_clk = 7.0,
  ct_state1_clk_b = 2.6,
  ct_state2_b_a = 3.9,
  ct_state2_b_clk = 6.8,
  ct_state2_clk_a = 2.5,
  ct_state3_clk_a = 0.6,
  ct_state3_clk_b = 0.6;

reg
   errorsignal_a,
   errorsignal_b,
   errorsignal_clk;

integer
   outfile,
   cell_state; // internal state of the cell

initial
   begin
      errorsignal_a = 0;
      errorsignal_b = 0;
      errorsignal_clk = 0;
      cell_state = 0; // Startup state
      out = 0; // All outputs start at 0
   end

always @(posedge a or negedge a) // execute at positive and negative edges of input
   begin
      if ($time>4) // arbitrary steady-state time)
         begin
            if (errorsignal_a == 1'b1)  // A critical timing is active for this input
               begin
                  outfile = $fopen("errors.txt", "a");
                  $fdisplay(outfile, "Violation of critical timing in module %m; %0d ps.\n", $stime);
                  $fclose(outfile);
                  out <= 1'bX;  // Set all outputs to unknown
               end
            if (errorsignal_a == 0)
               begin
                  case (cell_state)
                     0: begin
                           cell_state = 1;  // Blocking statement -- immediately
                        end
                     1: begin
                           errorsignal_b = 1;  // Critical timing on this input; assign immediately
                           errorsignal_b <= #(ct_state1_a_b) 0;  // Clear error signal after critical timing expires
                           errorsignal_clk = 1;  // Critical timing on this input; assign immediately
                           errorsignal_clk <= #(ct_state1_a_clk) 0;  // Clear error signal after critical timing expires
                        end
                     2: begin
                           cell_state = 3;  // Blocking statement -- immediately
                        end
                     3: begin
                           outfile = $fopen("errors.txt", "a");
                           $fdisplay(outfile, "Illegal a input in state %0d of module %m; %0d ps.\n", cell_state, $stime);
                           $fclose(outfile);
                           out <= 1'bX;  // Set all outputs to unknown
                        end
                  endcase
               end
         end
   end

always @(posedge b or negedge b) // execute at positive and negative edges of input
   begin
      if ($time>4) // arbitrary steady-state time)
         begin
            if (errorsignal_b == 1'b1)  // A critical timing is active for this input
               begin
                  outfile = $fopen("errors.txt", "a");
                  $fdisplay(outfile, "Violation of critical timing in module %m; %0d ps.\n", $stime);
                  $fclose(outfile);
                  out <= 1'bX;  // Set all outputs to unknown
               end
            if (errorsignal_b == 0)
               begin
                  case (cell_state)
                     0: begin
                           cell_state = 2;  // Blocking statement -- immediately
                        end
                     1: begin
                           cell_state = 3;  // Blocking statement -- immediately
                        end
                     2: begin
                           errorsignal_a = 1;  // Critical timing on this input; assign immediately
                           errorsignal_a <= #(ct_state2_b_a) 0;  // Clear error signal after critical timing expires
                           errorsignal_clk = 1;  // Critical timing on this input; assign immediately
                           errorsignal_clk <= #(ct_state2_b_clk) 0;  // Clear error signal after critical timing expires
                        end
                     3: begin
                           outfile = $fopen("errors.txt", "a");
                           $fdisplay(outfile, "Illegal b input in state %0d of module %m; %0d ps.\n", cell_state, $stime);
                           $fclose(outfile);
                           out <= 1'bX;  // Set all outputs to unknown
                        end
                  endcase
               end
         end
   end

always @(posedge clk or negedge clk) // execute at positive and negative edges of input
   begin
      if ($time>4) // arbitrary steady-state time)
         begin
            if (errorsignal_clk == 1'b1)  // A critical timing is active for this input
               begin
                  outfile = $fopen("errors.txt", "a");
                  $fdisplay(outfile, "Violation of critical timing in module %m; %0d ps.\n", $stime);
                  $fclose(outfile);
                  out <= 1'bX;  // Set all outputs to unknown
               end
            if (errorsignal_clk == 0)
               begin
                  case (cell_state)
                     0: begin
                           errorsignal_a = 1;  // Critical timing on this input; assign immediately
                           errorsignal_a <= #(ct_state0_clk_a) 0;  // Clear error signal after critical timing expires
                           errorsignal_b = 1;  // Critical timing on this input; assign immediately
                           errorsignal_b <= #(ct_state0_clk_b) 0;  // Clear error signal after critical timing expires
                        end
                     1: begin
                           cell_state = 0;  // Blocking statement -- immediately
                           errorsignal_b = 1;  // Critical timing on this input; assign immediately
                           errorsignal_b <= #(ct_state1_clk_b) 0;  // Clear error signal after critical timing expires
                        end
                     2: begin
                           cell_state = 0;  // Blocking statement -- immediately
                           errorsignal_a = 1;  // Critical timing on this input; assign immediately
                           errorsignal_a <= #(ct_state2_clk_a) 0;  // Clear error signal after critical timing expires
                        end
                     3: begin
                           out <= #(delay_state3_clk_out) !out;
                           cell_state = 0;  // Blocking statement -- immediately
                           errorsignal_a = 1;  // Critical timing on this input; assign immediately
                           errorsignal_a <= #(ct_state3_clk_a) 0;  // Clear error signal after critical timing expires
                           errorsignal_b = 1;  // Critical timing on this input; assign immediately
                           errorsignal_b <= #(ct_state3_clk_b) 0;  // Clear error signal after critical timing expires
                        end
                  endcase
               end
         end
   end

endmodule
