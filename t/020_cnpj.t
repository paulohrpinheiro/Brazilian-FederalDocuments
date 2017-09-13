use v6.c;
use Test;

use lib 'lib';

use Brazilian::FederalDocuments;


plan 4;


my $cnpj-da-presidencia = 394411000109;


lives-ok { FederalDocuments::CNPJ.new(number => $cnpj-da-presidencia) }, "Valid CNPJ as number";
lives-ok { FederalDocuments::CNPJ.new(number => "$cnpj-da-presidencia") }, "Valid CNPJ as string";

throws-like { FederalDocuments::CNPJ.new(number => $cnpj-da-presidencia + 1) }, FederalDocuments::InvalidDocument, "Invalid CNPJ as number";
throws-like { FederalDocuments::CNPJ.new(number => "{$cnpj-da-presidencia}9") }, FederalDocuments::InvalidDocument, "Invalid CNPJ as string";
