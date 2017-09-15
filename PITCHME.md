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

Construir um módulo simples, e publicá-lo:

Brazilian::FederalDocuments

https://github.com/paulohrpinheiro/Brazilian-FederalDocuments

---

## Mão na massa

    ➜  Brazilian-FederalDocuments git:(master) tree
    .
    ├── lib
    │   └── Brazilian
    │       └── FederalDocuments.pm6
    ├── LICENSE
    ├── META6.json
    └── t
        ├── 001_basic.t
        ├── 010_cpf.t
        └── 020_cnpj.t

---

### t/010_cpf.t

    use v6.c;
    use Test;

    use lib 'lib';
    use Brazilian::FederalDocuments;

    plan 4;

    my $cpf-do-temer = 6931987887;

    ok FederalDocuments::CPF.new(number => $cpf-do-temer).is-valid, "Valid CPF as number";
    ok FederalDocuments::CPF.new(number => "$cpf-do-temer").is-valid, "Valid CPF as string";

    nok FederalDocuments::CPF.new(number => $cpf-do-temer + 1).is-valid, "Invalid CPF as number";
    nok FederalDocuments::CPF.new(number => "{$cpf-do-temer}9").is-valid, "Invalid CPF as string";

---

### Testando

    ➜  prove -e perl6 t 
    t/001_basic.t .. ok   
    t/010_cpf.t .... ok   
    t/020_cnpj.t ... ok   
    All tests successful.
    Files=3, Tests=10,  2 wallclock secs ( 0.03 usr  0.01 sys +  2.34 cusr  0.22 csys =  2.60 CPU)
    Result: PASS

---

### lib/Brazilian/FederalDocuments.pm6

    use v6.c;

    unit module FederalDocuments;

    role Document {
        has $.number;
        has $!valid = False;
        has @!weight-masc-first-digit;
        has @!weight-masc-second-digit;
        has @!digits;

        method is-valid() {
            $!valid
        }

---

        method verify {
            $!valid = False;

            return if $!number.chars > @!weight-masc-second-digit.elems + 1;

            my $total-len = @!weight-masc-second-digit.elems + 1;
            @!digits = (("0" x ($total-len - $.number.chars)) ~ $.number).split(/\d/, :v, :skip-empty);

            my $first-digit  = sum(@!digits Z* @!weight-masc-first-digit)  * 10 % 11;
            my $second-digit = sum(@!digits Z* @!weight-masc-second-digit) * 10 % 11;

            return if @!digits[$total-len - 2] != $first-digit;
            return if @!digits[$total-len - 1] != $second-digit;

            $!valid = True;
        }
    }

+++

## Links úteis

* https://perl6.org
* http://rakudo.org/
* https://github.com/tadzik/rakudobrew
* https://modules.perl6.org/
* http://greenteapress.com/wp/think-perl-6/
* http://perl6intro.com/
* https://learnxinyminutes.com/docs/perl6/

__OBRIGADO!!!__
