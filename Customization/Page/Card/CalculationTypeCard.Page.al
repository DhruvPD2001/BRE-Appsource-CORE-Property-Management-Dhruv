page 50959 "Calculation Type Card"
{
    PageType = Card;
    SourceTable = "Calculation Type";
    ApplicationArea = All;
    Caption = 'Calculation Type Card';
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Calculation Type Details';
                field("ID"; Rec."ID")
                {
                    ToolTip = 'The unique identifier for the calculation type.';
                    ApplicationArea = All;
                    Editable = false; // The ID is not editable since it's auto-incrementing
                }
                field("Calculation Type"; Rec."Calculation Type")
                {
                    ApplicationArea = All;
                    Caption = 'Calculation Type';
                    ToolTip = 'Enter the Vendor Categoryname.';
                    ShowMandatory = true;
                    NotBlank = true;
                }
            }
        }
    }


}



