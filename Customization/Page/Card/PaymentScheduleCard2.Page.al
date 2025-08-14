page 50922 "Payment Schedule Card2"
{
    PageType = ListPart;
    SourceTable = "Payment Schedule2";
    ApplicationArea = All;
    Caption = 'Payment Schedule Details';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Secondary Item Type"; Rec."Secondary Item Type")
                {
                    ApplicationArea = All;
                    Caption = 'Item Types';
                    Editable = false;
                    ToolTip = 'The type of secondary item associated with this payment schedule.';
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Amount';
                    ToolTip = 'The amount for the payment schedule.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'VAT Amount';
                    ToolTip = 'The VAT amount for the payment schedule.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Amount Including VAT';
                    ToolTip = 'The amount including VAT for the payment schedule.';
                }

                field("Installment Start Date"; Rec."Installment Start Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Installment Start Date';
                    ToolTip = 'The start date of the installment for this payment schedule.';
                }

                field("Installment End Date"; Rec."Installment End Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Installment End Date';
                    ToolTip = 'The end date of the installment for this payment schedule.';
                }

                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Due Date';
                    ToolTip = 'The due date for the payment schedule.';
                }

                field("Installment No."; Rec."Installment No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Installment No.';
                    ToolTip = 'The installment number for this payment schedule.';
                }

                field("Payment Series"; Rec."Payment Series")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    Caption = 'Payment Series';
                    ToolTip = 'The series of the payment associated with this payment schedule.';
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    Caption = 'Tenant Name';
                    ToolTip = 'The name of the tenant associated with this payment schedule.';
                }

                field("Tenant ID"; Rec."Tenant ID")
                {
                    ApplicationArea = All;
                    Editable = false; // The ID is not editable since it's auto-incrementing
                    Lookup = true;
                    Visible = false;
                    Caption = 'Tenant ID';
                    ToolTip = 'The ID of the tenant associated with this payment schedule.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                    Caption = 'Contract ID';
                    ToolTip = 'The ID of the contract associated with this payment schedule.';
                }
                field(Invoiced; Rec.Invoiced)
                {
                    ApplicationArea = All;
                    Caption = 'Invoiced';
                    Editable = InvoicedField;
                    ToolTip = 'Indicates whether the payment schedule has been invoiced.';
                }
                field("Invoice ID"; Rec."Invoice ID")
                {
                    ApplicationArea = All;
                    Caption = 'Invoice ID';
                    ToolTip = 'The ID of the invoice associated with this payment schedule.';
                    Editable = InvoicedField;
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Status';
                    ToolTip = 'The status of the contract associated with this payment schedule.';
                    Editable = false;
                    Visible = false;

                }
                field("Overdue Invoice"; Rec."Overdue Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'Overdue Invoice';
                    ToolTip = 'Indicates whether the invoice is overdue.';
                    Editable = false;
                    Visible = false;
                }
                field("Property ID"; Rec."Property ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The ID of the property associated with this payment schedule.';
                    Visible = false;
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The number of days for the payment schedule.';
                    Visible = false;
                }
                field("Workflow frequency date"; Rec."Workflow frequency date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The date for the workflow frequency associated with this payment schedule.';
                    Visible = false;
                }
                field("Contract start date"; Rec."Contract start date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'The start date of the contract associated with this payment schedule.';
                    Visible = false;
                }
                field("VAT%"; Rec."VAT%")
                {
                    ApplicationArea = All;
                    Caption = 'VAT%';
                    Editable = false;
                    ToolTip = 'The VAT percentage for the payment schedule.';
                    Visible = false;
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'The status of the payment associated with this payment schedule.';
                }
                field("Payment Received Date"; Rec."Payment Recieved Date")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Received Date';
                    Editable = false;
                    ToolTip = 'The date when the payment was received for this payment schedule.';
                    Visible = false;
                }
                field("Property Classification"; Rec."Property Classification")
                {
                    ApplicationArea = All;
                    Caption = 'Property Classification';
                    Editable = false;
                    Visible = false;
                    ToolTip = 'The classification of the property associated with this payment schedule.';
                }

                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = All;
                    Caption = 'Payment Mode';
                    Editable = false;
                    ToolTip = 'The mode of payment for this payment schedule.';
                    Visible = false;
                }
                field("Cheque Number"; Rec."Cheque Number")
                {
                    ApplicationArea = All;
                    Caption = 'Cheque Number';
                    Editable = false;
                    ToolTip = 'The cheque number for this payment schedule.';
                    Visible = false;
                }
                field("Credit Note No."; Rec."Credit Note No.")
                {
                    ApplicationArea = All;
                    Caption = '"Credit Note No."';
                    Editable = false;
                    ToolTip = 'The credit note number associated with this payment schedule.';
                    Visible = false;
                }

                field("Credit Note Amount"; Rec."Credit Note Amount")
                {
                    ApplicationArea = All;
                    Caption = '"Credit Note Amount"';
                    Editable = false;
                    ToolTip = 'The amount of the credit note associated with this payment schedule.';
                    Visible = false;
                }

                field("Final Rent Amount"; Rec."Final Rent Amount")
                {
                    ApplicationArea = All;
                    Caption = '"Final Rent Amount"';
                    Editable = false;
                    ToolTip = 'The final rent amount after adjustments for this payment schedule.';
                    Visible = false;
                }
                field("Final RentAmountIncludingVAT"; Rec."Final RentAmountIncludingVAT")
                {
                    ApplicationArea = All;
                    Caption = '"Final Rent Amount Including VAT"';
                    Editable = false;
                    ToolTip = 'The final rent amount including VAT for this payment schedule.';
                    Visible = false;
                }
            }
        }
    }
    procedure NotAccessInvoicedFieldFinanceManager(): Boolean
    var
        UserPersonalization1: Record "User Personalization";
    begin

        if UserPersonalization1.Get(UserSecurityId()) then
            case UserPersonalization1."Profile ID" of
                'PROPERTY MANAGER':
                    exit(false);
                'LEASE_MANAGER':
                    exit(false);
                'finance manager':
                    exit(true);
            end;

        exit(false);
    end;

    trigger OnAfterGetRecord()
    var
        PaymentSchedule: Record "Payment Schedule";
        workflowfrequency: Record "Workflow Frequency PR";
        TempDueDate: Date;
        Requestcreditnotegrid: Record "Request Credit Note Grid";

    begin
        InvoicedField := NotAccessInvoicedFieldFinanceManager();

        if PaymentSchedule.Get(Rec."Contract ID") then
            Rec."Contract start date" := PaymentSchedule."Contract Start date";

        workflowfrequency.SetRange("Property ID", Rec."Property ID");
        workflowfrequency.SetRange(Workflow, workflowfrequency.Workflow::Invoice);
        if workflowfrequency.FindFirst() then
            Rec."No of Days" := workflowfrequency."No. of Days";

        TempDueDate := Rec."Due Date";

        if TempDueDate <> 0D then begin
            if Rec."No of Days" = 0 then
                Rec."Workflow frequency date" := TempDueDate
            else
                Rec."Workflow frequency date" := CalcDate('-' + Format(Rec."No of Days") + 'D', TempDueDate);
        end else
            Rec."Workflow frequency date" := 0D; // or skip, or raise a warning

        // Rec."Final Rent Amount" := Rec."Amount" - Rec."Credit Note Amount";
        // Rec."Final RentAmountIncludingVAT" := Rec."Final Rent Amount" + (Rec."Final Rent Amount" * Rec."VAT%") / 100;


        Rec."Final Rent Amount" := Rec."Amount" - Rec."Credit Note Amount";
        Rec."Final RentAmountIncludingVAT" := Rec."Final Rent Amount" + (Rec."Final Rent Amount" * Rec."VAT%") / 100;
        //    Round("Final Rent Amount" + ("Final Rent Amount" * "VAT%") / 100, 0.01);

        Rec.Modify();
    end;

    var
        InvoicedField: Boolean;

}