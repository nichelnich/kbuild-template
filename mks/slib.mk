####
all:  liblog.so

liblog-y        := slib

liblog-dirs := $(liblog-y)
liblog-objs := $(patsubst %,%/built-in.o, $(liblog-y))
liblog-all  := $(liblog-objs)

#quiet_cmd_client = LD      $@
cmd_liblog = $(CC) -shared $(LDFLAGS) -o $@                          \
             -Wl,--start-group $(liblog-objs) -Wl,--end-group                     

liblog.so: $(liblog-all) FORCE
	+$(call if_changed,liblog)

$(sort $(liblog-all)): $(liblog-dirs) ;

$(liblog-dirs): prepare scripts
	$(Q)$(MAKE) $(build)=$@

CLEAN_FILES += liblog.so

clean-dirs      += $(addprefix _clean_, $(liblog-dirs))
##########
