use v6.c;
use Test;

use lib 'lib';

use Brazilian::FederalDocuments;

plan 4;


my $cpf = FederalDocuments::CPF.new;

ok $cpf ~~ FederalDocuments::Document;
nok $cpf.is-valid;


my $cnpj = FederalDocuments::CNPJ.new;

ok $cnpj ~~ FederalDocuments::Document;
nok $cpf.is-valid;
