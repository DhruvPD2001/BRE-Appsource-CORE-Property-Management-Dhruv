page 50338 "Security Deposit List"
{
    PageType = List;
    SourceTable = "Security Deposit";
    ApplicationArea = All;
    Caption = 'Security Deposits';
    CardPageId = 50337;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Security Deposit ID"; Rec."Security Deposit ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unique identifier for the security deposit.';
                }

                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Identifier for the contract associated with the security deposit.';
                }

                field("Tenant Full Name"; Rec."Tenant Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Full name of the tenant associated with the security deposit.';
                }

                field("Contract Start Date"; Rec."Contract Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Start date of the contract associated with the security deposit.';
                }

                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'End date of the contract associated with the security deposit.';
                }

                field("Security Deposit Amount"; Rec."Security Deposit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount of the security deposit.';
                }

                field("New_Contract ID"; Rec."New_Contract ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Identifier for the new contract associated with the security deposit.';
                }

                field("New_Tenant Full Name"; Rec."New_Tenant Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Full name of the tenant associated with the new contract.';
                }

                field("New_Contract Start Date"; Rec."New_Contract Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Start date of the new contract associated with the security deposit.';
                }

                field("New_Contract End Date"; Rec."New_Contract End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'End date of the new contract associated with the security deposit.';
                }

                field("New_Security Deposit Amount"; Rec."New_Security Deposit Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount of the new security deposit.';
                }

                field("Adjusted amount"; Rec."Adjusted amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Amount adjusted for the security deposit.';
                }
            }
        }
    }


}
