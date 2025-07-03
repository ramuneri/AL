namespace DefaultPublisher.Akademija_3;

using Microsoft.Sales.Customer;

pageextension 72000 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('0.1) Labas Pasauli');
    end;
}