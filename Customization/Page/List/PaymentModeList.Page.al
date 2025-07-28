page 50926 "Payment Mode List"
{
    PageType = List;
    SourceTable = "Payment Mode";
    ApplicationArea = All;
    Caption = 'Payment Mode List';
    UsageCategory = Lists;
    CardPageId = 50927;


    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Contract ID"; Rec."Contract ID")
                {
                    ApplicationArea = All;
                    Caption = 'Contract_ID';
                    ToolTip = 'The ID of the contract associated with the payment mode.';
                }

                field("Tenant ID"; Rec."Tenant ID")
                {
                    ApplicationArea = All;
                    Caption = 'Tenant ID';
                    ToolTip = 'The ID of the tenant associated with the payment mode.';
                }



            }
        }
    }

}
