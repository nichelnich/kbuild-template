#include <stdio.h>

void show_ui_version(void)
{
#ifdef CONFIG_UI_V_A
    printf("-------ui version is A\n");
#endif

#ifdef CONFIG_UI_V_B
    printf("---------ui version is B\n");
#endif
}
