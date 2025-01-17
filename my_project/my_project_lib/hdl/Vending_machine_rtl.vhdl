--
-- VHDL Architecture my_project_lib.Vending_machine.rtl
--
-- Created:
--          by - S_LAB203.UNKNOWN (LAB203_15)
--          at - 13:16:24 11/05/2019
--
-- using Mentor Graphics HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Vending_machine IS
  port(cash: in std_logic_vector (7 downto 0);
       itemin: in std_logic_vector (1 downto 0);
       clk: in std_logic;
       cashout: out std_logic_vector (7 downto 0);
       itemout: out std_logic_vector (1 downto 0);
       message: out string(1 to 60) );

END ENTITY Vending_machine;

--
ARCHITECTURE rtl OF Vending_machine IS
signal cin: unsigned (7 downto 0);
signal cout: unsigned (7 downto 0);
signal item1avaliable: unsigned(7 downto 0);
signal item2avaliable: unsigned(7 downto 0);
signal item3avaliable: unsigned(7 downto 0);
BEGIN
  process(clk)
    BEGIN
          if rising_edge(clk) then
            if itemin = "01" then
              if item1avaliable > 0 then
                if cin >= 1 then
                  cout <= cin - 1;
                  itemout <= itemin;
                  message <= "Your transaction iss completed";
                  item1avaliable <= item1avaliable - 1;
                else
                  message <= "ERROR !!! Enter correct money";
                end if;
            else 
            message <= "The Item Iss Outt Off Stock";
            end  if;
            elsif itemin = "10" then
               if item2avaliable > 0 then
                 if cin >= 2 then
                   cout <= cin - 2;
                   itemout <= itemin;
                   message <= "our transaction iss completed";
                   item2avaliable <= item2avaliable - 1;
                 else
                  message <= "ERROR !!! Enter correct money";
                 end if;
             else 
                 message <= "The Item Iss Outt Off Stock";
             end  if;
             elsif itemin = "11" then
                if item3avaliable > 0 then
                  if cin >= 5 then
                    cout <= cin - 5;
                    itemout <= itemin;
                    message <= "Your transaction iss completed";
                    item3avaliable <= item3avaliable - 1;
                  else
                    message <= "ERROR !!! Enter correct money";
                  end if;
              else 
                message <= "The Item Iss Outt Off Stock";
              end  if;
          end if;
        else
          message <= "Item not selected";
      end if;
    end process;
    cashout <= std_logic_vector(cout);

END ARCHITECTURE rtl;
