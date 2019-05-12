####
all: app_server


server-y        := server
serverlib-y     :=

server-dirs := $(server-y) $(serverlib-y)
server-objs := $(patsubst %,%/built-in.o, $(server-y))
server-libs := $(patsubst %,%/lib.a, $(serverlib-y))
server-all  := $(server-objs) $(server-libs)

quiet_cmd_server = LD      $@
cmd_server = $(CC) $(LDFLAGS) -o $@                          \
             -Wl,--start-group $(server-libs) $(server-objs) -Wl,--end-group

app_server: $(server-all) FORCE
	+$(call if_changed,server)


$(sort $(server-all)): $(server-dirs) ;

PHONY += $(server-dirs)

$(server-dirs): prepare scripts
	$(Q)$(MAKE) $(build)=$@


CLEAN_FILES += app_server

clean-dirs      += $(addprefix _clean_, $(server-dirs))
##########
