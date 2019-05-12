#include <stdio.h>
#include "lib.h"
#if CGI_VPN
#include "vpn.h"
#endif

int main()
{
    printf("main\n");
    fun_a();
#if CGI_VPN
    vpn_up();
#endif
    return 0;
}
