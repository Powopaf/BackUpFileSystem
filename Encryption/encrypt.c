#include <stdio.h> 
#include <errno.h>
#include <string.h>
#include <stdlib.h>



int encrypt(char* path) {
    FILE* file = fopen(path, "r");
    FILE* fout = fopen("encrypt.bin", "w");
    
    if (file == NULL) {
        printf("%s", strerror(errno));
        return errno;
    }
    if (fout == NULL) {
        printf("%s", strerror(errno));
        return errno;
    }

    

    return EXIT_SUCCESS;
}
