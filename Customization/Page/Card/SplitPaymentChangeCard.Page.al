page 50929 "Split Payment Change Card"
{
    PageType = ListPart;
    SourceTable = "Split Payment Change";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    Caption = 'Contract ID';
                    ToolTip = 'The ID of the contract associated with this split payment change.';
                }

                field("Split Payment Series"; Rec."Split Payment Series")
                {
                    ApplicationArea = All;
                    Caption = 'Split Payment Series';
                    ToolTip = 'The series of the split payment associated with this change.';

                    // Trasfer from Table Start
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PaymentMode2Rec: Record "Payment Mode2";
                        Selection: Page "Payment Mode2 List";
                    begin
                        // Ensure Contract ID is selected first
                        if Rec."Contract ID" = 0 then
                            Error('Please select a Contract ID first');

                        // Filter Payment Mode2 records based on Contract ID
                        PaymentMode2Rec.Reset();
                        PaymentMode2Rec.SetRange("Contract ID", Rec."Contract ID");
                        PaymentMode2Rec.SetFilter("Payment Status", '<> %1 & <> %2', PaymentMode2Rec."Payment Status"::Cancelled, PaymentMode2Rec."Payment Status"::Received);

                        Selection.LookupMode(true);
                        Selection.SetTableView(PaymentMode2Rec);

                        if Selection.RunModal() = ACTION::LookupOK then begin
                            Selection.SetSelectionFilter(PaymentMode2Rec);

                            if PaymentMode2Rec.FindFirst() then
                                Rec."Split Payment Series" := PaymentMode2Rec."Payment Series"; // Select only one value

                        end;
                    end;
                    // Trasfer from Table End
                }
                field("Secondary Item Type"; Rec."Secondary Item Type")
                {
                    ApplicationArea = All;
                    Caption = 'Secondary Item Type';
                    ToolTip = 'The type of secondary item associated with this split payment change.';

                    // Trasfer from Table Start
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        PaymentSchedule2Rec: Record "Payment Schedule2";
                        Selection: Page "Payment Schedule Grid";
                        SelectedPaymentSeries: Text[250];
                        TotalAmount: Decimal;
                        TotalVATAmount: Decimal;
                        TotalAmountInclVAT: Decimal;
                    begin
                        // First check if Contract ID is selected
                        if Rec."Contract ID" = 0 then
                            Error('Please select a Contract ID first');

                        // Filter Payment Mode2 records based on Contract ID
                        PaymentSchedule2Rec.Reset();
                        PaymentSchedule2Rec.SetRange("Contract ID", Rec."Contract ID");
                        PaymentSchedule2Rec.SetRange("Payment Series", Rec."Split Payment Series");

                        Selection.LookupMode(true);
                        Selection.SetTableView(PaymentSchedule2Rec);

                        if Selection.RunModal() = ACTION::LookupOK then begin
                            // Clear totals
                            Clear(TotalAmount);
                            Clear(TotalVATAmount);
                            Clear(TotalAmountInclVAT);
                            Clear(SelectedPaymentSeries);

                            Selection.SetSelectionFilter(PaymentSchedule2Rec);
                            if PaymentSchedule2Rec.FindSet() then begin
                                repeat
                                    // Add to payment series string
                                    if SelectedPaymentSeries <> '' then
                                        SelectedPaymentSeries := CopyStr(SelectedPaymentSeries, 1, StrLen(SelectedPaymentSeries)) + ',';
                                    SelectedPaymentSeries := CopyStr(SelectedPaymentSeries, 1, StrLen(SelectedPaymentSeries)) + PaymentSchedule2Rec."Secondary Item Type";

                                    // Sum up amounts
                                    TotalAmount += PaymentSchedule2Rec.Amount;
                                    TotalVATAmount += PaymentSchedule2Rec."VAT Amount";
                                    TotalAmountInclVAT += PaymentSchedule2Rec."Amount Including VAT";
                                until PaymentSchedule2Rec.Next() = 0;

                                // Set all values to the record
                                Rec."Secondary Item Type" := CopyStr(SelectedPaymentSeries, 1, StrLen(SelectedPaymentSeries));
                                Rec."Split Amount" := TotalAmount;
                                Rec."Split VAT Amount" := TotalVATAmount;
                                Rec."Split Amount Including VAT" := TotalAmountInclVAT;
                            end;
                        end;
                    end;
                    // Trasfer from Table End
                }
                field("Split Due Date"; Rec."Split Due Date")
                {
                    ApplicationArea = All;
                    Caption = 'Split Due Date';
                    ToolTip = 'The due date for the split payment change.';
                }
                field("Split Payment Mode"; Rec."Split Payment Mode")
                {
                    ApplicationArea = All;
                    Caption = 'Split Payment Mode';
                    ToolTip = 'The payment mode for the split payment change.';
                }

                field("Split Amount"; Rec."Split Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Split Amount';
                    ToolTip = 'The amount of the split payment change.';
                }

                field("Split VAT Amount"; Rec."Split VAT Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Split VAT Amount';
                    ToolTip = 'The VAT amount of the split payment change.';
                }

                field("Split Amount Including VAT"; Rec."Split Amount Including VAT")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Split Amount Including VAT';
                    ToolTip = 'The total amount including VAT for the split payment change.';
                }

                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'The unique entry number for the split payment change.';
                }

                field("Tenant ID"; Rec."Tenant ID")
                {
                    ApplicationArea = All;
                    Editable = false; // The ID is not editable since it's auto-incrementing
                    Lookup = true;
                    Visible = false;
                    Caption = 'Tenant ID';
                    ToolTip = 'The ID of the tenant associated with this split payment change.';
                }
            }
        }
    }

    procedure SetTenantID(pTenantID: Code[20])
    begin
        tenantID := pTenantID;
    end;

    procedure SetContractID(pContractID: Integer)
    begin
        ContractID := pContractID;
    end;


    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Tenant ID" := tenantID;
        Rec."Contract ID" := ContractID;
    end;

    var
        tenantID: Code[20];
        ContractID: Integer;

}