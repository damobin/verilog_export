SRC     = ./src
TABLE   = ./table

C_DIR    = c_file
V_DIR    = v_file
TB_DIR   = tb_file
CFLAGSS = -g -l$VCS_HOME/linux/lib -I ./inc
CC      = vcs
TARGET  = simv

TYPE	= c
#<< all source file(*.c *.cc)
SOURCEC =  $(wildcard $(SRC)/$(C_DIR)/*.$(TYPE))

TYPEV	= v
#<< all source file(*.c *.cc)
SOURCEV  =  $(wildcard $(SRC)/$(V_DIR)/*.$(TYPEV))
SOURCETB =  $(wildcard $(SRC)/$(TB_DIR)/*.$(TYPEV))
SOURCEV +=  $(SOURCETB)


#<< all object file (*.o)
TABS   =  $(patsubst %.$(TYPEV),%.tab,$(SOURCETB))
TABS := $(notdir $(TABS))


.PHONY:all
all:$(TARGET)
	echo "complete"
	
$(TARGET):$(SOURCEC) $(SOURCEV) 
	echo $(TABS)
	$(CC) +v2k -R \
	-P $(TABLE)/$(TABS) \
	-P ${NV_HOME}/share/PLI/VCS/LINUX64/novas.tab ${NV_HOME}/share/PLI/VCS/LINUX64/pli.a \
	$^ \
	-CFLAGS "$(CFLAGSS)" \
	 +acc+3 -o $(TARGET)


.PHONY:rundebug
rundebug:
	mkdir -p debug
	cd debug; verdi +incdir+../tb \
			+incdir+../fsdb \
			+incdir+../code \
			../code/TOP.v -file ../flist/flist.f \
			-ssf ../fsdb/tb3.fsdb \
			


.PHONY:verdi	
verdi:
	verdi -ssf ./fsdb/tb.fsdb -top TOP&

.PHONY:clean
clean:
	rm ./simv ./debug ./csrc ./sim ./simv.daidir verdiLog *.log novas.* -rf
