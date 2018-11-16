-- FIR_ofc.vhd

-- Generated using ACDS version 17.1 590

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FIR_ofc is
	port (
		fir_compiler_ii_0_avalon_streaming_sink_data    : in  std_logic_vector(13 downto 0) := (others => '0'); --   fir_compiler_ii_0_avalon_streaming_sink.data
		fir_compiler_ii_0_avalon_streaming_sink_valid   : in  std_logic                     := '0';             --                                          .valid
		fir_compiler_ii_0_avalon_streaming_sink_error   : in  std_logic_vector(1 downto 0)  := (others => '0'); --                                          .error
		fir_compiler_ii_0_avalon_streaming_source_data  : out std_logic_vector(35 downto 0);                    -- fir_compiler_ii_0_avalon_streaming_source.data
		fir_compiler_ii_0_avalon_streaming_source_valid : out std_logic;                                        --                                          .valid
		fir_compiler_ii_0_avalon_streaming_source_error : out std_logic_vector(1 downto 0);                     --                                          .error
		fir_compiler_ii_0_clk_clk                       : in  std_logic                     := '0';             --                     fir_compiler_ii_0_clk.clk
		fir_compiler_ii_0_rst_reset_n                   : in  std_logic                     := '0'              --                     fir_compiler_ii_0_rst.reset_n
	);
end entity FIR_ofc;

architecture rtl of FIR_ofc is
	component FIR_ofc_fir_compiler_ii_0 is
		port (
			clk              : in  std_logic                     := 'X';             -- clk
			reset_n          : in  std_logic                     := 'X';             -- reset_n
			ast_sink_data    : in  std_logic_vector(13 downto 0) := (others => 'X'); -- data
			ast_sink_valid   : in  std_logic                     := 'X';             -- valid
			ast_sink_error   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- error
			ast_source_data  : out std_logic_vector(35 downto 0);                    -- data
			ast_source_valid : out std_logic;                                        -- valid
			ast_source_error : out std_logic_vector(1 downto 0)                      -- error
		);
	end component FIR_ofc_fir_compiler_ii_0;

begin

	fir_compiler_ii_0 : component FIR_ofc_fir_compiler_ii_0
		port map (
			clk              => fir_compiler_ii_0_clk_clk,                       --                     clk.clk
			reset_n          => fir_compiler_ii_0_rst_reset_n,                   --                     rst.reset_n
			ast_sink_data    => fir_compiler_ii_0_avalon_streaming_sink_data,    --   avalon_streaming_sink.data
			ast_sink_valid   => fir_compiler_ii_0_avalon_streaming_sink_valid,   --                        .valid
			ast_sink_error   => fir_compiler_ii_0_avalon_streaming_sink_error,   --                        .error
			ast_source_data  => fir_compiler_ii_0_avalon_streaming_source_data,  -- avalon_streaming_source.data
			ast_source_valid => fir_compiler_ii_0_avalon_streaming_source_valid, --                        .valid
			ast_source_error => fir_compiler_ii_0_avalon_streaming_source_error  --                        .error
		);

end architecture rtl; -- of FIR_ofc