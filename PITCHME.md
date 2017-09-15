# Criando um módulo em Perl6 sem saber Perl6

![Camelia »ö«](camelia.png)

São Paulo, 16/SET/2017 - GuruSP @ TOTVS

---

## Sobre mim

Paulo Henrique Rodrigues Pinheiro (paulohrpinheiro):

* https://about.me/paulohrpinheiro
* https://paulohrpinheiro.xyz
* https://www.twitter.com/paulohrpinheiro
* https://linkedin.com/in/paulohrpinheiro
* https://github.com/paulohrpinheiro

---

### A cara do Perl6

    ➜  ~ perl6
    > my @primes = ^∞ .grep: *.is-prime;
    [...]
    > say "1001ˢᵗ prime is @primes[1000]";
    1001ˢᵗ prime is 7927
    > my @p = 1,2,4,8...Inf
    [...]
    > @p[4..10]
    (16 32 64 128 256 512 1024)
    > (½ +1)²
    2.25

---

## Fazer o quê?

> Fuçar no Perl6, sem muita paciência.

Consttruir um módulo simples, e publicá-lo:

Brazilian::FederalDocuments

https://github.com/paulohrpinheiro/Brazilian-FederalDocuments

---

## Mão na massa

https://github.com/paulohrpinheiro/Brazilian-FederalDocuments

    ➜  Brazilian-FederalDocuments git:(master) tree
    .
    ├── lib
    │   └── Brazilian
    │       └── FederalDocuments.pm6
    ├── LICENSE
    ├── META6.json
    └── t
        └── 001_basic.t


---

## Links úteis

* https://perl6.org
* http://rakudo.org/
* http://greenteapress.com/wp/think-perl-6/
* http://perl6intro.com/
* https://learnxinyminutes.com/docs/perl6/

__OBRIGADO!!!__
