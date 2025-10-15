page 50125 "Adjustment Security Deposit"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Adjustment Security Deposit";
    Caption = 'Adjustment Security Deposit';

    layout
    {
        area(Content)
        {
            group(Group)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the unique identifier for the adjustment security deposit record.';
                }

                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the contract associated with the adjustment security deposit.';
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }

                field("Main Security Deposit"; Rec."Main Security Deposit")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    Visible = false;
                    ToolTip = 'Specifies the main security deposit associated with the contract.';
                }
                field("Security Deposit"; Rec."Security Deposit")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the security deposit amount associated with the contract.';
                }

                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the start date of the contract associated with the adjustment security deposit.';
                }

                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    ToolTip = 'Specifies the end date of the contract associated with the adjustment security deposit.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the current status of the adjustment security deposit, such as Open, Approved, or Closed.';

                }

                field("Security Amount Status"; Rec."Security Amount Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the status of the security amount, such as Adjust Installment or Termination Charges.';
                    trigger OnValidate()
                    begin
                        SetControlVisibility();
                        if ShowTerminationCharges then
                            FetchAdditionalChargesData();
                        CurrPage.Update();
                    end;
                }
            }
            group(Termination_Charges)
            {
                Visible = ShowTerminationCharges;
                part(TerminationChargesLines; "Termination Charges Sub Card")
                {
                    ApplicationArea = All;
                    SubPageLink = "Contract ID" = field("Contract ID");  // Changed from ID to Contract ID
                    UpdatePropagation = Both;
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ToolTip = 'Post the entry for the adjustment security deposit. This action creates a new security deposit entry based on the current record and validates required fields before posting.';
                ApplicationArea = All;
                Caption = 'Post Entry';
                Image = PostDocument;

                trigger OnAction()
                var
                    SecurityDepositEntry: Record "Security Deposit Entry";
                    terminationcharges: Record "Termination Charges Sub";
                    ExistingEntry: Record "Security Deposit Entry";
                    terminationamount: Decimal;
                begin
                    // Validate required fields
                    if Rec."Contract ID" = 0 then
                        Error('Contract ID must be specified');

                    // Check if entry already exists for this Security Deposit ID
                    ExistingEntry.SetRange("Security Deposit ID", Rec.ID);

                    if ExistingEntry.FindFirst() then begin
                        // Entry already exists - ask for confirmation
                        if Confirm('Entry already posted for this Security Deposit. Do you want to update the existing entry?', false) then begin
                            // Update existing entry
                            SecurityDepositEntry := ExistingEntry;
                            SecurityDepositEntry."Contract ID" := Rec."Contract ID";
                            SecurityDepositEntry."Main Security Deposit" := Rec."Main Security Deposit";
                            SecurityDepositEntry."Security Deposit" := Rec."Security Deposit";
                            SecurityDepositEntry."Start Date" := Rec."Contract Start Date";
                            SecurityDepositEntry."End Date" := Rec."Contract End Date";
                            SecurityDepositEntry.Status := Rec.Status;

                            // Clear and recalculate termination charges
                            terminationcharges.SetRange("Contract ID", Rec."Contract ID");
                            Clear(terminationamount);

                            if terminationcharges.FindSet() then begin
                                repeat
                                    terminationamount += terminationcharges."Amount Including VAT";
                                until terminationcharges.Next() = 0;

                                SecurityDepositEntry."Total Amount" := terminationamount;
                            end;

                            SecurityDepositEntry.Modify();
                            Message('Entry updated successfully!');
                        end else
                            exit;
                    end else begin
                        // Create new entry
                        SecurityDepositEntry.Init();
                        SecurityDepositEntry."Security Deposit ID" := Rec.ID;
                        SecurityDepositEntry."Contract ID" := Rec."Contract ID";
                        SecurityDepositEntry."Main Security Deposit" := Rec."Main Security Deposit";
                        SecurityDepositEntry."Security Deposit" := Rec."Security Deposit";
                        SecurityDepositEntry."Start Date" := Rec."Contract Start Date";
                        SecurityDepositEntry."End Date" := Rec."Contract End Date";
                        SecurityDepositEntry.Status := Rec.Status;
                        SecurityDepositEntry.Insert(true);

                        terminationcharges.SetRange("Contract ID", Rec."Contract ID");
                        if terminationcharges.FindSet() then begin
                            repeat
                                terminationamount += terminationcharges."Amount Including VAT";
                            until terminationcharges.Next() = 0;

                            SecurityDepositEntry."Total Amount" := terminationamount;
                            SecurityDepositEntry.Modify();
                        end;
                        Message('Entry posted successfully!');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            actionref(Post_; Post) { }
        }
    }
    var
        ShowTerminationCharges: Boolean;

    trigger OnAfterGetRecord()
    begin
        SetControlVisibility();
        if ShowTerminationCharges then
            FetchAdditionalChargesData();
    end;

    local procedure FetchAdditionalChargesData()
    var
        AdditionalCharges: Record "Additional Charges Sub";
        TerminationCharges: Record "Termination Charges Sub";
        FinalCalculation: Record "Final Calculation";
        NextEntryNo: Integer;
    begin
        if Rec."Contract ID" = 0 then
            exit;

        // Check if Final Calculation exists with same Contract ID
        FinalCalculation.SetRange("Contract ID", Rec."Contract ID");
        if FinalCalculation.IsEmpty() then
            exit;

        // Clear existing termination charges for this contract
        TerminationCharges.SetRange("Contract ID", Rec."Contract ID");
        TerminationCharges.DeleteAll();

        // Find the next available Entry No.
        if TerminationCharges.FindLast() then
            NextEntryNo := TerminationCharges."Entry No." + 1
        else
            NextEntryNo := 1; // If no records exist, start from 1

        // Copy data from Additional Charges to Termination Charges
        AdditionalCharges.SetRange("Contract ID", Rec."Contract ID");
        if AdditionalCharges.FindSet() then
            repeat
                TerminationCharges.Init();
                TerminationCharges."Entry No." := NextEntryNo; // Assign unique Entry No.
                TerminationCharges."Contract ID" := Rec."Contract ID";
                TerminationCharges."Secondary Item Type" := AdditionalCharges."Secondary Item Type";
                TerminationCharges.Amount := AdditionalCharges.Amount;
                TerminationCharges."VAT %" := AdditionalCharges."VAT %";
                TerminationCharges."VAT Amount" := AdditionalCharges."VAT Amount";
                TerminationCharges."Amount Including VAT" := AdditionalCharges."Amount Including VAT";
                TerminationCharges."Start Date" := AdditionalCharges."Start Date";
                TerminationCharges."End Date" := AdditionalCharges."End Date";
                TerminationCharges."Posted Invoice ID" := AdditionalCharges."Posted Invoice ID";

                TerminationCharges.Insert();
                NextEntryNo += 1; // Increment for the next record
            until AdditionalCharges.Next() = 0;
    end;

    local procedure SetControlVisibility()
    begin
        case Rec."Security Amount Status" of
            Rec."Security Amount Status"::"Termination Charges":
                begin
                    ShowTerminationCharges := true;

                    // Clear Adjust Installment fields
                    Rec."Payment Series" := '';
                    Rec.Amount := 0;
                    Rec."VAT Amount" := 0;
                    Rec."Amount Including VAT" := 0;
                    Rec."Due Date" := 0D;
                    Rec.Modify(false);
                end;
            else
                ShowTerminationCharges := false;
        end;
    end;

}
