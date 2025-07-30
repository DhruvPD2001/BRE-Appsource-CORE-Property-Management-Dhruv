page 50955 "Vendor Category Card"
{
    PageType = Card;
    SourceTable = "Vendor Category";
    ApplicationArea = All;
    Caption = 'Vendor Category Card';
    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Vendor Category Details';
                field("ID"; Rec."ID")
                {
                    ToolTip = 'The unique identifier for the vendor category.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vendor Category Type"; Rec."Vendor Category Type")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Category Name';
                    ToolTip = 'Enter the Vendor Categoryname.';
                    ShowMandatory = true;
                    NotBlank = true;
                }
            }
        }
    }
}
