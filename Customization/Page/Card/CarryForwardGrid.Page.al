page 50130 "Carry Forward Grid"
{
    PageType = ListPart;
    ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "Carry Forward Grid";
    Caption = 'Carry Forward To';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the contract associated with the carry forward.';
                }
                field("New Contract ID"; Rec."New Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the new contract ID for the carry forward.';
                }
                field("Security Deposit"; Rec."Security Deposit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the security deposit amount for the carry forward.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the total amount for the carry forward.';
                }
            }
        }
    }

}