page 50110 "Property Type Card"
{
    PageType = Card;
    SourceTable = "Property Type";
    ApplicationArea = All;
    Caption = 'Property Type Card';
    // UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Property Type Details';
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'ID of the property type';
                }
                field("Classification Name"; Rec."Classification Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Name of the property classification';
                }
                field("Property Type"; Rec."Property Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Type of the property, e.g., Residential, Commercial';
                }
            }
        }
    }
}
