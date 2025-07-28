page 50979 "Request Credit Note List"
{
    PageType = List;
    SourceTable = "Request Credit Note";
    ApplicationArea = All;
    Caption = 'Request Credit Note List';
    UsageCategory = Lists;
    CardPageId = "Request Credit Note Card";
    InsertAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.")
                {
                    ApplicationArea = All;
                    Caption = 'Request No.';
                    ToolTip = 'Specifies the unique identifier for the request credit note.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    Caption = 'Contract ID';
                    ToolTip = 'Specifies the unique identifier for the contract associated with the request credit note.';
                }
                field("Tenant No."; Rec."Tenant No.")
                {
                    ApplicationArea = All;
                    Caption = 'Tenant No.';
                    ToolTip = 'Specifies the unique identifier for the tenant associated with the request credit note.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                    Caption = 'Request Date';
                    ToolTip = 'Specifies the date when the request credit note was created.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Caption = 'Status';
                    ToolTip = 'Specifies the current status of the request credit note.';
                }
            }
        }
    }



}