ˆM
dF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Controllers\AccountController.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Controllers *
{ 
public 

class 
AccountController "
:# $

Controller% /
{ 
private 
readonly 
IUserApiClient '
_userApiClient( 6
;6 7
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
AccountController  
(  !
IUserApiClient! /
userApiClient0 =
,= >
IConfiguration 
configuration (
)( )
{ 	
_userApiClient 
= 
userApiClient *
;* +
_configuration 
= 
configuration *
;* +
} 	
[!! 	
HttpGet!!	 
]!! 
public"" 
IActionResult"" 
Login"" "
(""" #
)""# $
{## 	
return$$ 
View$$ 
($$ 
)$$ 
;$$ 
}%% 	
['' 	
HttpPost''	 
]'' 
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (
Login(() .
(((. /
LoginRequest((/ ;
request((< C
)((C D
{)) 	
if** 
(** 
!** 

ModelState** 
.** 
IsValid** #
)**# $
return++ 
View++ 
(++ 
request++ #
)++# $
;++$ %
var-- 
result-- 
=-- 
await-- 
_userApiClient-- -
.--- .
Authenticate--. :
(--: ;
request--; B
)--B C
;--C D
if.. 
(.. 
result.. 
... 
	ResultObj..  
==..! #
null..$ (
)..( )
{// 

ModelState00 
.00 
AddModelError00 (
(00( )
$str00) +
,00+ ,
$str00- <
)00< =
;00= >
return11 
View11 
(11 
)11 
;11 
}22 
var33 
userPrincipal33 
=33 
this33  $
.33$ %
ValidateToken33% 2
(332 3
result333 9
.339 :
	ResultObj33: C
)33C D
;33D E
var44 
authProperties44 
=44  
new44! $$
AuthenticationProperties44% =
{55 

ExpiresUtc66 
=66 
DateTimeOffset66 +
.66+ ,
UtcNow66, 2
.662 3

AddMinutes663 =
(66= >
$num66> @
)66@ A
,66A B
IsPersistent77 
=77 
false77 $
}99 
;99 
HttpContext:: 
.:: 
Session:: 
.::  
	SetString::  )
(::) *
SystemConstants::* 9
.::9 :
AppSettings::: E
.::E F
Token::F K
,::K L
result::M S
.::S T
	ResultObj::T ]
)::] ^
;::^ _
await;; 
HttpContext;; 
.;; 
SignInAsync;; )
(;;) *(
CookieAuthenticationDefaults<< 4
.<<4 5 
AuthenticationScheme<<5 I
,<<I J
userPrincipal== %
,==% &
authProperties>> &
)>>& '
;>>' (
return@@ 
RedirectToAction@@ #
(@@# $
$str@@$ +
,@@+ ,
$str@@- 3
)@@3 4
;@@4 5
}AA 	
[CC 	
HttpPostCC	 
]CC 
publicDD 
asyncDD 
TaskDD 
<DD 
IActionResultDD '
>DD' (
LogoutDD) /
(DD/ 0
)DD0 1
{EE 	
awaitFF 
HttpContextFF 
.FF 
SignOutAsyncFF *
(FF* +(
CookieAuthenticationDefaultsGG 4
.GG4 5 
AuthenticationSchemeGG5 I
)GGI J
;GGJ K
returnHH 
RedirectToActionHH #
(HH# $
$strHH$ +
,HH+ ,
$strHH- 3
)HH3 4
;HH4 5
}II 	
[KK 	
HttpGetKK	 
]KK 
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' (
RegisterLL) 1
(LL1 2
)LL2 3
{MM 	
returnNN 
ViewNN 
(NN 
)NN 
;NN 
}OO 	
[QQ 	
HttpPostQQ	 
]QQ 
publicRR 
asyncRR 
TaskRR 
<RR 
IActionResultRR '
>RR' (
RegisterRR) 1
(RR1 2
RegisterRequestRR2 A
registerRequestRRB Q
)RRQ R
{SS 	
ifTT 
(TT 
!TT 

ModelStateTT 
.TT 
IsValidTT #
)TT# $
{UU 
returnVV 
ViewVV 
(VV 
registerRequestVV +
)VV+ ,
;VV, -
}WW 
varYY 
resultYY 
=YY 
awaitYY 
_userApiClientYY -
.YY- .
RegisterUserYY. :
(YY: ;
registerRequestYY; J
)YYJ K
;YYK L
ifZZ 
(ZZ 
!ZZ 
resultZZ 
.ZZ 
IsSuccessedZZ #
)ZZ# $
{[[ 

ModelState\\ 
.\\ 
AddModelError\\ (
(\\( )
$str\\) +
,\\+ ,
result\\- 3
.\\3 4
Message\\4 ;
)\\; <
;\\< =
return]] 
View]] 
(]] 
)]] 
;]] 
}^^ 
var__ 
loginResult__ 
=__ 
await__ #
_userApiClient__$ 2
.__2 3
Authenticate__3 ?
(__? @
new__@ C
LoginRequest__D P
(__P Q
)__Q R
{`` 
UserNameaa 
=aa 
registerRequestaa *
.aa* +
UserNameaa+ 3
,aa3 4
Passwordbb 
=bb 
registerRequestbb *
.bb* +
Passwordbb+ 3
,bb3 4

RememberMecc 
=cc 
truecc !
}dd 
)dd 
;dd 
varff 
userPrincipalff 
=ff 
thisff  $
.ff$ %
ValidateTokenff% 2
(ff2 3
loginResultff3 >
.ff> ?
	ResultObjff? H
)ffH I
;ffI J
vargg 
authPropertiesgg 
=gg  
newgg! $$
AuthenticationPropertiesgg% =
{hh 

ExpiresUtcii 
=ii 
DateTimeOffsetii +
.ii+ ,
UtcNowii, 2
.ii2 3

AddMinutesii3 =
(ii= >
$numii> @
)ii@ A
,iiA B
IsPersistentjj 
=jj 
falsejj $
}kk 
;kk 
HttpContextll 
.ll 
Sessionll 
.ll  
	SetStringll  )
(ll) *
SystemConstantsll* 9
.ll9 :
AppSettingsll: E
.llE F
TokenllF K
,llK L
loginResultllM X
.llX Y
	ResultObjllY b
)llb c
;llc d
awaitmm 
HttpContextmm 
.mm 
SignInAsyncmm )
(mm) *(
CookieAuthenticationDefaultsnn 4
.nn4 5 
AuthenticationSchemenn5 I
,nnI J
userPrincipaloo %
,oo% &
authPropertiespp &
)pp& '
;pp' (
returnrr 
RedirectToActionrr #
(rr# $
$strrr$ +
,rr+ ,
$strrr- 3
)rr3 4
;rr4 5
}ss 	
privateuu 
ClaimsPrincipaluu 
ValidateTokenuu  -
(uu- .
stringuu. 4
jwtTokenuu5 =
)uu= >
{vv 	$
IdentityModelEventSourceww $
.ww$ %
ShowPIIww% ,
=ww- .
trueww/ 3
;ww3 4
SecurityTokenyy 
validatedTokenyy (
;yy( )%
TokenValidationParameterszz % 
validationParameterszz& :
=zz; <
newzz= @%
TokenValidationParameterszzA Z
(zzZ [
)zz[ \
;zz\ ] 
validationParameters||  
.||  !
ValidateLifetime||! 1
=||2 3
true||4 8
;||8 9 
validationParameters~~  
.~~  !
ValidAudience~~! .
=~~/ 0
_configuration~~1 ?
[~~? @
$str~~@ O
]~~O P
;~~P Q 
validationParameters  
.  !
ValidIssuer! ,
=- .
_configuration/ =
[= >
$str> M
]M N
;N O"
validationParameters
ÄÄ  
.
ÄÄ  !
IssuerSigningKey
ÄÄ! 1
=
ÄÄ2 3
new
ÄÄ4 7"
SymmetricSecurityKey
ÄÄ8 L
(
ÄÄL M
Encoding
ÄÄM U
.
ÄÄU V
UTF8
ÄÄV Z
.
ÄÄZ [
GetBytes
ÄÄ[ c
(
ÄÄc d
_configuration
ÄÄd r
[
ÄÄr s
$str
ÄÄs 
]ÄÄ Ä
)ÄÄÄ Å
)ÄÄÅ Ç
;ÄÄÇ É
ClaimsPrincipal
ÇÇ 
	principal
ÇÇ %
=
ÇÇ& '
new
ÇÇ( +%
JwtSecurityTokenHandler
ÇÇ, C
(
ÇÇC D
)
ÇÇD E
.
ÇÇE F
ValidateToken
ÇÇF S
(
ÇÇS T
jwtToken
ÇÇT \
,
ÇÇ\ ]"
validationParameters
ÇÇ^ r
,
ÇÇr s
out
ÇÇt w
validatedTokenÇÇx Ü
)ÇÇÜ á
;ÇÇá à
return
ÑÑ 
	principal
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
}
ÜÜ 
}áá Âd
aF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Controllers\CartController.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Controllers *
{ 
public 

class 
CartController 
:  !

Controller" ,
{ 
private 
readonly 
IProductApiClient *
_productApiClient+ <
;< =
private 
readonly 
IOrderApiClient (
_orderApiClient) 8
;8 9
public 
CartController 
( 
IProductApiClient /
productApiClient0 @
,@ A
IOrderApiClientA P
orderApiClientQ _
)_ `
{ 	
_orderApiClient 
= 
orderApiClient ,
;, -
_productApiClient 
= 
productApiClient  0
;0 1
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
Checkout %
(% &
)& '
{ 	
return   
View   
(    
GetCheckoutViewModel   ,
(  , -
)  - .
)  . /
;  / 0
}!! 	
[## 	
HttpPost##	 
]## 
public$$ 
IActionResult$$ 
Checkout$$ %
($$% &
CheckoutViewModel$$& 7
request$$8 ?
)$$? @
{%% 	
var&& 
model&& 
=&&  
GetCheckoutViewModel&& ,
(&&, -
)&&- .
;&&. /
var'' 
orderDetails'' 
='' 
new'' "
List''# '
<''' (
OrderDetailVm''( 5
>''5 6
(''6 7
)''7 8
;''8 9
foreach(( 
((( 
var(( 
item(( 
in((  
model((! &
.((& '
	CartItems((' 0
)((0 1
{)) 
orderDetails** 
.** 
Add**  
(**  !
new**! $
OrderDetailVm**% 2
(**2 3
)**3 4
{++ 
	ProductId,, 
=,, 
item,,  $
.,,$ %
	ProductId,,% .
,,,. /
Quantity-- 
=-- 
item-- #
.--# $
Quantity--$ ,
}.. 
).. 
;.. 
}// 
var00 
checkoutRequest00 
=00  !
new00" %
CheckoutRequest00& 5
(005 6
)006 7
{11 
Address22 
=22 
request22 !
.22! "
CheckoutModel22" /
.22/ 0
Address220 7
,227 8
Name33 
=33 
request33 
.33 
CheckoutModel33 ,
.33, -
Name33- 1
,331 2
Email44 
=44 
request44 
.44  
CheckoutModel44  -
.44- .
Email44. 3
,443 4
PhoneNumber55 
=55 
request55 %
.55% &
CheckoutModel55& 3
.553 4
PhoneNumber554 ?
,55? @
OrderDetails66 
=66 
orderDetails66 +
,66+ ,
UserName77 
=77 
request77  
.77  !
CheckoutModel77! .
.77. /
UserName77/ 7
}88 
;88 
_orderApiClient:: 
.:: 
CreateOrder:: )
(::) *
checkoutRequest::* 9
)::9 :
;::: ;
TempData== 
[== 
$str== !
]==! "
===# $
$str==% A
;==A B
return>> 
View>> 
(>> 
model>> 
)>> 
;>> 
}?? 	
[AA 	
HttpGetAA	 
]AA 
publicBB 
IActionResultBB 
GetListItemsBB )
(BB) *
)BB* +
{CC 	
varDD 
sessionDD 
=DD 
HttpContextDD %
.DD% &
SessionDD& -
.DD- .
	GetStringDD. 7
(DD7 8
SystemConstantsDD8 G
.DDG H
CartSessionDDH S
)DDS T
;DDT U
ListEE 
<EE 
CartItemViewModelEE "
>EE" #
currentCartEE$ /
=EE0 1
newEE2 5
ListEE6 :
<EE: ;
CartItemViewModelEE; L
>EEL M
(EEM N
)EEN O
;EEO P
ifFF 
(FF 
sessionFF 
!=FF 
nullFF 
)FF  
currentCartGG 
=GG 
JsonConvertGG )
.GG) *
DeserializeObjectGG* ;
<GG; <
ListGG< @
<GG@ A
CartItemViewModelGGA R
>GGR S
>GGS T
(GGT U
sessionGGU \
)GG\ ]
;GG] ^
returnHH 
OkHH 
(HH 
currentCartHH !
)HH! "
;HH" #
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
	AddToCartKK) 2
(KK2 3
intKK3 6
idKK7 9
,KK9 :
stringKK; A

languageIdKKB L
)KKL M
{LL 	
varMM 
productMM 
=MM 
awaitMM 
_productApiClientMM  1
.MM1 2
GetByIdMM2 9
(MM9 :
idMM: <
,MM< =

languageIdMM> H
)MMH I
;MMI J
ifNN 
(NN 
productNN 
==NN 
nullNN 
)NN  
returnOO 

BadRequestOO !
(OO! "
)OO" #
;OO# $
varQQ 
sessionQQ 
=QQ 
HttpContextQQ %
.QQ% &
SessionQQ& -
.QQ- .
	GetStringQQ. 7
(QQ7 8
SystemConstantsQQ8 G
.QQG H
CartSessionQQH S
)QQS T
;QQT U
ListRR 
<RR 
CartItemViewModelRR "
>RR" #
currentCartRR$ /
=RR0 1
newRR2 5
ListRR6 :
<RR: ;
CartItemViewModelRR; L
>RRL M
(RRM N
)RRN O
;RRO P
ifSS 
(SS 
sessionSS 
!=SS 
nullSS 
)SS  
currentCartTT 
=TT 
JsonConvertTT )
.TT) *
DeserializeObjectTT* ;
<TT; <
ListTT< @
<TT@ A
CartItemViewModelTTA R
>TTR S
>TTS T
(TTT U
sessionTTU \
)TT\ ]
;TT] ^
intVV 
quantityVV 
=VV 
$numVV 
;VV 
ifWW 
(WW 
currentCartWW 
.WW 
AnyWW 
(WW  
xWW  !
=>WW" $
xWW% &
.WW& '
	ProductIdWW' 0
==WW1 3
idWW4 6
)WW6 7
)WW7 8
{XX 
quantityYY 
=YY 
currentCartYY &
.YY& '
FirstYY' ,
(YY, -
xYY- .
=>YY/ 1
xYY2 3
.YY3 4
	ProductIdYY4 =
==YY> @
idYYA C
)YYC D
.YYD E
QuantityYYE M
+YYN O
$numYYP Q
;YYQ R
}ZZ 
var\\ 
cartItem\\ 
=\\ 
new\\ 
CartItemViewModel\\ 0
(\\0 1
)\\1 2
{]] 
	ProductId^^ 
=^^ 
id^^ 
,^^ 
Description__ 
=__ 
product__ %
.__% &
Description__& 1
,__1 2
Image`` 
=`` 
product`` 
.``  
ThumbnailImage``  .
,``. /
Nameaa 
=aa 
productaa 
.aa 
Nameaa #
,aa# $
Pricebb 
=bb 
productbb 
.bb  
Pricebb  %
,bb% &
Quantitycc 
=cc 
quantitycc #
}dd 
;dd 
currentCartff 
.ff 
Addff 
(ff 
cartItemff $
)ff$ %
;ff% &
HttpContexthh 
.hh 
Sessionhh 
.hh  
	SetStringhh  )
(hh) *
SystemConstantshh* 9
.hh9 :
CartSessionhh: E
,hhE F
JsonConverthhG R
.hhR S
SerializeObjecthhS b
(hhb c
currentCarthhc n
)hhn o
)hho p
;hhp q
returnii 
Okii 
(ii 
currentCartii !
)ii! "
;ii" #
}jj 	
publicmm 
IActionResultmm 

UpdateCartmm '
(mm' (
intmm( +
idmm, .
,mm. /
intmm0 3
quantitymm4 <
)mm< =
{nn 	
varoo 
sessionoo 
=oo 
HttpContextoo %
.oo% &
Sessionoo& -
.oo- .
	GetStringoo. 7
(oo7 8
SystemConstantsoo8 G
.ooG H
CartSessionooH S
)ooS T
;ooT U
Listpp 
<pp 
CartItemViewModelpp "
>pp" #
currentCartpp$ /
=pp0 1
newpp2 5
Listpp6 :
<pp: ;
CartItemViewModelpp; L
>ppL M
(ppM N
)ppN O
;ppO P
ifqq 
(qq 
sessionqq 
!=qq 
nullqq 
)qq  
currentCartrr 
=rr 
JsonConvertrr )
.rr) *
DeserializeObjectrr* ;
<rr; <
Listrr< @
<rr@ A
CartItemViewModelrrA R
>rrR S
>rrS T
(rrT U
sessionrrU \
)rr\ ]
;rr] ^
foreachtt 
(tt 
vartt 
itemtt 
intt  
currentCarttt! ,
)tt, -
{uu 
ifvv 
(vv 
itemvv 
.vv 
	ProductIdvv "
==vv# %
idvv& (
)vv( )
{ww 
ifxx 
(xx 
quantityxx  
==xx! #
$numxx$ %
)xx% &
{yy 
currentCartzz #
.zz# $
Removezz$ *
(zz* +
itemzz+ /
)zz/ 0
;zz0 1
break{{ 
;{{ 
}|| 
item}} 
.}} 
Quantity}} !
=}}" #
quantity}}$ ,
;}}, -
}~~ 
} 
HttpContext
ÅÅ 
.
ÅÅ 
Session
ÅÅ 
.
ÅÅ  
	SetString
ÅÅ  )
(
ÅÅ) *
SystemConstants
ÅÅ* 9
.
ÅÅ9 :
CartSession
ÅÅ: E
,
ÅÅE F
JsonConvert
ÅÅG R
.
ÅÅR S
SerializeObject
ÅÅS b
(
ÅÅb c
currentCart
ÅÅc n
)
ÅÅn o
)
ÅÅo p
;
ÅÅp q
return
ÇÇ 
Ok
ÇÇ 
(
ÇÇ 
currentCart
ÇÇ !
)
ÇÇ! "
;
ÇÇ" #
}
ÉÉ 	
private
ÖÖ 
CheckoutViewModel
ÖÖ !"
GetCheckoutViewModel
ÖÖ" 6
(
ÖÖ6 7
)
ÖÖ7 8
{
ÜÜ 	
var
áá 
session
áá 
=
áá 
HttpContext
áá %
.
áá% &
Session
áá& -
.
áá- .
	GetString
áá. 7
(
áá7 8
SystemConstants
áá8 G
.
ááG H
CartSession
ááH S
)
ááS T
;
ááT U
List
àà 
<
àà 
CartItemViewModel
àà "
>
àà" #
currentCart
àà$ /
=
àà0 1
new
àà2 5
List
àà6 :
<
àà: ;
CartItemViewModel
àà; L
>
ààL M
(
ààM N
)
ààN O
;
ààO P
if
ââ 
(
ââ 
session
ââ 
!=
ââ 
null
ââ 
)
ââ  
currentCart
ää 
=
ää 
JsonConvert
ää )
.
ää) *
DeserializeObject
ää* ;
<
ää; <
List
ää< @
<
ää@ A
CartItemViewModel
ääA R
>
ääR S
>
ääS T
(
ääT U
session
ääU \
)
ää\ ]
;
ää] ^
var
ãã 

checkoutVm
ãã 
=
ãã 
new
ãã  
CheckoutViewModel
ãã! 2
(
ãã2 3
)
ãã3 4
{
åå 
	CartItems
çç 
=
çç 
currentCart
çç '
,
çç' (
CheckoutModel
éé 
=
éé 
new
éé  #
CheckoutRequest
éé$ 3
(
éé3 4
)
éé4 5
}
èè 
;
èè 
return
êê 

checkoutVm
êê 
;
êê 
}
ëë 	
}
íí 
}ìì «
pF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Controllers\Components\PagerViewComponent.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Controllers *
.* +

Components+ 5
{		 
public

 

class

 
PagerViewComponent

 #
:

$ %
ViewComponent

& 3
{ 
public 
Task 
<  
IViewComponentResult (
>( )
InvokeAsync* 5
(5 6
PageResultBase6 D
resultE K
)K L
{ 	
return 
Task 
. 

FromResult "
(" #
(# $ 
IViewComponentResult$ 8
)8 9
View9 =
(= >
$str> G
,G H
resultI O
)O P
)P Q
;Q R
} 	
} 
} ﬂ
rF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Controllers\Components\SideBarViewComponent.cs
	namespace		 	
eShopSolution		
 
.		 
WebApp		 
.		 
Controllers		 *
.		* +

Components		+ 5
{

 
public 

class  
SideBarViewComponent %
:& '
ViewComponent( 5
{ 
private 
readonly 
ICategoryApiClient +
_categoryApiClient, >
;> ?
public  
SideBarViewComponent #
(# $
ICategoryApiClient$ 6
categoryApiClient7 H
)H I
{ 	
_categoryApiClient 
=  
categoryApiClient! 2
;2 3
} 	
public 
async 
Task 
<  
IViewComponentResult .
>. /
InvokeAsync0 ;
(; <
)< =
{ 	
var 
items 
= 
await 
_categoryApiClient 0
.0 1
GetAll1 7
(7 8
CultureInfo8 C
.C D
CurrentCultureD R
.R S
NameS W
)W X
;X Y
return 
View 
( 
$str !
,! "
items# (
.( )
	ResultObj) 2
)2 3
;3 4
} 	
} 
} Í,
aF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Controllers\HomeController.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Controllers *
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
private 
readonly 
ILogger  
<  !
HomeController! /
>/ 0
_logger1 8
;8 9
private 
readonly #
ISharedCultureLocalizer 0
_loc1 5
;5 6
private 
readonly 
ISlideApiClient (
_slideApiClient) 8
;8 9
private 
readonly 
IProductApiClient *
_productApiClient+ <
;< =
public 
HomeController 
( 
ILogger %
<% &
HomeController& 4
>4 5
logger6 <
,< =#
ISharedCultureLocalizer> U
locV Y
,Y Z
ISlideApiClient 
slideApiClient *
,* +
IProductApiClient, =
productApiClient> N
)N O
{ 	
_logger 
= 
logger 
; 
_loc 
= 
loc 
; 
_slideApiClient 
= 
slideApiClient ,
;, -
_productApiClient   
=   
productApiClient    0
;  0 1
}!! 	
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
Index##) .
(##. /
)##/ 0
{$$ 	
var%% 
msg%% 
=%% 
_loc%% 
.%% 
GetLocalizedString%% -
(%%- .
$str%%. :
)%%: ;
;%%; <
var&& 
slides&& 
=&& 
await&& 
_slideApiClient&& .
.&&. /
GetAll&&/ 5
(&&5 6
)&&6 7
;&&7 8
var'' 

languageId'' 
='' 
CultureInfo'' (
.''( )
CurrentCulture'') 7
.''7 8
Name''8 <
;''< =
var(( 
FeaturedProducts((  
=((! "
await((# (
_productApiClient(() :
.((: ;
GetFeaturedProducts((; N
(((N O
SystemConstants((O ^
.((^ _
ProductSettings((_ n
.((n o%
NumberOfFeaturedProducts	((o á
,
((á à

languageId
((â ì
)
((ì î
;
((î ï
var)) 
LatestProducts)) 
=))  
await))! &
_productApiClient))' 8
.))8 9
GetLatestProducts))9 J
())J K
SystemConstants))K Z
.))Z [
ProductSettings))[ j
.))j k#
NumberOfLatestProducts	))k Å
,
))Å Ç

languageId
))É ç
)
))ç é
;
))é è
var++ 
	viewModel++ 
=++ 
new++ 
HomeViewModel++  -
(++- .
)++. /
{,, 
Slides-- 
=-- 
slides-- 
,--  
FeaturedProducts..  
=..! "
FeaturedProducts..# 3
,..3 4
LatestProducts// 
=//  
LatestProducts//! /
}00 
;00 
return11 
View11 
(11 
	viewModel11 !
)11! "
;11" #
}22 	
public44 
IActionResult44 
Privacy44 $
(44$ %
)44% &
{55 	
return66 
View66 
(66 
)66 
;66 
}77 	
[99 	
ResponseCache99	 
(99 
Duration99 
=99  !
$num99" #
,99# $
Location99% -
=99. /!
ResponseCacheLocation990 E
.99E F
None99F J
,99J K
NoStore99L S
=99T U
true99V Z
)99Z [
]99[ \
public:: 
IActionResult:: 
Error:: "
(::" #
)::# $
{;; 	
return<< 
View<< 
(<< 
new<< 
ErrorViewModel<< *
{<<+ ,
	RequestId<<- 6
=<<7 8
Activity<<9 A
.<<A B
Current<<B I
?<<I J
.<<J K
Id<<K M
??<<N P
HttpContext<<Q \
.<<\ ]
TraceIdentifier<<] l
}<<m n
)<<n o
;<<o p
}== 	
public@@ 
IActionResult@@ 
SetCultureCookie@@ -
(@@- .
string@@. 4
cltr@@5 9
,@@9 :
string@@; A
	returnUrl@@B K
)@@K L
{AA 	
ResponseBB 
.BB 
CookiesBB 
.BB 
AppendBB #
(BB# $(
CookieRequestCultureProviderCC ,
.CC, -
DefaultCookieNameCC- >
,CC> ?(
CookieRequestCultureProviderDD ,
.DD, -
MakeCookieValueDD- <
(DD< =
newDD= @
RequestCultureDDA O
(DDO P
cltrDDP T
)DDT U
)DDU V
,DDV W
newEE 
CookieOptionsEE !
{EE" #
ExpiresEE$ +
=EE, -
DateTimeOffsetEE. <
.EE< =
UtcNowEE= C
.EEC D
AddYearsEED L
(EEL M
$numEEM N
)EEN O
}EEP Q
)FF 
;FF 
returnHH 
LocalRedirectHH  
(HH  !
	returnUrlHH! *
)HH* +
;HH+ ,
}II 	
}JJ 
}KK ò
dF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Controllers\ProductController.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Controllers *
{ 
public 

class 
ProductController "
:# $

Controller% /
{ 
private 
readonly 
IProductApiClient *
_productApiClient+ <
;< =
private 
readonly 
ICategoryApiClient +
_categoryApiClient, >
;> ?
public 
ProductController  
(  !
IProductApiClient! 2
productApiClient3 C
,C D
ICategoryApiClientE W
categoryApiClientX i
)i j
{ 	
_productApiClient 
= 
productApiClient  0
;0 1
_categoryApiClient 
=  
categoryApiClient! 2
;2 3
} 	
public 
async 
Task 
< 
IActionResult '
>' (
Details) 0
(0 1
int1 4
id5 7
,7 8
string9 ?
culture@ G
)G H
{ 	
var 
product 
= 
await 
_productApiClient  1
.1 2
GetProductDetails2 C
(C D
idD F
,F G
cultureH O
)O P
;P Q
var 
productCategories !
=" #
await$ )
_productApiClient* ;
.; <
GetRelatedProduct< M
(M N
idN P
,P Q
cultureR Y
,Y Z
$num[ \
)\ ]
;] ^
var 
detailsViewModel  
=! "
new# &
DetalisViewModel' 7
(7 8
)8 9
{ 
productDetalis 
=  
product! (
,( )
productCategories   !
=  " #
productCategories  $ 5
}!! 
;!! 
return"" 
View"" 
("" 
detailsViewModel"" (
)""( )
;"") *
}## 	
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Category%%) 1
(%%1 2
int%%2 5
id%%6 8
,%%8 9
string%%: @
keyword%%A H
,%%H I
int%%J M
	pageIndex%%N W
=%%X Y
$num%%Z [
,%%[ \
int%%] `
pageSize%%a i
=%%j k
$num%%l m
)%%m n
{&& 	
var'' 

languageId'' 
='' 
CultureInfo'' (
.''( )
CurrentCulture'') 7
.''7 8
Name''8 <
;''< =
var)) 
request)) 
=)) 
new)) )
GetManageProductPagingRequest)) ;
()); <
)))< =
{** 
KeyWord++ 
=++ 
keyword++ !
,++! "
	PageIndex,, 
=,, 
	pageIndex,, %
,,,% &
PageSize-- 
=-- 
pageSize-- #
,--# $

LanguageId.. 
=.. 

languageId.. '
,..' (

CategoryId// 
=// 
id// 
}00 
;00 
var11 
data11 
=11 
await11 
_productApiClient11 .
.11. /
GetProductPagings11/ @
(11@ A
request11A H
)11H I
;11I J
return33 
View33 
(33 
data33 
.33 
	ResultObj33 &
)33& '
;33' (
}44 	
}55 
}66 á
xF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\LocalizationResources\ExpressLocalizationResource.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. !
LocalizationResources 4
{ 
public 

class '
ExpressLocalizationResource ,
{		 
}

 
} Å
uF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\LocalizationResources\ViewLocalizationResource.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. !
LocalizationResources 4
{ 
public 

class $
ViewLocalizationResource )
{		 
}

 
} Ú	
_F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Models\CartItemViewModel.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Models %
{ 
public 

class 
CartItemViewModel "
{		 
public

 
int

 
	ProductId

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Image 
{ 
get !
;! "
set# &
;& '
}( )
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ◊
_F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Models\CheckoutViewModel.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Models %
{ 
public		 

class		 
CheckoutViewModel		 "
{

 
public 
List 
< 
CartItemViewModel %
>% &
	CartItems' 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
public 
CheckoutRequest 
CheckoutModel ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
} 
} ’
^F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Models\DetalisViewModel.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Models %
{ 
public		 

class		 
DetalisViewModel		 !
{

 
public 
ProductDetails 
productDetalis ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
public 
List 
< 
	ProductVm 
> 
productCategories 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
} Œ
\F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Models\ErrorViewModel.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Models %
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
	RequestId 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
bool		 
ShowRequestId		 !
=>		" $
!		% &
string		& ,
.		, -
IsNullOrEmpty		- :
(		: ;
	RequestId		; D
)		D E
;		E F
}

 
} ƒ
[F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Models\HomeViewModel.cs
	namespace 	
eShopSolution
 
. 
WebApp 
. 
Models %
{		 
public

 

class

 
HomeViewModel

 
{ 
public 
List 
< 
SlideVm 
> 
Slides #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
List 
< 
	ProductVm 
> 
FeaturedProducts /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
public 
List 
< 
	ProductVm 
> 
LatestProducts -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
} Ã

NF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Program.cs
	namespace

 	
eShopSolution


 
.

 
WebApp

 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. $
ConfigureWebHostDefaults )
() *

webBuilder* 4
=>5 7
{ 

webBuilder 
. 

UseStartup )
<) *
Startup* 1
>1 2
(2 3
)3 4
;4 5
} 
) 
; 
} 
} ÈD
NF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.WebApp\Startup.cs
	namespace 	
eShopSolution
 
. 
WebApp 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public"" 
void"" 
ConfigureServices"" %
(""% &
IServiceCollection""& 8
services""9 A
)""A B
{## 	
services$$ 
.$$ 
AddHttpClient$$ "
($$" #
)$$# $
;$$$ %
var%% 
cultures%% 
=%% 
new%% 
[%% 
]%%  
{&& 
new'' 
CultureInfo'' 
(''  
$str''  $
)''$ %
,''% &
new(( 
CultureInfo(( 
(((  
$str((  $
)(($ %
,((% &
})) 
;)) 
services,, 
.,, #
AddControllersWithViews,, ,
(,,, -
),,- .
.-- 
AddFluentValidation-- '
(--' (
fv--( *
=>--+ -
fv--. 0
.--0 14
(RegisterValidatorsFromAssemblyContaining--1 Y
<--Y Z!
LoginRequestValidator--Z o
>--o p
(--p q
)--q r
)--r s
... "
AddExpressLocalization.. (
<..( )'
ExpressLocalizationResource..) D
,..D E$
ViewLocalizationResource..F ^
>..^ _
(.._ `
ops..` c
=>..d f
{// 
opsCC 
.CC "
UseAllCultureProvidersCC /
=CC0 1
falseCC2 7
;CC7 8
opsDD 
.DD 
ResourcesPathDD &
=DD' (
$strDD) @
;DD@ A
opsEE 
.EE &
RequestLocalizationOptionsEE 3
=EE4 5
oEE6 7
=>EE8 :
{FF 
oGG 
.GG 
SupportedCulturesGG ,
=GG- .
culturesGG/ 7
;GG7 8
oHH 
.HH 
SupportedUICulturesHH .
=HH/ 0
culturesHH1 9
;HH9 :
oII 
.II !
DefaultRequestCultureII 0
=II1 2
newII3 6
RequestCultureII7 E
(IIE F
$strIIF J
)IIJ K
;IIK L
}JJ 
;JJ 
}KK 
)KK 
;KK 
servicesNN 
.NN 
AddAuthenticationNN &
(NN& '(
CookieAuthenticationDefaultsNN' C
.NNC D 
AuthenticationSchemeNND X
)NNX Y
.OO	 

	AddCookieOO
 
(OO 
optionsOO 
=>OO 
{PP	 

optionsQQ 
.QQ 
	LoginPathQQ 
=QQ  
$strQQ! 1
;QQ1 2
optionsRR 
.RR 
AccessDeniedPathRR %
=RR& '
$strRR( :
;RR: ;
}SS	 

)SS
 
;SS 
servicesUU 
.UU 

AddSessionUU 
(UU  
optionsUU  '
=>UU( *
{VV 
optionsXX 
.XX 
IdleTimeoutXX #
=XX$ %
TimeSpanXX& .
.XX. /
FromMinutesXX/ :
(XX: ;
$numXX; =
)XX= >
;XX> ?
}YY 
)YY 
;YY 
servicesZZ 
.ZZ 
AddSingletonZZ !
<ZZ! " 
IHttpContextAccessorZZ" 6
,ZZ6 7
HttpContextAccessorZZ8 K
>ZZK L
(ZZL M
)ZZM N
;ZZN O
services[[ 
.[[ 
AddTransient[[ !
<[[! "
ISlideApiClient[[" 1
,[[1 2
SlideApiClient[[3 A
>[[A B
([[B C
)[[C D
;[[D E
services\\ 
.\\ 
AddTransient\\ !
<\\! "
IProductApiClient\\" 3
,\\3 4
ProductApiClient\\5 E
>\\E F
(\\F G
)\\G H
;\\H I
services]] 
.]] 
AddTransient]] !
<]]! "
IUserApiClient]]" 0
,]]0 1
UserApiClient]]2 ?
>]]? @
(]]@ A
)]]A B
;]]B C
services^^ 
.^^ 
AddTransient^^ !
<^^! "
IOrderApiClient^^" 1
,^^1 2
OrderApiClient^^3 A
>^^A B
(^^B C
)^^C D
;^^D E
services__ 
.__ 
AddTransient__ !
<__! "
ICategoryApiClient__" 4
,__4 5
CategoryApiClient__6 G
>__G H
(__H I
)__I J
;__J K
}`` 	
publiccc 
voidcc 
	Configurecc 
(cc 
IApplicationBuildercc 1
appcc2 5
,cc5 6
IWebHostEnvironmentcc7 J
envccK N
)ccN O
{dd 	
ifee 
(ee 
envee 
.ee 
IsDevelopmentee !
(ee! "
)ee" #
)ee# $
{ff 
appgg 
.gg %
UseDeveloperExceptionPagegg -
(gg- .
)gg. /
;gg/ 0
}hh 
elseii 
{jj 
appkk 
.kk 
UseExceptionHandlerkk '
(kk' (
$strkk( 5
)kk5 6
;kk6 7
appmm 
.mm 
UseHstsmm 
(mm 
)mm 
;mm 
}nn 
appoo 
.oo 
UseHttpsRedirectionoo #
(oo# $
)oo$ %
;oo% &
apppp 
.pp 
UseStaticFilespp 
(pp 
)pp  
;pp  !
appqq 
.qq 
UseAuthenticationqq !
(qq! "
)qq" #
;qq# $
apprr 
.rr 

UseRoutingrr 
(rr 
)rr 
;rr 
apptt 
.tt 
UseAuthorizationtt  
(tt  !
)tt! "
;tt" #
appuu 
.uu 

UseSessionuu 
(uu 
)uu 
;uu 
appvv 
.vv "
UseRequestLocalizationvv &
(vv& '
)vv' (
;vv( )
appww 
.ww 
UseEndpointsww 
(ww 
	endpointsww &
=>ww' )
{xx 
	endpointsyy 
.yy 
MapControllerRouteyy ,
(yy, -
namezz 
:zz 
$strzz /
,zz/ 0
pattern{{ 
:{{ 
$str{{ 8
,{{8 9
new{{: =
{|| 

controller}} "
=}}# $
$str}}% .
,}}. /
action~~ 
=~~  
$str~~! +
} 
) 
; 
	endpoints
ÄÄ 
.
ÄÄ  
MapControllerRoute
ÄÄ ,
(
ÄÄ, -
name
ÅÅ 
:
ÅÅ 
$str
ÅÅ .
,
ÅÅ. /
pattern
ÇÇ 
:
ÇÇ 
$str
ÇÇ 5
,
ÇÇ5 6
new
ÇÇ7 :
{
ÉÉ 

controller
ÑÑ !
=
ÑÑ" #
$str
ÑÑ$ -
,
ÑÑ- .
action
ÖÖ 
=
ÖÖ 
$str
ÖÖ  *
}
ÜÜ 
)
ÜÜ 
;
ÜÜ 
	endpoints
áá 
.
áá  
MapControllerRoute
áá ,
(
áá, -
name
àà 
:
àà 
$str
àà -
,
àà- .
pattern
ââ 
:
ââ 
$str
ââ 5
,
ââ5 6
new
ââ7 :
{
ää 

controller
ãã !
=
ãã" #
$str
ãã$ -
,
ãã- .
action
åå 
=
åå 
$str
åå  )
}
çç 
)
çç 
;
çç 
	endpoints
éé 
.
éé  
MapControllerRoute
éé ,
(
éé, -
name
èè 
:
èè 
$str
èè /
,
èè/ 0
pattern
êê 
:
êê 
$str
êê 7
,
êê7 8
new
êê9 <
{
ëë 

controller
íí #
=
íí$ %
$str
íí& /
,
íí/ 0
action
ìì 
=
ìì  !
$str
ìì" +
}
îî 
)
îî 
;
îî 
	endpoints
ññ 
.
ññ  
MapControllerRoute
ññ ,
(
ññ, -
name
óó 
:
óó 
$str
óó #
,
óó# $
pattern
òò 
:
òò 
$str
òò R
)
òòR S
;
òòS T
}
ôô 
)
ôô 
;
ôô 
}
öö 	
}
õõ 
}úú 