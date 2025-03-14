#include <stdio.h>
#include <miracl/miracl.h>

void rsa_test() {
    miracl *mip = mirsys(5000, 16);
    big p, q, n, e, d, m, c, decrypted;
    p = mirvar(0);
    q = mirvar(0);
    n = mirvar(0);
    e = mirvar(0);
    d = mirvar(0);
    m = mirvar(0);
    c = mirvar(0);
    decrypted = mirvar(0);

    // Generate two large primes p and q
    bigbits(256, p);
    bigbits(256, q);

    // Calculate n = p * q
    multiply(p, q, n);

    // Choose e
    convert(65537, e);

    // Calculate d
    xgcd(e, n, d, d, d);

    // Message to be encrypted
    cinstr(m, "1234567890ABCDEF");

    // Encrypt m
    powmod(m, e, n, c);

    // Decrypt c
    powmod(c, d, n, decrypted);

    // Output results
    printf("Original message: ");
    otnum(m, stdout);
    printf("Encrypted message: ");
    otnum(c, stdout);
    printf("Decrypted message: ");
    otnum(decrypted, stdout);

    // Clean up
    mirkill(p);
    mirkill(q);
    mirkill(n);
    mirkill(e);
    mirkill(d);
    mirkill(m);
    mirkill(c);
    mirkill(decrypted);
}

int main() {
    // Existing code...
    
    // Call the new RSA test function
    rsa_test();

    return 0;
}