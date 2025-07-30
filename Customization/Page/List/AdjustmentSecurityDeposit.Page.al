page 50126 "Adjustment_Security_Deposit"
{
    PageType = List;
    SourceTable = "Adjustment Security Deposit";
    ApplicationArea = All;
    Caption = 'Adjustment Security Deposit';
    UsageCategory = Lists;
    CardPageId = 50125;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    ToolTip = 'The unique identifier for the adjustment security deposit entry.';
                }
                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'The unique identifier for the tenancy contract associated with this adjustment.';
                }
                field("Security Deposit"; Rec."Security Deposit")
                {
                    ApplicationArea = All;
                    ToolTip = 'The security deposit amount associated with the adjustment.';
                }

                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The start date of the tenancy contract associated with this adjustment.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The end date of the tenancy contract associated with this adjustment.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'The current status of the adjustment security deposit.';
                }
                field("Security Amount Status"; Rec."Security Amount Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'The status of the security amount associated with the adjustment.';
                }
            }
        }
    }
}
