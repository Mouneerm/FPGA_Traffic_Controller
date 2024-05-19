library IEEE;
use IEEE.std_logic_1164.all;
use IEEE. numeric_std.all;

entity trafficlights is
	--generic(ClockFrequencyHz : integer);
	port (
		P : inout STD_logic; --P=1 1s when Pedestrian detected for more than 4 sensors (total 8)
		T5 : in STD_LOGIC; -- Timer for 5s
		T30 : in STD_LOGIC; -- Timer for 30s
		T15 : in STD_LOGIC; -- Timer for 15s
		T65 : in STD_LOGIC; -- Timer for 65s

		CLK : in STD_LOGIC; -- Clock
		SET : in STD_LOGIC; -- Set
		C : in STD_LOGIC; -- Car detector sensor
		E : in STO_LOGIC; -- Emergency Sensor
		N : in STD_LOGIC_VECTOR(1 downto 0); -- Pedestrian sensors

		MG : out STD_LOGIC; -- Main Green
		MA : out STD_LOGIC; -- Main Amber
		MR : out STD_LOGIC; -- Main Red
		SR : out STD_LOGIC; -- Side Red
		SG : out STD_LOGIC; -- Side Green
		SA : out STD_LOGIC; -- Side Amber
		PR : out STD_LOGIC; -- Pedestrian Red
		PG : out STD_LOGIC; -- Pedestrian Green
		Qp : out STD_LOGIC; -- States for Pedestrian
		Qt : out STD_LOGIC_VECTOR(2 downto 0) --States for vehicles
	);

end entity;

--}} End of automatically maintained section

architecture trafficlights of trafficlights is

	type state_traffic_lights is (S0, S1, S2, S3, S4); --Defining states for vehicles
	signal PS, NS : state_traffic_lights;
	
	type state_pedestrians is (SX, SY); --Defining states for Pedestrians
	signal PSP, NSP: state_pedestrians;

begin
	-- main code
	
	sync_proc : process (CLK, NS, SET) -- To set to initial state
	begin
		if (SET = '1') then
			PS <= SO;
			PSP <= SX;
		elsif (rising_edge(CLK)) then --Trigger states on rising clocks and if conditions are met
			PS <= NS;
			PSP <= NSP;
		end if;
	end process sync_proc;


	
	comb_proc_traffic_lights : process (PS, T5, T30, T15, P, C, E)

		-- process for all traffic lights and Pedestrians Lights
	begin
		MG <= '0'; --Setting all outputs
		MR <= '0';
		MA <= '0';
		SG <= '0';
		SA <= '0';
		SR <= '0';
		PR <= '0';
		PG <= '1';

		case PS is

			when S0 => 
				PR <= '1'; --Setting outputs for S0
				MG <= '1';
				SR <= '1';
				-- Setting conditions for next states based on state table
				-- PS is present State and NS is next State

				if ((T30 = '1') or (E = '1') or (P = '1')) then NS <= S1;
				elsif ((T30 = '0') and (E = '0') and (P = '0')) then NS <= S0;
				end if;

			when S1 => 

				PG <= '0';
				PR <= '1';
				MA <= '1';
				SR <= '1';
				if (T5 = '0') then NS <= S1;
				elsif (((T5 = '1') and (P = '0')) or ((T5 = '1') and (E = '1'))) then NS <= S2;
				elsif ((T5 = '1') and (E = '0') and (P = '1')) then NS <= S4;
				end if;
			when S2 => 
				PG <= '0';
				PR <= '1';
				MR <= '1';
				SG <= '1';
				if ((E = '1') or ((T30 = '0') and (C = '0') and (P = '0'))) then NS <= S2;
				elsif ((T30 = '1') or (E = '1') or (P = '1')) then NS <= S3;
				end if;

			when S3 => 
				PG <= '0';
				PR <= '1';
				MA <= '1';
				SR <= '1';

				if (( (T5 = '1') and (P = '0') and (E = '0') ) or ((T30 = '0') and (T15 = '0') and (C = '1') and (P = '0') and (E = '0'))) then NS <= SO;

				elsif (E = '1') then NS <= S2;

				elsif (((T5 = '0') and (C = '0') and (E = '0')) or ((T5 = '0') and (P = '1') and (E = '0'))
					or ((T15 = '1') and (T5 = '0') and (E = '0')) or ((T30 = '1') and (T5 = '0') and (E = '0')) ) then NS <= S3;

				elsif ((T5 = '1') and (P = '1') and (E = '0')) then NS <= S4;
				end if;

			when S4 => 
				PG <= '1';
				PR <= '0';
				MR <= '1';
				SR <= '1';
				if ((T15 = '1') or (E = '1')) then NS <= S3;
				elsif ((T15 = '0') and (E = '0')) then NS <= S4;
				end if;

		end case;
	end process comb_proc_traffic_lights;

	with PS select --Setting States based on their binary values
	Qt <= "000" when S0, 
	      "001" when S1, 
	      "010" when S2, 
	      "011" when S3, 
	      "100" when S4, 
	      "000" when others;

	comb_proc_pedestrians : process (PSP, N, T65, T15) -- Setting conditions for P to be 1
	
	begin
		P <= '0';
		case PSP is --PSP is Present State for pedestrians
			when SX => 
				Pe <= '0';
				if (((N = "00") or (N = "10")) and(T65 = '0')) then NSP <= SX;
				elsif (((N = "10") and (T65 = '1')) or (N = "01")) then NSP <= SY;
				end if;
			when SY => 
				P <= 'l';
				if (T15 = '0') then NSP <= SY; --NSP is next State for pedestrians
				elsif (TI5 = '1') then NSP <= SX;
				end if;
		end case;

	end process comb_proc_pedestrians;

	with PSP select
	Qp <= '0' when SX, --Setiing the states
	      '1' when SY, 
	      '0' when others;
end trafficlights;