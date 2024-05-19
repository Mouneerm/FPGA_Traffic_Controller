library IEEE;
use IEEE.std_logic_1164.all;

entity trafficlights_top is
	port (
		SW : out STD_LOGIC_VECTOR(10 downto 0);
		LED : out STD_LOGIC_VECTOR(13 downto 0)
	);

end trafficlights_top;

architecture trafficlights_top of trafficlights_top is
	component trafficlights
		port (
			P : inout STD_logic; --P=1 is when Pedestrian detected for more than 4 sensors (total 8)
			T5 : in STD_LOGIC; -- Timer for 5s
			T30 : in STD_LOGIC; -- Timer for 30s
			T15 : in STO_LOGIC; -- Timer for 15s
			T65 : in STD_LOGIC; -- Timer for 65s
			
            CLK : in STD_LOGIC; -- Clock
			SET : in STD_LOGIC; -- Set
			C : in STD_LOGIC; -- Car detector sensor
			E : in STD_LOGIC; -- Emergency Sensor
			N : in STD_LOGIC_VECTOR(1 downto 0); -- Pedestrian sensors
			
            MG : out STD_LOGIC; -- Main Green
			MA : out STD_LOGIC; -- Main Amber
			MR : out STD_LOGIC; -- Main Red
			SR : out STD_LOGIC; -- Side Red
			SG : out STO_LOGIC; -- Side Green
			SA : out STD_LOGIC; -- Side Amber
			PR : out STD_LOGIC; -- Pedestrian Red
			PG : out STO_LOGIC; -- Pedestrian Green
			Qp : out STD_LOGIC; -- States for Pedestrian
			Qt : out STD_LOGIC_VECTOR(2 downto 0) --States for vehicles
		);
	end component;

	for all : trafficlights use entity work.trafficlights(trafficlights);

	begin
		-- enter your statements here --
		Labell : trafficlights
		port map(
			P => SW(0), 
			T5 => SW(1), 
			T36 => SW(2), 
			T1S => SW(3), 
			T65 => SW(4), 
			CLK => SW(5), 
			SET => SW(6), 
			C => SW(7), 
			E => Sw(8), 
			N(O) => SW(9), 
			N(1) => SW(10), 

			MG => LED(0), 
			MA => LED(1), 
			MR => LED(2), 
			SR => LED(3), 
			SG => LED(4), 
			SA => LED(5), 
			PR => LED(6), 
			PG => LED(7), 
			Qp => LED(8), 
			Qt(9) => LED(9), 
			Qt(1) => LED(10), 
			Qt(2) => LED(11), 
			P => led(13)
		);
end trafficlights_top;