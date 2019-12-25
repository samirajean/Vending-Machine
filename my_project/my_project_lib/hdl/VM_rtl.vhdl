--
-- VHDL Architecture my_project_lib.VM.rtl
--
-- Created:
--          by - Samirajean.UNKNOWN (SAMIRAJEANPC)
--          at - 13:26:49 05/11/2019
--
-- using Mentor Graphics HDL Designer(TM) 2007.1 (Build 19)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY VM IS
  port(cash: in std_logic_vector (7 downto 0);
  item: in std_logic_vector (1 downto 0);
  clk: in std_logic;
  cash_out: out std_logic_vector (7 downto 0);
  item_out: out std_logic_vector (1 downto 0);
  msg: out string(1 to 19) );
  
END ENTITY VM;

--
ARCHITECTURE rtl OF VM IS
signal cashin: unsigned (7 downto 0);
signal cashout: unsigned (7 downto 0);
signal item1stock: unsigned(7 downto 0);
signal item2stock: unsigned(7 downto 0);
signal item3stock: unsigned(7 downto 0);
BEGIN
  process(clk)
    begin
      cashin <= unsigned(cash);
      if rising_edge(clk) then 
        if item = "01" then 
          if item1stock > 0 then
            if cashin >= 1 then
              cashout <= cashin - 1;
              item_out <= item;
              msg <= "Succeeded";
              item1stock <= item1stock - 1;
            else
              msg <= "Enter the right amount";
            end if;
          else 
            msg <= "item is sold out";
          end  if;
        elsif item = "10" then
          if item2stock > 0 then
            if cashin >= 2 then
              cashout <= cashin - 2;
              item_out <= item;
              msg <= "Succeeded";
              item2stock <= item1stock - 1;
            else
              msg <= "Enter the right amount";
            end if;
          else 
            msg <= "item is sold out";
          end  if;
        elsif item = "11" then
          if item1stock > 0 then
            if cashin >= 5 then
              cashout <= cashin - 5;
              item_out <= item;
              msg <= "Succeeded";
              item3stock <= item1stock - 1;
            else
              msg <= "Enter the right amount";
            end if;
          else 
            msg <= "item is sold out";
          end  if;
        else 
          msg <= "Choose Item";
        end if;
      end if;
    end process;
    cash_out <= std_logic_vector(cashout);
    
  END ARCHITECTURE rtl;
  
  
  
  