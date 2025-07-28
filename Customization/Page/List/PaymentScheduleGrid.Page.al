#pragma warning disable AW0006
page 50925 "Payment Schedule Grid"
#pragma warning restore AW0006
{
    PageType = List;
    SourceTable = "Payment Schedule2";
    ApplicationArea = All;
    Caption = 'Payment Schedule Grid List';
    CardPageId = 50922;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payment Series"; Rec."Payment Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'The series of the payment schedule.';
                }
                field("Secondary Item Type"; Rec."Secondary Item Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'The type of the secondary item associated with the payment schedule.';
                }
                field("Amount"; Rec."Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'The amount of the payment schedule.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'The VAT amount associated with the payment schedule.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ApplicationArea = All;
                    ToolTip = 'The total amount including VAT for the payment schedule.';
                }
            }
        }
    }

}
