######
all:  app_client

client-y        := client custom/common/ui

client-dirs := $(client-y)
client-objs := $(patsubst %,%/built-in.o, $(client-y))
client-all  := $(client-objs)

quiet_cmd_client = LD      $@
cmd_client = $(CC) $(LDFLAGS) -o $@                          \
             -Wl,--start-group $(client-objs) -Wl,--end-group

app_client: $(client-all) FORCE
	+$(call if_changed,client)

$(sort $(client-all)): $(client-dirs) ;

PHONY += $(client-dirs)
$(client-dirs): prepare scripts
	$(Q)$(MAKE) $(build)=$@

CLEAN_FILES += app_client

clean-dirs      += $(addprefix _clean_, $(client-dirs))
##########
