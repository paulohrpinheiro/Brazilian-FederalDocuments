use v6.c;


unit module FederalDocuments;


class TooManyDigits is Exception {
    method message() {
        "The given document number has too many digits"
    }
}


class InvalidDocument is Exception {
    method message() {
        "The given document number is invalid"
    }
}


role Document {
    has Int $.number;
    has Bool $.is-valid = False;
    has Int @!weight-masc-first-digit;
    has Int @!weight-masc-second-digit;
}


class CPF does Document {
    submethod BUILD(Int :$!number) {
        @!weight-masc-first-digit  = <10 9 8 7 6 5 4 3 2>;
        @!weight-masc-second-digit = <11 10 9 8 7 6 5 4 3 2>;
    }
}


class CNPJ does Document {
    submethod BUILD(Int :$!number) {
        @!weight-masc-first-digit  = <5 4 3 2 9 8 7 6 5 4 3 2>;
        @!weight-masc-second-digit = <6 5 4 3 2 9 8 7 6 5 4 3 2>;
    }
}

