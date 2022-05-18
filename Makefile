VERILOG = iverilog
TARGET = Prandom.vcd
TEMP = simple.vpp
$(TARGET) : simple.vvp
	vvp simple.vvp

simple.vvp: Prandom_tb.v Prandom.v
	$(VERILOG) -o simple.vvp Prandom_tb.v Prandom.v
clean:
	-del $(TARGET)
	-del $(TEMP)
