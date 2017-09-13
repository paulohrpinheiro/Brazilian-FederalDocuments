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
    has $.number;
    has @!weight-masc-first-digit;
    has @!weight-masc-second-digit;

    method verify {
        if $!number.chars > @!weight-masc-second-digit.elems + 1 {
            FederalDocuments::TooManyDigits.new.throw
        }

        my $total-len = @!weight-masc-second-digit.elems + 1;
        my @digits = (("0" x ($total-len - $.number.chars)) ~ $.number).split(/\d/, :v, :skip-empty);

        my $first-digit  = sum(@digits Z* @!weight-masc-first-digit)  * 10 % 11;
        my $second-digit = sum(@digits Z* @!weight-masc-second-digit) * 10 % 11;

        if @digits[$total-len - 2] != $first-digit || @digits[$total-len - 1] != $second-digit {
            FederalDocuments::InvalidDocument.new.throw
        }
    }
}


class CPF does Document {
    submethod BUILD(:$!number) {
        @!weight-masc-first-digit  = <10 9 8 7 6 5 4 3 2>;
        @!weight-masc-second-digit = <11 10 9 8 7 6 5 4 3 2>;

        self.verify;
    }
}


class CNPJ does Document {
    submethod BUILD(:$!number) {
        @!weight-masc-first-digit  = <5 4 3 2 9 8 7 6 5 4 3 2>;
        @!weight-masc-second-digit = <6 5 4 3 2 9 8 7 6 5 4 3 2>;

        self.verify;
    }
}
