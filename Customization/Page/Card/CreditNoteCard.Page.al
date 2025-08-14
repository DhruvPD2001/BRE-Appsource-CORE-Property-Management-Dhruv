page 50966 "Credit Note Card"
{
    PageType = Card;
    SourceTable = "Credit Note";
    ApplicationArea = All;
    Caption = 'Credit Note Card';
    layout
    {
        area(content)
        {
            group("Contract Details")
            {
                field("Credit Note Type"; Rec."Credit Note Type")
                {
                    ApplicationArea = All;
                    Caption = 'Credit Note Type';
                    ToolTip = 'Enter the Credit Note Type.';
                    Editable = false;
                }
                field("ID"; Rec."ID")
                {
                    ToolTip = 'The unique identifier for the credit note.';
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Credit Note No."; Rec."Credit Note No.")
                {
                    ToolTip = 'The unique number assigned to the credit note.';
                    ApplicationArea = All;
                }
                field("FC ID"; Rec."FC ID")
                {
                    ToolTip = 'The unique identifier for the final calculation associated with the credit note.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    Lookup = true;
                    TableRelation = "Final Calculation"."Contract ID";
                    ToolTip = 'The unique identifier for the contract associated with the credit note.';
                    trigger OnValidate()
                    var
                        finalcalculation: Record "Final Calculation";
                        creditnote: Record "Credit Note";
                    begin
                        creditnote.Reset();
                        creditnote.SetRange("Contract ID", Rec."Contract ID");
                        if not creditnote.IsEmpty() then
                            Error('This Contract ID %1 is already used in another record.', Rec."Contract ID");
                        finalcalculation.SetRange("Contract ID", Rec."Contract ID");
                        if finalcalculation.FindFirst() then begin
                            Rec."Credit Note Type" := Rec."Credit Note Type"::"Termination Credit Note";
                            Rec."Contract Start Date" := finalcalculation."Contract Start Date";
                            Rec."Contract End Date" := finalcalculation."Contract End Date";
                            Rec."Unit Type" := finalcalculation."Unit Type";
                            Rec."Contract Amount" := finalcalculation."Contract Amount";
                            Rec."Tenant ID" := finalcalculation."Tenant ID";
                            Rec."Tenant Name" := finalcalculation."Tenant Name";
                            Rec."Tenant Email" := finalcalculation."Tenant Email";
                            Rec."FC ID" := finalcalculation."FC ID";
                            BillingCalculationSub();
                        end else begin
                            Rec."Credit Note Type" := Rec."Credit Note Type"::"Termination Credit Note";
                            Rec."Contract Start Date" := 0D;
                            Rec."Contract End Date" := 0D;
                            Rec."Unit Type" := '';
                            Rec."Contract Amount" := 0;
                            Rec."Tenant ID" := '';
                            Rec."Tenant Name" := '';
                            Rec."Tenant Email" := '';
                            Rec."FC ID" := 0;
                        end;
                    end;
                }
                field("Credit Note Document"; Rec."Credit Note Document")
                {
                    ToolTip = 'The document associated with the credit note.';
                    ApplicationArea = All;
                    Caption = 'Credit Note Document';
                    DrillDown = true;
                    Editable = false;
                    trigger OnDrillDown()
                    var
                        FileURL: Text;
                    begin
                        FileURL := Rec."Credit Note URL";
                        if FileURL = '' then
                            Error('No document is available to view.');
                        OpenFileInBrowser(FileURL);
                    end;
                }
                field("Credit Note URL"; Rec."Credit Note URL")
                {
                    ToolTip = 'The URL of the credit note document.';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
                }
                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Start Date';
                    ToolTip = 'Enter the Contract Start Date.';
                    Editable = false;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    Caption = 'Contract End Date';
                    ToolTip = 'Enter the Contract End Date.';
                    Editable = false;
                }
                field("Unit Type"; Rec."Unit Type")
                {
                    ApplicationArea = All;
                    Caption = 'Unit Type';
                    ToolTip = 'Enter the Unit Type.';
                    Editable = false;
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Contract Amount';
                    ToolTip = 'Enter the Contract Amount.';
                    Editable = false;
                }
                field("Status"; Rec."Status")
                {
                    ToolTip = 'The status of the credit note.';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("Customer Details")
            {
                field("Tenant ID"; Rec."Tenant ID")
                {
                    ToolTip = 'The unique identifier for the tenant associated with the credit note.';
                    ApplicationArea = All;
                    Caption = 'Tenant ID';
                    Editable = false;
                }
                field("Tenant Email"; Rec."Tenant Email")
                {
                    ToolTip = 'The email address of the tenant associated with the credit note.';
                    ApplicationArea = All;
                    Caption = 'Tenant Email';
                    Editable = false;
                }
                field("Tenant Name"; Rec."Tenant Name")
                {
                    ToolTip = 'The name of the tenant associated with the credit note.';
                    ApplicationArea = All;
                    Caption = 'Tenant Name';
                    Editable = false;
                }
            }
            field("Reason for Rejection"; Rec."Reason for Rejection")
            {
                ToolTip = 'The reason for rejection of the credit note.';
                Caption = 'Reason for Rejection';
                Editable = false;
            }
            group("Billing-Calculation")
            {
                part("Billing-Calculations"; "Billing Calculation CN Card")
                {
                    SubPageLink = "Contract ID" = FIELD("Contract ID");
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CreditNote)
            {
                ToolTip = 'Create a credit note for the selected contract.';
                ApplicationArea = All;
                Caption = 'Credit Note Approval';
                Image = PostDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Enabled = Rec.Status = Rec.Status::Pending;
                trigger OnAction()
                var
                    ApprovalCreditNote: Record "Credit Note Approval";
                    CreditNote: Record "Credit Note";
                    billingcalculation: Record "Billing Calculation CN";
                    creditnoteamount: Decimal;
                begin
                    if Rec."Contract ID" = 0 then
                        Error('Contract ID must be specified');
                    if not CreditNote.Get(Rec."ID") then
                        Error('Credit Note record not found.');
                    ApprovalCreditNote.SetRange("Contract ID", Rec."Contract ID");
                    if ApprovalCreditNote.FindSet() then begin
                        ApprovalCreditNote."ID" := CreditNote."ID";
                        ApprovalCreditNote."FC ID" := CreditNote."FC ID";
                        ApprovalCreditNote."Contract ID" := CreditNote."Contract ID";
                        ApprovalCreditNote."Tenant ID" := CreditNote."Tenant ID";
                        ApprovalCreditNote."Status" := CreditNote."Status";
                        ApprovalCreditNote."Contract Start Date" := CreditNote."Contract Start Date";
                        ApprovalCreditNote."Contract End Date" := CreditNote."Contract End Date";
                        ApprovalCreditNote."Tenant Name" := CreditNote."Tenant Name";
                        ApprovalCreditNote."Credit Note Type" := CreditNote."Credit Note Type"::"Termination Credit Note";
                        ApprovalCreditNote.Modify();
                        billingcalculation.SetRange("Contract ID", Rec."Contract ID");
                        if billingcalculation.FindSet() then begin
                            repeat
                                creditnoteamount += billingcalculation."Amount Including VAT";
                            until billingcalculation.Next() = 0;
                            ApprovalCreditNote."Credit Note Amount" := creditnoteamount;
                            ApprovalCreditNote.Modify();
                        end;
                        Message('Approval Request Modified successfully!');
                    end else begin
                        ApprovalCreditNote.Init();
                        ApprovalCreditNote."ID" := CreditNote."ID";
                        ApprovalCreditNote."FC ID" := CreditNote."FC ID";
                        ApprovalCreditNote."Contract ID" := CreditNote."Contract ID";
                        ApprovalCreditNote."Tenant ID" := CreditNote."Tenant ID";
                        ApprovalCreditNote."Status" := CreditNote."Status";
                        ApprovalCreditNote."Contract Start Date" := CreditNote."Contract Start Date";
                        ApprovalCreditNote."Contract End Date" := CreditNote."Contract End Date";
                        ApprovalCreditNote."Tenant Name" := CreditNote."Tenant Name";
                        ApprovalCreditNote."Credit Note Type" := CreditNote."Credit Note Type"::"Termination Credit Note";
                        ApprovalCreditNote.Insert(true);
                        billingcalculation.SetRange("Contract ID", Rec."Contract ID");
                        if billingcalculation.FindSet() then begin
                            repeat
                                creditnoteamount += billingcalculation."Amount Including VAT";
                            until billingcalculation.Next() = 0;
                            ApprovalCreditNote."Credit Note Amount" := creditnoteamount;
                            ApprovalCreditNote.Modify();
                        end;
                        Message('Approval Request Sent successfully!');
                    end;
                end;
            }
            action("Create Credit Note")
            {
                ToolTip = 'Create a credit note document for the selected billing calculation.';
                Caption = 'Credit Note Document';
                ApplicationArea = All;
                Image = NewDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    FinalCalculation: Record "Final Calculation";
                    Billingcalculationgrid: Record "Final Billing Calculation Grid";
                    creditmemo: Record "Credit Note";

                    azureBlobUploader: Codeunit "Azure AD Blob Storage";
                    TempBlob: Codeunit "Temp Blob";
                    RecRef: RecordRef;
                    fileName: Text;
                    uploadResult: Text;
                    folderName: Text;
                    inStream: InStream;
                    ReportID: Integer;
                    OutStream: OutStream;

                begin
                    ReportID := 50117;
                    creditmemo.Reset();
                    creditmemo.SetRange("Contract ID", Rec."Contract ID");
                    creditmemo.SetRange("FC ID", Rec."FC ID");
                    RecRef.GetTable(creditmemo);
                    RecRef.GetTable(Rec);
                    TempBlob.CreateOutStream(OutStream);
                    Report.SaveAs(ReportID, '', ReportFormat::Pdf, OutStream, RecRef);
                    TempBlob.CreateInStream(InStream);
                    FileName := 'CreditNote' + Format(Rec."ID") + '.pdf';
                    folderName := 'Payment Receipt';
                    uploadResult := azureBlobUploader.UploadDocumentToBlob(inStream, fileName, folderName);
                    if fileName <> '' then begin
                        Rec."Credit Note Document" := CopyStr(fileName, 1, StrLen(fileName));
                        Rec."Credit Note URL" := CopyStr(uploadResult, 1, StrLen(uploadResult));
                        Rec.Modify();
                        Message('File uploaded successfully: %1', fileName);
                    end;
                    Rec.Modify();
                    Billingcalculationgrid.SetRange("Contract ID", Rec."Contract ID");
                    if Billingcalculationgrid.FindSet() then begin
                        Billingcalculationgrid."Credit Note Document" := CopyStr(Rec."Credit Note Document", 1, StrLen(Rec."Credit Note Document"));
                        Billingcalculationgrid."Credit Note Document URL" := CopyStr(Rec."Credit Note URL", 1, StrLen(Rec."Credit Note URL"));
                        Billingcalculationgrid.Modify(true);
                    end else
                        Error('No Final Calculation record found for Contract ID %1', FinalCalculation."Contract ID");
                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    var
        CreditNoteRec: Record "Credit Note";
        NextID: Integer;
    begin
        if Rec.ID = 0 then begin
            if CreditNoteRec.FindLast() then
                NextID := CreditNoteRec.ID + 1
            else
                NextID := 1;
            Rec.ID := NextID;
            Rec."Credit Note No." := 'CN_' + CopyStr('00000' + Format(NextID), StrLen('00000' + Format(NextID)) - 4, 5);
        end;
    end;

    procedure BillingCalculationSub()
    var
        BillingCalculationSubCN: Record "Billing Calculation CN";
        BillingCalculationSubFC: Record "Final Billing Calculation Grid";
    begin
        BillingCalculationSubCN.SetRange("Contract ID", Rec."Contract ID");
        if BillingCalculationSubCN.FindSet() then
            BillingCalculationSubCN.DeleteAll();
        BillingCalculationSubFC.SetRange("Contract ID", Rec."Contract ID");
        if BillingCalculationSubFC.FindSet() then
            repeat
                if BillingCalculationSubFC."DifferenceAmount" > 0 then begin
                    BillingCalculationSubCN.Init();
                    BillingCalculationSubCN."Credit Note ID" := Rec."ID";
                    BillingCalculationSubCN."Contract ID" := Rec."Contract ID";
                    BillingCalculationSubCN."Tenant ID" := Rec."Tenant ID";
                    BillingCalculationSubCN."Item" := BillingCalculationSubFC."RevenueDescription";
                    BillingCalculationSubCN."Amount" := BillingCalculationSubFC."DifferenceAmount";
                    BillingCalculationSubCN."VAT Amount" := BillingCalculationSubFC."DifferenceVAT";
                    BillingCalculationSubCN."Amount Including VAT" := BillingCalculationSubFC."DifferenceAmountInclVAT";
                    BillingCalculationSubCN.Insert();
                    Clear(BillingCalculationSubCN);
                end;
            until BillingCalculationSubFC.Next() = 0;
    end;

    procedure ShowCreditNoteInBillingCalculationGrid()
    var
        Billingcalculationgrid: Record "Final Billing Calculation Grid";
    begin
        Billingcalculationgrid.SetRange("Contract ID", Rec."Contract ID");
        if Billingcalculationgrid.FindSet() then begin
            Billingcalculationgrid."Credit Note ID" := Rec."Credit Note No.";
            Billingcalculationgrid.Modify();
        end;
    end;

    procedure ShowCreditNoteInBillingCalculationSubGrid()
    var
        Billingcalculationgrid: Record "Billing Calculation CN";
    begin
        Billingcalculationgrid.SetRange("Contract ID", Rec."Contract ID");
        if Billingcalculationgrid.FindSet() then
            repeat
                Billingcalculationgrid."Credit Note ID" := Rec.ID;
                Billingcalculationgrid.Modify();
            until Billingcalculationgrid.Next() = 0;
    end;

    procedure OpenFileInBrowser(URL: Text)
    begin
        if URL <> '' then
            Hyperlink(URL)
        else
            Error('The file URL is invalid.');
    end;

    trigger OnAfterGetRecord()
    var
    begin
        ShowCreditNoteInBillingCalculationGrid();
        ShowCreditNoteInBillingCalculationSubGrid();
    end;
}