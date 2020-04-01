{******************************************************************************}
{ Projeto: Componente ACBrReinf                                                }
{  Biblioteca multiplataforma de componentes Delphi para envio de eventos do   }
{ Reinf                                                                        }

{ Direitos Autorais Reservados (c) 2017 Leivio Ramos de Fontenele              }
{                                                                              }

{ Colaboradores nesse arquivo:                                                 }

{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }


{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }

{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }

{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Leivio Ramos de Fontenele  -  leivio@yahoo.com.br                            }
{******************************************************************************}
{******************************************************************************
|* Historico
|*
|* 04/12/2017: Renato Rubinho
|*  - Implementados registros que faltavam e isoladas as respectivas classes
*******************************************************************************}

{$I ACBr.inc}

unit pcnReinfR9000;

interface

uses
  SysUtils, Classes, Contnrs,
  pcnConversao, pcnGerador, ACBrUtil,
  pcnCommonReinf, pcnConversaoReinf, pcnGeradorReinf;

type
  {Classes espec�ficas deste evento}

  { TinfoExclusao }

  TinfoExclusao = class(TObject)
  private
    FtpEvento: string;
    FnrRecEvt: string;
    FperApu: string;
  public
    property tpEvento: string read FtpEvento write FtpEvento;
    property nrRecEvt: string read FnrRecEvt write FnrRecEvt;
    property perApur: string read FperApu write FperApu;
  end;

  TevtExclusao = class(TReinfEvento) //Classe do elemento principal do XML do evento!
  private
    FIdeEvento: TIdeEvento;
    FideContri: TideContri;
    FinfoExclusao: TinfoExclusao;

    {Geradores espec�ficos desta classe}
    procedure GerarinfoExclusao;
  public
    constructor Create(AACBrReinf: TObject); override;
    destructor  Destroy; override;

    function GerarXML: Boolean; override;
    function LerArqIni(const AIniString: String): Boolean;

    property ideEvento: TIdeEvento read FIdeEvento write FIdeEvento;
    property ideContri: TideContri read FideContri write FideContri;
    property infoExclusao: TinfoExclusao read FinfoExclusao write FinfoExclusao;
  end;

  TR9000CollectionItem = class(TObject)
  private
    FTipoEvento: TTipoEvento;
    FevtExclusao: TevtExclusao;
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;

    property TipoEvento: TTipoEvento read FTipoEvento;
    property evtExclusao: TevtExclusao read FevtExclusao write FevtExclusao;
  end;

  TR9000Collection = class(TReinfCollection)
  private
    function GetItem(Index: Integer): TR9000CollectionItem;
    procedure SetItem(Index: Integer; Value: TR9000CollectionItem);
  public
    function Add: TR9000CollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TR9000CollectionItem;

    property Items[Index: Integer]: TR9000CollectionItem read GetItem write SetItem; default;
  end;

implementation

uses
  IniFiles,
  ACBrReinf, ACBrDFeUtil;

{ TR9000Collection }

function TR9000Collection.Add: TR9000CollectionItem;
begin
  Result := Self.New;
end;

function TR9000Collection.GetItem(Index: Integer): TR9000CollectionItem;
begin
  Result := TR9000CollectionItem(inherited GetItem(Index));
end;

function TR9000Collection.New: TR9000CollectionItem;
begin
  Result := TR9000CollectionItem.Create(FACBrReinf);
  Self.Add(Result);
end;

procedure TR9000Collection.SetItem(Index: Integer; Value: TR9000CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TR9000CollectionItem }

constructor TR9000CollectionItem.Create(AOwner: TComponent);
begin
  inherited Create;

  FTipoEvento := teR9000;
  FevtExclusao := TevtExclusao.Create(AOwner);
end;

destructor TR9000CollectionItem.Destroy;
begin
  inherited;

  FevtExclusao.Free;
end;

{ TevtExclusao }

constructor TevtExclusao.Create(AACBrReinf: TObject);
begin
  inherited Create(AACBrReinf);

  FideContri    := TideContri.create;
  FIdeEvento    := TIdeEvento2.create;
  FinfoExclusao := TinfoExclusao.Create;
end;

destructor TevtExclusao.Destroy;
begin
  FideContri.Free;
  FIdeEvento.Free;
  FinfoExclusao.Free;

  inherited;
end;

procedure TevtExclusao.GerarinfoExclusao;
begin
  Gerador.wGrupo('infoExclusao');

  Gerador.wCampo(tcStr, '', 'tpEvento', 6,  6, 1, FinfoExclusao.tpEvento);
  Gerador.wCampo(tcStr, '', 'nrRecEvt', 1, 52, 1, FinfoExclusao.nrRecEvt);
  Gerador.wCampo(tcStr, '', 'perApur',  7, 10, 1, FinfoExclusao.perApur);

  Gerador.wGrupo('/infoExclusao');
end;

function TevtExclusao.GerarXML: Boolean;
begin
  try
    Self.VersaoDF := TACBrReinf(FACBrReinf).Configuracoes.Geral.VersaoDF;

    Self.Id := GerarChaveReinf(now, self.ideContri.NrInsc, self.Sequencial);

    GerarCabecalho('evtExclusao');
    Gerador.wGrupo('evtExclusao id="' + Self.Id + '"');

    GerarIdeEvento(Self.IdeEvento);
    GerarideContri(Self.ideContri);

    GerarinfoExclusao;

    Gerador.wGrupo('/evtExclusao');

    GerarRodape;

    XML := Gerador.ArquivoFormatoXML;
//    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtExclusao');

//    Validar(schevtExclusao);
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '');
end;

function TevtExclusao.LerArqIni(const AIniString: String): Boolean;
var
  INIRec: TMemIniFile;
  Ok: Boolean;
  sSecao: String;
begin
  Result := True;

  INIRec := TMemIniFile.Create('');
  try
    LerIniArquivoOuString(AIniString, INIRec);

    with Self do
    begin
      sSecao := 'evtExclusao';
      Id         := INIRec.ReadString(sSecao, 'Id', '');
      Sequencial := INIRec.ReadInteger(sSecao, 'Sequencial', 0);

      sSecao := 'ideEvento';
      ideEvento.ProcEmi := StrToProcEmiReinf(Ok, INIRec.ReadString(sSecao, 'procEmi', '1'));
      ideEvento.VerProc := INIRec.ReadString(sSecao, 'verProc', EmptyStr);

      sSecao := 'ideContri';
      ideContri.OrgaoPublico := (TACBrReinf(FACBrReinf).Configuracoes.Geral.TipoContribuinte = tcOrgaoPublico);
      ideContri.TpInsc       := StrToTpInscricao(Ok, INIRec.ReadString(sSecao, 'tpInsc', '1'));
      ideContri.NrInsc       := INIRec.ReadString(sSecao, 'nrInsc', EmptyStr);

      sSecao := 'infoExclusao';
      infoExclusao.tpEvento := INIRec.ReadString(sSecao, 'tpEvento', EmptyStr);
      infoExclusao.nrRecEvt := INIRec.ReadString(sSecao, 'nrRecEvt', EmptyStr);
      infoExclusao.perApur  := INIRec.ReadString(sSecao, 'perApur', EmptyStr);
    end;

    GerarXML;
  finally
    INIRec.Free;
  end;
end;

end.
