use v6.c;


unit module FederalDocuments;


role Document {
    has $.number;
    has $!is_valid = False;
    has @!weight-masc-first-digit;
    has @!weight-masc-second-digit;

    method valid() {
        $!is_valid
    }

    method verify {
        return if $!number.chars > @!weight-masc-second-digit.elems + 1;

        my $total-len = @!weight-masc-second-digit.elems + 1;
        my @digits = (("0" x ($total-len - $.number.chars)) ~ $.number).split(/\d/, :v, :skip-empty);

        my $first-digit  = sum(@digits Z* @!weight-masc-first-digit)  * 10 % 11;
        my $second-digit = sum(@digits Z* @!weight-masc-second-digit) * 10 % 11;

        return if @digits[$total-len - 2] != $first-digit;
        return if @digits[$total-len - 1] != $second-digit;

        $!is_valid = True;
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
