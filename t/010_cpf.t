use v6.c;
use Test;

use lib 'lib';

use Brazilian::FederalDocuments;


plan 4;


my $cpf-do-temer = 6931987887;


lives-ok { FederalDocuments::CPF.new(number => $cpf-do-temer) }, "Valid CPF as number";
lives-ok { FederalDocuments::CPF.new(number => "$cpf-do-temer") }, "Valid CPF as string";

throws-like { FederalDocuments::CPF.new(number => $cpf-do-temer + 1) }, FederalDocuments::InvalidDocument, "Invalid CPF as number";
throws-like { FederalDocuments::CPF.new(number => "{$cpf-do-temer}9") }, FederalDocuments::InvalidDocument, "Invalid CPF as string";
