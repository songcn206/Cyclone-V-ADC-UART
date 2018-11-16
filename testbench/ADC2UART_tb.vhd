

library IEEE;
use	IEEE.std_logic_1164.all;
use	IEEE.numeric_std.all;
use ieee.math_real.all;



entity ADC2UART_tb is
end entity;

--my custom modules
library work;
use work.my_types_pkg.all;

architecture tb of ADC2UART_tb is
		signal clk_50					: std_logic :='1';
		
		signal delaySwitch				: std_logic:='0';
		signal triggerSlopeSwitch			: std_logic:='0';
		signal triggerSwitch				: std_logic:='0';
		
		signal AD_SCLK					: std_logic;
		signal AD_SDIO					: std_logic;
		
		signal ADA_DCO					: std_logic :='1';
		signal ADA_OE					: std_logic;
		signal ADA_SPI_CS				: std_logic;
		
		signal ADB_DCO					: std_logic :='1';
		signal ADB_OE					: std_logic;
		signal ADB_SPI_CS				: std_logic;
		
		signal ADC_DA					: unsigned 			(13 DOWNTO 0);
		signal ADC_DB					: unsigned 			(13 DOWNTO 0);
		
		signal FPGA_CLK_A_N			: std_logic;
		signal FPGA_CLK_A_P			: std_logic;
		signal FPGA_CLK_B_N			: std_logic;
		signal FPGA_CLK_B_P			: std_logic;
		
		signal led						: unsigned (3 DOWNTO 0);
		
		signal UART_RX					: std_logic:='1';
		signal UART_TX					: std_logic;
		
		signal counter 		: integer :=0;
		signal UARTcounter 		: integer :=0;
		--signal UARTclk		: std_logic:=0;
		
		constant Tpw_clk : time := 10 ns;
		constant dco_clk : time := 12.5 ns;
		constant UART_clk: time := 500 ns;
		
		signal gpioTrig : std_logic :='0';

                signal charToSend : std_logic_vector(7 downto 0) := "00000000";  --default is blank

		signal rand_num : integer := 0;
                                                                                                                                          
                
begin

	process
    		variable seed1, seed2: positive;               -- seed values for random generator
   		variable rand: real;   -- random real-number value in range 0 to 1.0  
    		variable range_of_rand : real := 10.0;    -- the range of random values created will be 0 to +1000.
	begin
    		uniform(seed1, seed2, rand);   -- generate random number
    		rand_num <= integer(rand*range_of_rand);  -- rescale to 0..1000, convert integer part 
	    	wait for 10 ns;
	end process;



	clock_gen : process is
		begin
			clk_50 <= '0' after Tpw_clk, '1' after 2*Tpw_clk;
			Wait for 2*Tpw_clk;
	end process clock_gen;

	UARTclock_gen : process is
		begin
			--UARTclk <= '0' after UART_clk, '1' after 2*UART_clk;
			UARTcounter <=UARTcounter+1;
			Wait for 2*UART_clk;
	end process UARTclock_gen;


	dco_gen : process is
		begin
			ADA_DCO <= '0' after dco_clk, '1' after 2*dco_clk;
			ADB_DCO <= '0' after dco_clk, '1' after 2*dco_clk;
			counter<=counter+1;
			Wait for 2*dco_clk;
	end process dco_gen;

	testbench : entity work.ADC2UART_top PORT MAP (
		clk_50	 =>	clk_50,
		delaySwitch	 =>	delaySwitch,
		triggerSlopeSwitch	 =>	triggerSlopeSwitch,
		triggerSwitch	 =>	triggerSwitch,
		AD_SCLK	 =>	AD_SCLK,
		AD_SDIO	 =>	AD_SDIO,
		ADA_DCO	 =>	ADA_DCO,
		ADA_OE	 =>	ADA_OE,
		ADA_SPI_CS	 =>	ADA_SPI_CS,
		ADB_DCO	 =>	ADB_DCO,
		ADB_OE	 =>	ADB_OE,
		ADB_SPI_CS	 =>	ADB_SPI_CS,
		ADC_DA	 =>	ADC_DA,
		ADC_DB	 =>	ADC_DB,
		FPGA_CLK_A_N	 =>	FPGA_CLK_A_N,
		FPGA_CLK_A_P	 =>	FPGA_CLK_A_P,
		FPGA_CLK_B_N	 =>	FPGA_CLK_B_N,
		FPGA_CLK_B_P	 =>	FPGA_CLK_B_P,
		led	 =>	led,
		UART_RX	 =>	UART_RX,
		UART_TX	 =>	UART_TX,
		gpioTrigger => gpioTrig
	);



	sendChar: process is
	--variable char  : std_logic_vector(7 downto 0) := "01110111";  -- 'w'
	variable CHARctr : natural range 0 to 9:=0;
	begin
		if UARTcounter = 100 then
			UART_RX<='0';
		elsif UARTcounter > 100 and UARTcounter <109 then
			UART_RX<=charToSend(CHARctr);
			CHARctr:=CHARctr+1;
		else
			UART_RX<='1';
			CHARctr:=0;
		end if;
		wait for 2*UART_clk;
	end process sendChar;
	





	ADC_B_gen : process is
	begin
                if counter mod 80 =0 then

                elsif counter mod 80 =1 then

                elsif counter mod 80 =2 then

                elsif counter mod 80 =3 then

                elsif counter mod 80 =4 then

                elsif counter mod 80 =5 then

                elsif counter mod 80 =6 then

                elsif counter mod 80 =7 then

                elsif counter mod 80 =8 then

                elsif counter mod 80 =9 then

                elsif counter mod 80 =10 then

                elsif counter mod 80 =11 then

                elsif counter mod 80 =12 then

                elsif counter mod 80 =13 then

                elsif counter mod 80 =14 then

                elsif counter mod 80 =15 then

                elsif counter mod 80 =16 then

                elsif counter mod 80 =17 then

                elsif counter mod 80 =18 then

                elsif counter mod 80 =19 then

                elsif counter mod 80 =20 then

                elsif counter mod 80 =21 then

                elsif counter mod 80 =22 then

                elsif counter mod 80 =23 then

                elsif counter mod 80 =24 then

                elsif counter mod 80 =25 then

                elsif counter mod 80 =26 then

                elsif counter mod 80 =27 then

                elsif counter mod 80 =28 then

                elsif counter mod 80 =29 then

                elsif counter mod 80 =30 then

                elsif counter mod 80 =31 then

                elsif counter mod 80 =32 then

                elsif counter mod 80 =33 then

                elsif counter mod 80 =34 then

                elsif counter mod 80 =35 then

                elsif counter mod 80 =36 then

                elsif counter mod 80 =37 then

                elsif counter mod 80 =38 then

                elsif counter mod 80 =39 then

                elsif counter mod 80 =40 then

                elsif counter mod 80 =41 then

                elsif counter mod 80 =42 then

                elsif counter mod 80 =43 then

                elsif counter mod 80 =44 then

                elsif counter mod 80 =45 then

                elsif counter mod 80 =46 then

                elsif counter mod 80 =47 then

                elsif counter mod 80 =48 then

                elsif counter mod 80 =49 then

                elsif counter mod 80 =50 then

                elsif counter mod 80 =51 then

                elsif counter mod 80 =52 then

                elsif counter mod 80 =53 then

                elsif counter mod 80 =54 then

                elsif counter mod 80 =55 then

                elsif counter mod 80 =56 then

                elsif counter mod 80 =57 then

                elsif counter mod 80 =58 then

                elsif counter mod 80 =59 then

                elsif counter mod 80 =60 then

                elsif counter mod 80 =61 then

                elsif counter mod 80 =62 then

                elsif counter mod 80 =63 then

                elsif counter mod 80 =64 then

                elsif counter mod 80 =65 then

                elsif counter mod 80 =66 then

                elsif counter mod 80 =67 then

                elsif counter mod 80 =68 then

                elsif counter mod 80 =69 then

                elsif counter mod 80 =70 then

                elsif counter mod 80 =71 then

                elsif counter mod 80 =72 then

                elsif counter mod 80 =73 then

                elsif counter mod 80 =74 then

                elsif counter mod 80 =75 then

                elsif counter mod 80 =76 then

                elsif counter mod 80 =77 then

                elsif counter mod 80 =78 then

                elsif counter mod 80 =79 then

		end if;
		
		Wait for 2*dco_clk;

	end process ADC_B_gen;

	ADC_A_gen : process is
	variable ADCctr : natural range 0 to 40:=0;
	begin
		if ADC_DB < 7600 and ADCctr=0 then
			ADCctr:=1;			
		end if;
	
		if ADCctr>=1 and ADCctr<25 then
			--ADC_DA<=to_unsigned(16383, 14);
			gpioTrig<='1';
			ADCctr:=ADCctr+1;
		else 
			--ADC_DA<=to_unsigned(0,14);
			gpioTrig<='0';
			ADCctr:=0;
		end if;

		--if ADCctr>=20 and ADCctr>40  then
			--ADC_DA<=to_unsigned(16383, 14);
		--else
			--ADC_DA<=to_unsigned(0,14);
		--end if;


		Wait for 2*dco_clk;
	end process ADC_A_gen;




end architecture;
		