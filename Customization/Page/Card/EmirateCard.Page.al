page 50115 "Emirate Card"
{
    PageType = Card;
    SourceTable = Emirate;
    ApplicationArea = All;
    Caption = 'Emirate Card';
    // UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'Emirate Details';
                field("ID"; Rec."ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the unique identifier for the emirate.';
                }
                field("Sl No."; Rec."Sl No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the serial number of the emirate.';
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    ToolTip = 'Specifies the code of the country to which the emirate belongs.';
                }
                field("Emirate Name"; Rec."Emirate Name")
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                    ToolTip = 'Specifies the name of the emirate.';
                }
            }
        }
    }
}
