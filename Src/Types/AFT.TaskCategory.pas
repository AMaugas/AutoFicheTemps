unit AFT.TaskCategory;

interface

type
  TAftCategory = (                        //
    AFT_CATEGORY_ADMINISTRATIF,           //
    AFT_CATEGORY_VIE_ENTREPRISE,          //
    AFT_CATEGORY_BIBLIOGRAPHIE,           //
    AFT_CATEGORY_DEVELEPPEMENT_TECHNIQUE, //
    AFT_CATEGORY_TESTS_ET_VALIDATION,     //
    AFT_CATEGORY_REPPORTING               //
    );

  TAftCategoryConverter = class
    class function ToTypeString(const aCategory: TAftCategory): string;
    class function ToNiceString(const aCategory: TAftCategory): string;
    class function FromTypeString(const aType: string): TAftCategory;
  end;

implementation

uses
  System.Rtti;

const
  AFT_CATEGORY_STRING: array [TAftCategory] of string = ( //
    'Administratif',                                      //
    'Vie d'' entreprise',                                 //
    'Bibliographie',                                      //
    'Développement téchnique',                            //
    'Tests et validation',                                //
    'Repporting'                                          //
    );

  { TAftCategoryConverter }

class function TAftCategoryConverter.FromTypeString(const aType: string): TAftCategory;
var
  test: TObject;
begin
  Result := TRttiEnumerationType.GetValue<TAftCategory>(aType);
end;

class function TAftCategoryConverter.ToNiceString(const aCategory: TAftCategory): string;
begin
  Result := AFT_CATEGORY_STRING[aCategory];
end;

class function TAftCategoryConverter.ToTypeString(const aCategory: TAftCategory): string;
begin
  Result := TRttiEnumerationType.GetName<TAftCategory>(aCategory);
end;

end.
