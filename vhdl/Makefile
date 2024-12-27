GHDL = ghdl
SRC_FILES = top_level.vhdl testbench.vhdl
TESTBENCH = Top_Level_tb
all: run

analyze:
	@$(GHDL) -a $(SRC_FILES)


elaborate: analyze
	@$(GHDL) -e $(TESTBENCH)

run: elaborate
	@$(GHDL) -r $(TESTBENCH) --wave=$(TESTBENCH).ghw

clean:
	@rm $(TESTBENCH).ghw *.cf

