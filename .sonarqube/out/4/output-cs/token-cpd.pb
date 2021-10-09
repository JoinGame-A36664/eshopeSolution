�V
]F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\BaseApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

class 
BaseApiClient 
{ 
private 
readonly 
IHttpClientFactory +
_httpClientFactory, >
;> ?
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
	protected 
BaseApiClient 
(  
IHttpClientFactory  2
httpClientFactory3 D
,D E 
IHttpContextAccessor '
httpContextAccessor( ;
,; <
IConfiguration "
configuration# 0
)0 1
{ 	
_configuration 
= 
configuration *
;* + 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
_httpClientFactory 
=  
httpClientFactory! 2
;2 3
} 	
	protected 
async 
Task 
< 
	TResponse &
>& '
GetAsync( 0
<0 1
	TResponse1 :
>: ;
(; <
string< B
urlC F
)F G
{ 	
var 
sessions 
=  
_httpContextAccessor /
.   
HttpContext   
.!! 
Session!! 
."" 
	GetString"" 
("" 
SystemConstants"" *
.""* +
AppSettings""+ 6
.""6 7
Token""7 <
)""< =
;""= >
var%% 
client%% 
=%% 
_httpClientFactory%% +
.%%+ ,
CreateClient%%, 8
(%%8 9
)%%9 :
;%%: ;
client'' 
.'' 
BaseAddress'' 
=''  
new''! $
Uri''% (
(''( )
_configuration'') 7
[''7 8
SystemConstants''8 G
.''G H
AppSettings''H S
.''S T
BaseAddress''T _
]''_ `
)''` a
;''a b
client)) 
.)) !
DefaultRequestHeaders)) (
.))( )
Authorization))) 6
=))7 8
new))9 <%
AuthenticationHeaderValue))= V
())V W
$str))W _
,))_ `
sessions))a i
)))i j
;))j k
var++ 
response++ 
=++ 
await++  
client++! '
.++' (
GetAsync++( 0
(++0 1
url++1 4
)++4 5
;++5 6
var,, 
body,, 
=,, 
await,, 
response,, %
.,,% &
Content,,& -
.,,- .
ReadAsStringAsync,,. ?
(,,? @
),,@ A
;,,A B
if-- 
(-- 
response-- 
.-- 
IsSuccessStatusCode-- ,
)--, -
{.. 
	TResponse11 !
myDeserializedObjList11 /
=110 1
(112 3
	TResponse113 <
)11< =
JsonConvert11= H
.11H I
DeserializeObject11I Z
(11Z [
body11[ _
,11_ `
typeof11a g
(11g h
	TResponse11h q
)11q r
)11r s
;11s t
return33 !
myDeserializedObjList33 ,
;33, -
}44 
return55 
JsonConvert55 
.55 
DeserializeObject55 0
<550 1
	TResponse551 :
>55: ;
(55; <
body55< @
)55@ A
;55A B
}66 	
	protected88 
async88 
Task88 
<88 
	TResponse88 &
>88& '
	PostAsync88( 1
<881 2
	TResponse882 ;
>88; <
(88< =
string88= C
url88D G
,88G H
object88I O
request88P W
)88W X
{99 	
var;; 
json;; 
=;; 
JsonConvert;; "
.;;" #
SerializeObject;;# 2
(;;2 3
request;;3 :
);;: ;
;;;; <
var<< 
httpContent<< 
=<< 
new<< !
StringContent<<" /
(<</ 0
json<<0 4
,<<4 5
Encoding<<6 >
.<<> ?
UTF8<<? C
,<<C D
$str<<E W
)<<W X
;<<X Y
var>> 
client>> 
=>> 
_httpClientFactory>> +
.>>+ ,
CreateClient>>, 8
(>>8 9
)>>9 :
;>>: ;
clientAA 
.AA 
BaseAddressAA 
=AA  
newAA! $
UriAA% (
(AA( )
_configurationAA) 7
[AA7 8
$strAA8 E
]AAE F
)AAF G
;AAG H
varCC 
responseCC 
=CC 
awaitCC  
clientCC! '
.CC' (
	PostAsyncCC( 1
(CC1 2
urlCC2 5
,CC5 6
httpContentCC7 B
)CCB C
;CCC D
ifEE 
(EE 
responseEE 
.EE 
IsSuccessStatusCodeEE ,
)EE, -
{FF 
returnHH 
JsonConvertHH "
.HH" #
DeserializeObjectHH# 4
<HH4 5
	TResponseHH5 >
>HH> ?
(HH? @
awaitHH@ E
responseHHF N
.HHN O
ContentHHO V
.HHV W
ReadAsStringAsyncHHW h
(HHh i
)HHi j
)HHj k
;HHk l
}II 
returnKK 
JsonConvertKK 
.KK 
DeserializeObjectKK 0
<KK0 1
	TResponseKK1 :
>KK: ;
(KK; <
awaitKK< A
responseKKB J
.KKJ K
ContentKKK R
.KKR S
ReadAsStringAsyncKKS d
(KKd e
)KKe f
)KKf g
;KKg h
}LL 	
	protectedNN 
asyncNN 
TaskNN 
<NN 
	TResponseNN &
>NN& '
DeleteAsyncNN( 3
<NN3 4
	TResponseNN4 =
>NN= >
(NN> ?
stringNN? E
urlNNF I
)NNI J
{OO 	
varPP 
sessionsPP 
=PP  
_httpContextAccessorPP /
.PP/ 0
HttpContextPP0 ;
.PP; <
SessionPP< C
.PPC D
	GetStringPPD M
(PPM N
$strPPN U
)PPU V
;PPV W
varQQ 
clientQQ 
=QQ 
_httpClientFactoryQQ +
.QQ+ ,
CreateClientQQ, 8
(QQ8 9
)QQ9 :
;QQ: ;
clientRR 
.RR 
BaseAddressRR 
=RR  
newRR! $
UriRR% (
(RR( )
_configurationRR) 7
[RR7 8
$strRR8 E
]RRE F
)RRF G
;RRG H
clientSS 
.SS !
DefaultRequestHeadersSS (
.SS( )
AuthorizationSS) 6
=SS7 8
newSS9 <%
AuthenticationHeaderValueSS= V
(SSV W
$strSSW _
,SS_ `
sessionsSSa i
)SSi j
;SSj k
varTT 
responseTT 
=TT 
awaitTT  
clientTT! '
.TT' (
DeleteAsyncTT( 3
(TT3 4
urlTT4 7
)TT7 8
;TT8 9
varUU 
bodyUU 
=UU 
awaitUU 
responseUU %
.UU% &
ContentUU& -
.UU- .
ReadAsStringAsyncUU. ?
(UU? @
)UU@ A
;UUA B
ifVV 
(VV 
responseVV 
.VV 
IsSuccessStatusCodeVV ,
)VV, -
returnWW 
JsonConvertWW "
.WW" #
DeserializeObjectWW# 4
<WW4 5
	TResponseWW5 >
>WW> ?
(WW? @
bodyWW@ D
)WWD E
;WWE F
returnYY 
JsonConvertYY 
.YY 
DeserializeObjectYY 0
<YY0 1
	TResponseYY1 :
>YY: ;
(YY; <
bodyYY< @
)YY@ A
;YYA B
}ZZ 	
	protected\\ 
async\\ 
Task\\ 
<\\ 
	TResponse\\ &
>\\& '
PutAsync\\( 0
<\\0 1
	TResponse\\1 :
>\\: ;
(\\; <
string\\< B
url\\C F
,\\F G
object\\H N
request\\O V
)\\V W
{]] 	
var^^ 
client^^ 
=^^ 
_httpClientFactory^^ +
.^^+ ,
CreateClient^^, 8
(^^8 9
)^^9 :
;^^: ;
client__ 
.__ 
BaseAddress__ 
=__  
new__! $
Uri__% (
(__( )
_configuration__) 7
[__7 8
$str__8 E
]__E F
)__F G
;__G H
var`` 
sessions`` 
=``  
_httpContextAccessor`` /
.``/ 0
HttpContext``0 ;
.``; <
Session``< C
.``C D
	GetString``D M
(``M N
$str``N U
)``U V
;``V W
clientbb 
.bb !
DefaultRequestHeadersbb (
.bb( )
Authorizationbb) 6
=bb7 8
newbb9 <%
AuthenticationHeaderValuebb= V
(bbV W
$strbbW _
,bb_ `
sessionsbba i
)bbi j
;bbj k
vardd 
jsondd 
=dd 
JsonConvertdd "
.dd" #
SerializeObjectdd# 2
(dd2 3
requestdd3 :
)dd: ;
;dd; <
varee 
httpContentee 
=ee 
newee !
StringContentee" /
(ee/ 0
jsonee0 4
,ee4 5
Encodingee6 >
.ee> ?
UTF8ee? C
,eeC D
$streeE W
)eeW X
;eeX Y
varhh 
responsehh 
=hh 
awaithh  
clienthh! '
.hh' (
PutAsynchh( 0
(hh0 1
urlhh1 4
,hh4 5
httpContenthh6 A
)hhA B
;hhB C
varii 
resultii 
=ii 
awaitii 
responseii '
.ii' (
Contentii( /
.ii/ 0
ReadAsStringAsyncii0 A
(iiA B
)iiB C
;iiC D
ifjj 
(jj 
responsejj 
.jj 
IsSuccessStatusCodejj ,
)jj, -
returnkk 
JsonConvertkk "
.kk" #
DeserializeObjectkk# 4
<kk4 5
	TResponsekk5 >
>kk> ?
(kk? @
resultkk@ F
)kkF G
;kkG H
returnmm 
JsonConvertmm 
.mm 
DeserializeObjectmm 0
<mm0 1
	TResponsemm1 :
>mm: ;
(mm; <
resultmm< B
)mmB C
;mmC D
}nn 	
}oo 
}pp �
aF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\CategoryApiClient.cs
	namespace		 	
eShopSolution		
 
.		 
ApiIntergration		 '
{

 
public 

class 
CategoryApiClient "
:# $
BaseApiClient% 2
,2 3
ICategoryApiClient4 F
{ 
public 
CategoryApiClient  
(  !
IHttpClientFactory! 3
httpClientFactory4 E
,E F 
IHttpContextAccessor '
httpContextAccessor( ;
,; <
IConfiguration "
configuration# 0
)0 1
:2 3
base4 8
(8 9
httpClientFactory9 J
,J K
httpContextAccessorL _
,_ `
configurationa n
)n o
{ 	
} 	
public 
async 
Task 
< 
	ApiResult #
<# $
List$ (
<( )

CategoryVm) 3
>3 4
>4 5
>5 6
GetAll7 =
(= >
string> D

languageIdE O
)O P
{ 	
return 
await 
GetAsync !
<! "
	ApiResult" +
<+ ,
List, 0
<0 1

CategoryVm1 ;
>; <
>< =
>= >
(> ?
$"? A
$strA \
{\ ]

languageId] g
}g h
"h i
)i j
;j k
} 	
} 
} �
bF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\ICategoryApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

	interface 
ICategoryApiClient '
{		 
Task

 
<

 
	ApiResult

 
<

 
List

 
<

 

CategoryVm

 &
>

& '
>

' (
>

( )
GetAll

* 0
(

0 1
string

1 7

languageId

8 B
)

B C
;

C D
} 
} �
bF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\ILanguageApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

	interface 
ILanguageApiClient '
{		 
Task

 
<

 
	ApiResult

 
<

 
List

 
<

 

LanguageVm

 &
>

& '
>

' (
>

( )
GetAll

* 0
(

0 1
)

1 2
;

2 3
} 
} �
_F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\IOrderApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public		 	
	interface		
 
IOrderApiClient		 #
{

 
Task 
< 
int 
> 
CreateOrder 
( 
CheckoutRequest -
request. 5
)5 6
;6 7
} 
} �
aF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\IProductApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public		 

	interface		 
IProductApiClient		 &
{

 
Task 
< 
	ApiResult 
< 
PagedResult "
<" #
	ProductVm# ,
>, -
>- .
>. /
GetProductPagings0 A
(A B)
GetManageProductPagingRequestB _
request` g
)g h
;h i
Task 
< 
bool 
> 
CreateProduct  
(  ! 
ProductCreateRequest! 5
request6 =
)= >
;> ?
Task 
< 
int 
> 
UpdateProduct 
(   
ProductUpdateRequest  4
request5 <
)< =
;= >
Task 
< 
	ProductVm 
> 
GetById 
(  
int  #
	productId$ -
,- .
string/ 5

languageId6 @
)@ A
;A B
Task 
< 
bool 
> 
Delete 
( 
int 
Id  
)  !
;! "
Task 
< 
bool 
> 
UpdatePrice 
( 
int "
	ProductId# ,
,, -
decimal. 5
newPrice6 >
)> ?
;? @
Task 
< 
bool 
> 
UpdateStock 
( 
int "
	ProductId# ,
,, -
int. 1
newStock2 :
): ;
;; <
Task 
< 
bool 
> 
CreateImage 
( %
ProductImageCreateRequest 8
request9 @
)@ A
;A B
Task 
< 
int 
> 
UpDateImage 
( %
ProductImageUpdateRequest 7
request8 ?
)? @
;@ A
Task 
< 
ProductImageVm 
> 
GetImageById )
() *
int* -
imageId. 5
)5 6
;6 7
Task 
< 
	ApiResult 
< 
bool 
> 
> 
CategoryAssign ,
(, -
int- 0
id1 3
,3 4!
CategoryAssignRequest5 J
requestK R
)R S
;S T
Task!! 
<!! 
List!! 
<!! 
	ProductVm!! 
>!! 
>!! 
GetFeaturedProducts!! 1
(!!1 2
int!!2 5
take!!6 :
,!!: ;
string!!< B

languageId!!C M
)!!M N
;!!N O
Task## 
<## 
List## 
<## 
	ProductVm## 
>## 
>## 
GetLatestProducts## /
(##/ 0
int##0 3
take##4 8
,##8 9
string##: @

languageId##A K
)##K L
;##L M
Task%% 
<%% 
ProductDetails%% 
>%% 
GetProductDetails%% .
(%%. /
int%%/ 2
	productId%%3 <
,%%< =
string%%> D

languageId%%E O
)%%O P
;%%P Q
Task'' 
<'' 
List'' 
<'' 
	ProductVm'' 
>'' 
>'' 
GetRelatedProduct'' /
(''/ 0
int''0 3
	productId''4 =
,''= >
string''? E

languageId''F P
,''P Q
int''R U
take''V Z
)''Z [
;''[ \
}(( 
})) �
^F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\IRoleApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

	interface 
IRoleApiClient #
{		 
Task

 
<

 
	ApiResult

 
<

 
List

 
<

 
RoleVm

 "
>

" #
>

# $
>

$ %
GetAll

& ,
(

, -
)

- .
;

. /
} 
} �
_F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\ISlideApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public		 

	interface		 
ISlideApiClient		 $
{

 
Task 
< 
List 
< 
SlideVm 
> 
> 
GetAll "
(" #
)# $
;$ %
} 
} �
^F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\IUserApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

	interface 
IUserApiClient #
{		 
Task

 
<

 
	ApiResult

 
<

 
string

 
>

 
>

 
Authenticate

  ,
(

, -
LoginRequest

- 9
request

: A
)

A B
;

B C
Task 
< 
	ApiResult 
< 
PagedResult "
<" #
UserVm# )
>) *
>* +
>+ ,
GetUsersPagings- <
(< = 
GetUserPagingRequest= Q
requestR Y
)Y Z
;Z [
Task 
< 
	ApiResult 
< 
bool 
> 
> 

UpdateUser (
(( )
Guid) -
id. 0
,0 1
UserUpdateRequest2 C
requestD K
)K L
;L M
Task 
< 
	ApiResult 
< 
bool 
> 
> 
RegisterUser *
(* +
RegisterRequest+ :
request; B
)B C
;C D
Task 
< 
	ApiResult 
< 
UserVm 
> 
> 
GetById  '
(' (
Guid( ,
id- /
)/ 0
;0 1
Task 
< 
	ApiResult 
< 
bool 
> 
> 
Delete $
($ %
Guid% )
Id* ,
), -
;- .
Task 
< 
	ApiResult 
< 
bool 
> 
> 

RoleAssign (
(( )
Guid) -
Id. 0
,0 1
RoleAssignRequest2 C
requestD K
)K L
;L M
} 
} �
aF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\LanguageApiClient.cs
	namespace		 	
eShopSolution		
 
.		 
ApiIntergration		 '
{

 
public 

class 
LanguageApiClient "
:# $
BaseApiClient% 2
,2 3
ILanguageApiClient4 F
{ 
public 
LanguageApiClient  
(  !
IHttpClientFactory! 3
httpClientFactory4 E
,E F 
IHttpContextAccessor &
httpContextAccessor' :
,: ;
IConfiguration !
configuration" /
)/ 0
: 
base 
( 
httpClientFactory #
,# $
httpContextAccessor% 8
,8 9
configuration: G
)G H
{ 	
} 	
public 
async 
Task 
< 
	ApiResult #
<# $
List$ (
<( )

LanguageVm) 3
>3 4
>4 5
>5 6
GetAll7 =
(= >
)> ?
{ 	
return 
await 
GetAsync !
<! "
	ApiResult" +
<+ ,
List, 0
<0 1

LanguageVm1 ;
>; <
>< =
>= >
(> ?
$str? O
)O P
;P Q
} 	
} 
} �!
^F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\OrderApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

class 
OrderApiClient 
:  !
IOrderApiClient! 0
{ 
private  
IHttpContextAccessor $ 
_httpContextAccessor% 9
;9 :
private 
IHttpClientFactory "
_httpClientFactory# 5
;5 6
private 
IConfiguration 
_configuration -
;- .
public 
OrderApiClient 
( 
IHttpClientFactory 0
httpClientFactory1 B
,B C 
IHttpContextAccessor '
httpContextAccessor( ;
,; <
IConfiguration "
configuration# 0
)0 1
{ 	 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
_httpClientFactory 
=  
httpClientFactory! 2
;2 3
_configuration 
= 
configuration *
;* +
} 	
public   
async   
Task   
<   
int   
>   
CreateOrder   *
(  * +
CheckoutRequest  + :
request  ; B
)  B C
{!! 	
var## 
json## 
=## 
JsonConvert## "
.##" #
SerializeObject### 2
(##2 3
request##3 :
)##: ;
;##; <
var$$ 
httpContent$$ 
=$$ 
new$$ !
StringContent$$" /
($$/ 0
json$$0 4
,$$4 5
Encoding$$6 >
.$$> ?
UTF8$$? C
,$$C D
$str$$E W
)$$W X
;$$X Y
var&& 
sessions&& 
=&&  
_httpContextAccessor&& /
.'' 
HttpContext'' 
.(( 
Session(( 
.)) 
	GetString)) 
()) 
SystemConstants)) (
.))( )
AppSettings))) 4
.))4 5
Token))5 :
))): ;
;)); <
var++ 
client++ 
=++ 
_httpClientFactory++ +
.+++ ,
CreateClient++, 8
(++8 9
)++9 :
;++: ;
client-- 
.-- 
BaseAddress-- 
=--  
new--! $
Uri--% (
(--( )
_configuration--) 7
[--7 8
SystemConstants--8 G
.--G H
AppSettings--H S
.--S T
BaseAddress--T _
]--_ `
)--` a
;--a b
client// 
.// !
DefaultRequestHeaders// (
.//( )
Authorization//) 6
=//7 8
new//9 <%
AuthenticationHeaderValue//= V
(//V W
$str//W _
,//_ `
sessions//a i
)//i j
;//j k
var11 
requestContent11 
=11  
new11! $$
MultipartFormDataContent11% =
(11= >
)11> ?
;11? @
var66 
response66 
=66 
await66  
client66! '
.66' (
	PostAsync66( 1
(661 2
$"662 4
$str664 ?
"66? @
,66@ A
httpContent66B M
)66M N
;66N O
if88 
(88 
response88 
.88 
IsSuccessStatusCode88 ,
)88, -
{99 
return;; 
JsonConvert;; "
.;;" #
DeserializeObject;;# 4
<;;4 5
int;;5 8
>;;8 9
(;;9 :
await;;: ?
response;;@ H
.;;H I
Content;;I P
.;;P Q
ReadAsStringAsync;;Q b
(;;b c
);;c d
);;d e
;;;e f
}<< 
return>> 
JsonConvert>> 
.>> 
DeserializeObject>> 0
<>>0 1
int>>1 4
>>>4 5
(>>5 6
await>>6 ;
response>>< D
.>>D E
Content>>E L
.>>L M
ReadAsStringAsync>>M ^
(>>^ _
)>>_ `
)>>` a
;>>a b
}?? 	
}@@ 
}AA ��
`F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\ProductApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

class 
ProductApiClient !
:" #
BaseApiClient$ 1
,1 2
IProductApiClient3 D
{ 
private  
IHttpContextAccessor $ 
_httpContextAccessor% 9
;9 :
private 
IHttpClientFactory "
_httpClientFactory# 5
;5 6
private 
IConfiguration 
_configuration -
;- .
public 
ProductApiClient 
(  
IHttpClientFactory  2
httpClientFactory3 D
,D E 
IHttpContextAccessor '
httpContextAccessor( ;
,; <
IConfiguration "
configuration# 0
)0 1
: 
base 
( 
httpClientFactory $
,$ %
httpContextAccessor& 9
,9 :
configuration; H
)H I
{ 	 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
_httpClientFactory 
=  
httpClientFactory! 2
;2 3
_configuration   
=   
configuration   *
;  * +
}!! 	
public## 
async## 
Task## 
<## 
	ApiResult## #
<### $
PagedResult##$ /
<##/ 0
	ProductVm##0 9
>##9 :
>##: ;
>##; <
GetProductPagings##= N
(##N O)
GetManageProductPagingRequest##O l
request##m t
)##t u
{$$ 	
var&& 
data&& 
=&& 
await&& 
GetAsync&& %
<&&% &
	ApiResult&&& /
<&&/ 0
PagedResult&&0 ;
<&&; <
	ProductVm&&< E
>&&E F
>&&F G
>&&G H
(&&H I
$"'' 
$str'' 1
{''1 2
request''2 9
.''9 :
	PageIndex'': C
}''C D
"''D E
+''F G
$"(( 
$str(( 
{(( 
request(( $
.(($ %
PageSize((% -
}((- .
"((. /
+((0 1
$")) 
$str)) 
{)) 
request)) #
.))# $
KeyWord))$ +
}))+ ,
$str)), 8
{))8 9
request))9 @
.))@ A

LanguageId))A K
}))K L
$str))L X
{))X Y
request))Y `
.))` a

CategoryId))a k
}))k l
"))l m
)))m n
;))n o
return++ 
data++ 
;++ 
},, 	
public.. 
async.. 
Task.. 
<.. 
bool.. 
>.. 
CreateProduct..  -
(..- . 
ProductCreateRequest... B
request..C J
)..J K
{// 	
var22 
sessions22 
=22  
_httpContextAccessor22 /
.33 
HttpContext33 
.44 
Session44 
.55 
	GetString55 
(55 
SystemConstants55 *
.55* +
AppSettings55+ 6
.556 7
Token557 <
)55< =
;55= >
var66 

languageId66 
=66  
_httpContextAccessor66 1
.661 2
HttpContext662 =
.66= >
Session66> E
.66E F
	GetString66F O
(66O P
SystemConstants66P _
.66_ `
AppSettings66` k
.66k l
DefaultLanguageId66l }
)66} ~
;66~ 
var99 
client99 
=99 
_httpClientFactory99 +
.99+ ,
CreateClient99, 8
(998 9
)999 :
;99: ;
client;; 
.;; 
BaseAddress;; 
=;;  
new;;! $
Uri;;% (
(;;( )
_configuration;;) 7
[;;7 8
SystemConstants;;8 G
.;;G H
AppSettings;;H S
.;;S T
BaseAddress;;T _
];;_ `
);;` a
;;;a b
client== 
.== !
DefaultRequestHeaders== (
.==( )
Authorization==) 6
===7 8
new==9 <%
AuthenticationHeaderValue=== V
(==V W
$str==W _
,==_ `
sessions==a i
)==i j
;==j k
var?? 
requestContent?? 
=??  
new??! $$
MultipartFormDataContent??% =
(??= >
)??> ?
;??? @
ifAA 
(AA 
requestAA 
.AA 
ThumbnailImageAA &
!=AA' )
nullAA* .
)AA. /
{BB 
byteCC 
[CC 
]CC 
dataCC 
;CC 
usingDD 
(DD 
varDD 
brDD 
=DD 
newDD  #
BinaryReaderDD$ 0
(DD0 1
requestDD1 8
.DD8 9
ThumbnailImageDD9 G
.DDG H
OpenReadStreamDDH V
(DDV W
)DDW X
)DDX Y
)DDY Z
{EE 
dataFF 
=FF 
brFF 
.FF 
	ReadBytesFF '
(FF' (
(FF( )
intFF) ,
)FF, -
requestFF- 4
.FF4 5
ThumbnailImageFF5 C
.FFC D
OpenReadStreamFFD R
(FFR S
)FFS T
.FFT U
LengthFFU [
)FF[ \
;FF\ ]
}GG 
ByteArrayContentHH  
bytesHH! &
=HH' (
newHH) ,
ByteArrayContentHH- =
(HH= >
dataHH> B
)HHB C
;HHC D
requestContentII 
.II 
AddII "
(II" #
bytesII# (
,II( )
$strII* :
,II: ;
requestII< C
.IIC D
ThumbnailImageIID R
.IIR S
FileNameIIS [
)II[ \
;II\ ]
}JJ 
requestContentLL 
.LL 
AddLL 
(LL 
newLL "
StringContentLL# 0
(LL0 1
requestLL1 8
.LL8 9
PriceLL9 >
.LL> ?
ToStringLL? G
(LLG H
)LLH I
)LLI J
,LLJ K
$strLLL S
)LLS T
;LLT U
requestContentMM 
.MM 
AddMM 
(MM 
newMM "
StringContentMM# 0
(MM0 1
requestMM1 8
.MM8 9
OriginalPriceMM9 F
.MMF G
ToStringMMG O
(MMO P
)MMP Q
)MMQ R
,MMR S
$strMMT c
)MMc d
;MMd e
requestContentNN 
.NN 
AddNN 
(NN 
newNN "
StringContentNN# 0
(NN0 1
requestNN1 8
.NN8 9
StockNN9 >
.NN> ?
ToStringNN? G
(NNG H
)NNH I
)NNI J
,NNJ K
$strNNL S
)NNS T
;NNT U
requestContentOO 
.OO 
AddOO 
(OO 
newOO "
StringContentOO# 0
(OO0 1
requestOO1 8
.OO8 9
NameOO9 =
.OO= >
ToStringOO> F
(OOF G
)OOG H
)OOH I
,OOI J
$strOOK Q
)OOQ R
;OOR S
requestContentPP 
.PP 
AddPP 
(PP 
newPP "
StringContentPP# 0
(PP0 1
requestPP1 8
.PP8 9
DescriptionPP9 D
.PPD E
ToStringPPE M
(PPM N
)PPN O
)PPO P
,PPP Q
$strPPR _
)PP_ `
;PP` a
requestContentQQ 
.QQ 
AddQQ 
(QQ 
newQQ "
StringContentQQ# 0
(QQ0 1
requestQQ1 8
.QQ8 9
DetailsQQ9 @
.QQ@ A
ToStringQQA I
(QQI J
)QQJ K
)QQK L
,QQL M
$strQQN W
)QQW X
;QQX Y
requestContentRR 
.RR 
AddRR 
(RR 
newRR "
StringContentRR# 0
(RR0 1
requestRR1 8
.RR8 9
SeoDescriptionRR9 G
.RRG H
ToStringRRH P
(RRP Q
)RRQ R
)RRR S
,RRS T
$strRRU e
)RRe f
;RRf g
requestContentSS 
.SS 
AddSS 
(SS 
newSS "
StringContentSS# 0
(SS0 1
requestSS1 8
.SS8 9
SeoTitleSS9 A
.SSA B
ToStringSSB J
(SSJ K
)SSK L
)SSL M
,SSM N
$strSSO Y
)SSY Z
;SSZ [
requestContentTT 
.TT 
AddTT 
(TT 
newTT "
StringContentTT# 0
(TT0 1
requestTT1 8
.TT8 9
SeoAliasTT9 A
.TTA B
ToStringTTB J
(TTJ K
)TTK L
)TTL M
,TTM N
$strTTO Y
)TTY Z
;TTZ [
requestContentUU 
.UU 
AddUU 
(UU 
newUU "
StringContentUU# 0
(UU0 1

languageIdUU1 ;
.UU; <
ToStringUU< D
(UUD E
)UUE F
)UUF G
,UUG H
$strUUI U
)UUU V
;UUV W
varXX 
responseXX 
=XX 
awaitXX  
clientXX! '
.XX' (
	PostAsyncXX( 1
(XX1 2
$"XX2 4
$strXX4 A
"XXA B
,XXB C
requestContentXXD R
)XXR S
;XXS T
returnYY 
responseYY 
.YY 
IsSuccessStatusCodeYY /
;YY/ 0
}ZZ 	
public\\ 
async\\ 
Task\\ 
<\\ 
int\\ 
>\\ 
UpdateProduct\\ ,
(\\, - 
ProductUpdateRequest\\- A
request\\B I
)\\I J
{]] 	
var^^ 
client^^ 
=^^ 
_httpClientFactory^^ +
.^^+ ,
CreateClient^^, 8
(^^8 9
)^^9 :
;^^: ;
client__ 
.__ 
BaseAddress__ 
=__  
new__! $
Uri__% (
(__( )
_configuration__) 7
[__7 8
SystemConstants__8 G
.__G H
AppSettings__H S
.__S T
BaseAddress__T _
]___ `
)__` a
;__a b
var`` 
sessions`` 
=``  
_httpContextAccessor`` /
.``/ 0
HttpContext``0 ;
.``; <
Session``< C
.``C D
	GetString``D M
(``M N
$str``N U
)``U V
;``V W
clientbb 
.bb !
DefaultRequestHeadersbb (
.bb( )
Authorizationbb) 6
=bb7 8
newbb9 <%
AuthenticationHeaderValuebb= V
(bbV W
$strbbW _
,bb_ `
sessionsbba i
)bbi j
;bbj k
varff 
jsonff 
=ff 
JsonConvertff "
.ff" #
SerializeObjectff# 2
(ff2 3
requestff3 :
)ff: ;
;ff; <
varhh 
httpContenthh 
=hh 
newhh !
StringContenthh" /
(hh/ 0
jsonhh0 4
,hh4 5
Encodinghh6 >
.hh> ?
UTF8hh? C
,hhC D
$strhhE W
)hhW X
;hhX Y
varkk 
responsekk 
=kk 
awaitkk  
clientkk! '
.kk' (
PutAsynckk( 0
(kk0 1
$"kk1 3
$strkk3 @
"kk@ A
,kkA B
httpContentkkC N
)kkN O
;kkO P
varll 
resultll 
=ll 
awaitll 
responsell '
.ll' (
Contentll( /
.ll/ 0
ReadAsStringAsyncll0 A
(llA B
)llB C
;llC D
ifmm 
(mm 
responsemm 
.mm 
IsSuccessStatusCodemm ,
)mm, -
returnnn 
JsonConvertnn "
.nn" #
DeserializeObjectnn# 4
<nn4 5
intnn5 8
>nn8 9
(nn9 :
resultnn: @
)nn@ A
;nnA B
returnpp 
JsonConvertpp 
.pp 
DeserializeObjectpp 0
<pp0 1
intpp1 4
>pp4 5
(pp5 6
resultpp6 <
)pp< =
;pp= >
}qq 	
publicss 
asyncss 
Taskss 
<ss 
	ProductVmss #
>ss# $
GetByIdss% ,
(ss, -
intss- 0
idss1 3
,ss3 4
stringss5 ;

LanguageIdss< F
)ssF G
{tt 	
varuu 
sessionsuu 
=uu  
_httpContextAccessoruu /
.vv 
HttpContextvv 
.ww 
Sessionww 
.xx 
	GetStringxx 
(xx 
SystemConstantsxx ,
.xx, -
AppSettingsxx- 8
.xx8 9
Tokenxx9 >
)xx> ?
;xx? @
varzz 
clientzz 
=zz 
_httpClientFactoryzz +
.zz+ ,
CreateClientzz, 8
(zz8 9
)zz9 :
;zz: ;
client{{ 
.{{ 
BaseAddress{{ 
={{  
new{{! $
Uri{{% (
({{( )
_configuration{{) 7
[{{7 8
SystemConstants{{8 G
.{{G H
AppSettings{{H S
.{{S T
BaseAddress{{T _
]{{_ `
){{` a
;{{a b
client|| 
.|| !
DefaultRequestHeaders|| (
.||( )
Authorization||) 6
=||7 8
new||9 <%
AuthenticationHeaderValue||= V
(||V W
$str||W _
,||_ `
sessions||a i
)||i j
;||j k
var}} 
response}} 
=}} 
await}}  
client}}! '
.}}' (
GetAsync}}( 0
(}}0 1
$"}}1 3
$str}}3 A
{}}A B
id}}B D
}}}D E
$str}}E F
{}}F G

LanguageId}}G Q
}}}Q R
"}}R S
)}}S T
;}}T U
var~~ 
body~~ 
=~~ 
await~~ 
response~~ %
.~~% &
Content~~& -
.~~- .
ReadAsStringAsync~~. ?
(~~? @
)~~@ A
;~~A B
if 
( 
response 
. 
IsSuccessStatusCode ,
), -
{
�� 
	ProductVm
�� #
myDeserializedObjList
�� /
=
��0 1
(
��2 3
	ProductVm
��3 <
)
��< =
JsonConvert
��= H
.
��H I
DeserializeObject
��I Z
(
��Z [
body
��[ _
,
��_ `
typeof
��a g
(
��g h
	ProductVm
��h q
)
��q r
)
��r s
;
��s t
return
�� #
myDeserializedObjList
�� ,
;
��, -
}
�� 
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
	ProductVm
��1 :
>
��: ;
(
��; <
body
��< @
)
��@ A
;
��A B
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
Delete
��  &
(
��& '
int
��' *
Id
��+ -
)
��- .
{
�� 	
var
�� 
sessions
�� 
=
�� "
_httpContextAccessor
�� /
.
��/ 0
HttpContext
��0 ;
.
��; <
Session
��< C
.
��C D
	GetString
��D M
(
��M N
$str
��N U
)
��U V
;
��V W
var
�� 
client
�� 
=
��  
_httpClientFactory
�� +
.
��+ ,
CreateClient
��, 8
(
��8 9
)
��9 :
;
��: ;
client
�� 
.
�� 
BaseAddress
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_configuration
��) 7
[
��7 8
$str
��8 E
]
��E F
)
��F G
;
��G H
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Authorization
��) 6
=
��7 8
new
��9 <'
AuthenticationHeaderValue
��= V
(
��V W
$str
��W _
,
��_ `
sessions
��a i
)
��i j
;
��j k
var
�� 
response
�� 
=
�� 
await
��  
client
��! '
.
��' (
DeleteAsync
��( 3
(
��3 4
$"
��4 6
$str
��6 D
{
��D E
Id
��E G
}
��G H
"
��H I
)
��I J
;
��J K
var
�� 
body
�� 
=
�� 
await
�� 
response
�� %
.
��% &
Content
��& -
.
��- .
ReadAsStringAsync
��. ?
(
��? @
)
��@ A
;
��A B
if
�� 
(
�� 
response
�� 
.
�� !
IsSuccessStatusCode
�� ,
)
��, -
return
�� 
JsonConvert
�� "
.
��" #
DeserializeObject
��# 4
<
��4 5
bool
��5 9
>
��9 :
(
��: ;
body
��; ?
)
��? @
;
��@ A
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
bool
��1 5
>
��5 6
(
��6 7
body
��7 ;
)
��; <
;
��< =
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
UpdatePrice
��  +
(
��+ ,
int
��, /
	ProductId
��0 9
,
��9 :
decimal
��; B
newPrice
��C K
)
��K L
{
�� 	
var
�� 
sessions
�� 
=
�� "
_httpContextAccessor
�� /
.
��/ 0
HttpContext
��0 ;
.
��; <
Session
��< C
.
��C D
	GetString
��D M
(
��M N
$str
��N U
)
��U V
;
��V W
var
�� 
client
�� 
=
��  
_httpClientFactory
�� +
.
��+ ,
CreateClient
��, 8
(
��8 9
)
��9 :
;
��: ;
client
�� 
.
�� 
BaseAddress
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_configuration
��) 7
[
��7 8
$str
��8 E
]
��E F
)
��F G
;
��G H
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Authorization
��) 6
=
��7 8
new
��9 <'
AuthenticationHeaderValue
��= V
(
��V W
$str
��W _
,
��_ `
sessions
��a i
)
��i j
;
��j k
var
�� 
response
�� 
=
�� 
await
��  
client
��! '
.
��' (

PatchAsync
��( 2
(
��2 3
$"
��3 5
$str
��5 C
{
��C D
	ProductId
��D M
}
��M N
$str
��N O
{
��O P
newPrice
��P X
}
��X Y
"
��Y Z
,
��Z [
null
��\ `
)
��` a
;
��a b
var
�� 
result
�� 
=
�� 
await
�� 
response
�� '
.
��' (
Content
��( /
.
��/ 0
ReadAsStringAsync
��0 A
(
��A B
)
��B C
;
��C D
if
�� 
(
�� 
response
�� 
.
�� !
IsSuccessStatusCode
�� ,
)
��, -
return
�� 
JsonConvert
�� "
.
��" #
DeserializeObject
��# 4
<
��4 5
bool
��5 9
>
��9 :
(
��: ;
result
��; A
)
��A B
;
��B C
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
bool
��1 5
>
��5 6
(
��6 7
result
��7 =
)
��= >
;
��> ?
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
UpdateStock
��  +
(
��+ ,
int
��, /
	ProductId
��0 9
,
��9 :
int
��; >
newStock
��? G
)
��G H
{
�� 	
var
�� 
sessions
�� 
=
�� "
_httpContextAccessor
�� /
.
��/ 0
HttpContext
��0 ;
.
��; <
Session
��< C
.
��C D
	GetString
��D M
(
��M N
$str
��N U
)
��U V
;
��V W
var
�� 
client
�� 
=
��  
_httpClientFactory
�� +
.
��+ ,
CreateClient
��, 8
(
��8 9
)
��9 :
;
��: ;
client
�� 
.
�� 
BaseAddress
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_configuration
��) 7
[
��7 8
$str
��8 E
]
��E F
)
��F G
;
��G H
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Authorization
��) 6
=
��7 8
new
��9 <'
AuthenticationHeaderValue
��= V
(
��V W
$str
��W _
,
��_ `
sessions
��a i
)
��i j
;
��j k
var
�� 
response
�� 
=
�� 
await
��  
client
��! '
.
��' (

PatchAsync
��( 2
(
��2 3
$"
��3 5
$str
��5 C
{
��C D
	ProductId
��D M
}
��M N
$str
��N U
{
��U V
newStock
��V ^
}
��^ _
"
��_ `
,
��` a
null
��b f
)
��f g
;
��g h
var
�� 
result
�� 
=
�� 
await
�� 
response
�� '
.
��' (
Content
��( /
.
��/ 0
ReadAsStringAsync
��0 A
(
��A B
)
��B C
;
��C D
if
�� 
(
�� 
response
�� 
.
�� !
IsSuccessStatusCode
�� ,
)
��, -
return
�� 
JsonConvert
�� "
.
��" #
DeserializeObject
��# 4
<
��4 5
bool
��5 9
>
��9 :
(
��: ;
result
��; A
)
��A B
;
��B C
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
bool
��1 5
>
��5 6
(
��6 7
result
��7 =
)
��= >
;
��> ?
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
CreateImage
��  +
(
��+ ,'
ProductImageCreateRequest
��, E
request
��F M
)
��M N
{
�� 	
var
�� 
sessions
�� 
=
�� "
_httpContextAccessor
�� /
.
��/ 0
HttpContext
��0 ;
.
��; <
Session
��< C
.
��C D
	GetString
��D M
(
��M N
$str
��N U
)
��U V
;
��V W
var
�� 
client
�� 
=
��  
_httpClientFactory
�� +
.
��+ ,
CreateClient
��, 8
(
��8 9
)
��9 :
;
��: ;
client
�� 
.
�� 
BaseAddress
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_configuration
��) 7
[
��7 8
$str
��8 E
]
��E F
)
��F G
;
��G H
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Authorization
��) 6
=
��7 8
new
��9 <'
AuthenticationHeaderValue
��= V
(
��V W
$str
��W _
,
��_ `
sessions
��a i
)
��i j
;
��j k
var
�� 
requestContent
�� 
=
��  
new
��! $&
MultipartFormDataContent
��% =
(
��= >
)
��> ?
;
��? @
if
�� 
(
�� 
request
�� 
.
�� 
	ImageFile
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
byte
�� 
[
�� 
]
�� 
data
�� 
;
�� 
using
�� 
(
�� 
var
�� 
br
�� 
=
�� 
new
��  #
BinaryReader
��$ 0
(
��0 1
request
��1 8
.
��8 9
	ImageFile
��9 B
.
��B C
OpenReadStream
��C Q
(
��Q R
)
��R S
)
��S T
)
��T U
{
�� 
data
�� 
=
�� 
br
�� 
.
�� 
	ReadBytes
�� '
(
��' (
(
��( )
int
��) ,
)
��, -
request
��- 4
.
��4 5
	ImageFile
��5 >
.
��> ?
OpenReadStream
��? M
(
��M N
)
��N O
.
��O P
Length
��P V
)
��V W
;
��W X
}
�� 
ByteArrayContent
��  
bytes
��! &
=
��' (
new
��) ,
ByteArrayContent
��- =
(
��= >
data
��> B
)
��B C
;
��C D
requestContent
�� 
.
�� 
Add
�� "
(
��" #
bytes
��# (
,
��( )
$str
��* 5
,
��5 6
request
��7 >
.
��> ?
	ImageFile
��? H
.
��H I
FileName
��I Q
)
��Q R
;
��R S
}
�� 
if
�� 
(
�� 
request
�� 
.
�� 
Caption
�� 
!=
��  
null
��  $
)
��$ %
requestContent
�� 
.
�� 
Add
�� 
(
�� 
new
�� "
StringContent
��# 0
(
��0 1
request
��1 8
.
��8 9
Caption
��9 @
.
��@ A
ToString
��A I
(
��I J
)
��J K
)
��K L
,
��L M
$str
��N W
)
��W X
;
��X Y
requestContent
�� 
.
�� 
Add
�� 
(
�� 
new
�� "
StringContent
��# 0
(
��0 1
request
��1 8
.
��8 9
	SortOrder
��9 B
.
��B C
ToString
��C K
(
��K L
)
��L M
)
��M N
,
��N O
$str
��P [
)
��[ \
;
��\ ]
requestContent
�� 
.
�� 
Add
�� 
(
�� 
new
�� "
StringContent
��# 0
(
��0 1
request
��1 8
.
��8 9
	Isdefault
��9 B
.
��B C
ToString
��C K
(
��K L
)
��L M
)
��M N
,
��N O
$str
��P [
)
��[ \
;
��\ ]
requestContent
�� 
.
�� 
Add
�� 
(
�� 
new
�� "
StringContent
��# 0
(
��0 1
request
��1 8
.
��8 9
	ProductId
��9 B
.
��B C
ToString
��C K
(
��K L
)
��L M
)
��M N
,
��N O
$str
��P [
)
��[ \
;
��\ ]
var
�� 
response
�� 
=
�� 
await
��  
client
��! '
.
��' (
	PostAsync
��( 1
(
��1 2
$"
��2 4
$str
��4 H
"
��H I
,
��I J
requestContent
��K Y
)
��Y Z
;
��Z [
return
�� 
response
�� 
.
�� !
IsSuccessStatusCode
�� /
;
��/ 0
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
int
�� 
>
�� 
UpDateImage
�� *
(
��* +'
ProductImageUpdateRequest
��+ D
request
��E L
)
��L M
{
�� 	
var
�� 
sessions
�� 
=
�� "
_httpContextAccessor
�� /
.
��/ 0
HttpContext
��0 ;
.
��; <
Session
��< C
.
��C D
	GetString
��D M
(
��M N
$str
��N U
)
��U V
;
��V W
var
�� 
client
�� 
=
��  
_httpClientFactory
�� +
.
��+ ,
CreateClient
��, 8
(
��8 9
)
��9 :
;
��: ;
client
�� 
.
�� 
BaseAddress
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_configuration
��) 7
[
��7 8
$str
��8 E
]
��E F
)
��F G
;
��G H
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Authorization
��) 6
=
��7 8
new
��9 <'
AuthenticationHeaderValue
��= V
(
��V W
$str
��W _
,
��_ `
sessions
��a i
)
��i j
;
��j k
var
�� 
response
�� 
=
�� 
await
��  
client
��! '
.
��' (
PutAsync
��( 0
(
��0 1
$"
��1 3
$str
��3 H
{
��H I
request
��I P
.
��P Q
Id
��Q S
}
��S T
"
��T U
,
��U V
null
��W [
)
��[ \
;
��\ ]
var
�� 
result
�� 
=
�� 
await
�� 
response
�� '
.
��' (
Content
��( /
.
��/ 0
ReadAsStringAsync
��0 A
(
��A B
)
��B C
;
��C D
if
�� 
(
�� 
response
�� 
.
�� !
IsSuccessStatusCode
�� ,
)
��, -
return
�� 
JsonConvert
�� "
.
��" #
DeserializeObject
��# 4
<
��4 5
int
��5 8
>
��8 9
(
��9 :
result
��: @
)
��@ A
;
��A B
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
int
��1 4
>
��4 5
(
��5 6
result
��6 <
)
��< =
;
��= >
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ProductImageVm
�� (
>
��( )
GetImageById
��* 6
(
��6 7
int
��7 :
imageId
��; B
)
��B C
{
�� 	
var
�� 
sessions
�� 
=
�� "
_httpContextAccessor
�� /
.
�� 
HttpContext
�� 
.
�� 
Session
�� 
.
�� 
	GetString
�� 
(
�� 
SystemConstants
�� ,
.
��, -
AppSettings
��- 8
.
��8 9
Token
��9 >
)
��> ?
;
��? @
var
�� 
client
�� 
=
��  
_httpClientFactory
�� +
.
��+ ,
CreateClient
��, 8
(
��8 9
)
��9 :
;
��: ;
client
�� 
.
�� 
BaseAddress
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_configuration
��) 7
[
��7 8
SystemConstants
��8 G
.
��G H
AppSettings
��H S
.
��S T
BaseAddress
��T _
]
��_ `
)
��` a
;
��a b
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Authorization
��) 6
=
��7 8
new
��9 <'
AuthenticationHeaderValue
��= V
(
��V W
$str
��W _
,
��_ `
sessions
��a i
)
��i j
;
��j k
var
�� 
response
�� 
=
�� 
await
��  
client
��! '
.
��' (
GetAsync
��( 0
(
��0 1
$"
��1 3
$str
��3 H
{
��H I
imageId
��I P
}
��P Q
"
��Q R
)
��R S
;
��S T
var
�� 
body
�� 
=
�� 
await
�� 
response
�� %
.
��% &
Content
��& -
.
��- .
ReadAsStringAsync
��. ?
(
��? @
)
��@ A
;
��A B
if
�� 
(
�� 
response
�� 
.
�� !
IsSuccessStatusCode
�� ,
)
��, -
{
�� 
ProductImageVm
�� #
myDeserializedObjList
�� 4
=
��5 6
(
��7 8
ProductImageVm
��8 F
)
��F G
JsonConvert
��G R
.
��R S
DeserializeObject
��S d
(
��d e
body
��e i
,
��i j
typeof
��k q
(
��q r
ProductImageVm��r �
)��� �
)��� �
;��� �
return
�� #
myDeserializedObjList
�� ,
;
��, -
}
�� 
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
ProductImageVm
��1 ?
>
��? @
(
��@ A
body
��A E
)
��E F
;
��F G
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
	ApiResult
�� #
<
��# $
bool
��$ (
>
��( )
>
��) *
CategoryAssign
��+ 9
(
��9 :
int
��: =
id
��> @
,
��@ A#
CategoryAssignRequest
��B W
request
��X _
)
��_ `
{
�� 	
var
�� 
client
�� 
=
��  
_httpClientFactory
�� +
.
��+ ,
CreateClient
��, 8
(
��8 9
)
��9 :
;
��: ;
client
�� 
.
�� 
BaseAddress
�� 
=
��  
new
��! $
Uri
��% (
(
��( )
_configuration
��) 7
[
��7 8
$str
��8 E
]
��E F
)
��F G
;
��G H
var
�� 
sessions
�� 
=
�� "
_httpContextAccessor
�� /
.
��/ 0
HttpContext
��0 ;
.
��; <
Session
��< C
.
��C D
	GetString
��D M
(
��M N
$str
��N U
)
��U V
;
��V W
client
�� 
.
�� #
DefaultRequestHeaders
�� (
.
��( )
Authorization
��) 6
=
��7 8
new
��9 <'
AuthenticationHeaderValue
��= V
(
��V W
$str
��W _
,
��_ `
sessions
��a i
)
��i j
;
��j k
var
�� 
json
�� 
=
�� 
JsonConvert
�� "
.
��" #
SerializeObject
��# 2
(
��2 3
request
��3 :
)
��: ;
;
��; <
var
�� 
httpContent
�� 
=
�� 
new
�� !
StringContent
��" /
(
��/ 0
json
��0 4
,
��4 5
Encoding
��6 >
.
��> ?
UTF8
��? C
,
��C D
$str
��E W
)
��W X
;
��X Y
var
�� 
response
�� 
=
�� 
await
��  
client
��! '
.
��' (
PutAsync
��( 0
(
��0 1
$"
��1 3
$str
��3 A
{
��A B
id
��B D
}
��D E
$str
��E P
"
��P Q
,
��Q R
httpContent
��S ^
)
��^ _
;
��_ `
var
�� 
result
�� 
=
�� 
await
�� 
response
�� '
.
��' (
Content
��( /
.
��/ 0
ReadAsStringAsync
��0 A
(
��A B
)
��B C
;
��C D
if
�� 
(
�� 
response
�� 
.
�� !
IsSuccessStatusCode
�� ,
)
��, -
return
�� 
JsonConvert
�� "
.
��" #
DeserializeObject
��# 4
<
��4 5
ApiSuccessResult
��5 E
<
��E F
bool
��F J
>
��J K
>
��K L
(
��L M
result
��M S
)
��S T
;
��T U
return
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� 0
<
��0 1
ApiErrorResult
��1 ?
<
��? @
bool
��@ D
>
��D E
>
��E F
(
��F G
result
��G M
)
��M N
;
��N O
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
	ProductVm
�� (
>
��( )
>
��) *!
GetFeaturedProducts
��+ >
(
��> ?
int
��? B
take
��C G
,
��G H
string
��I O

languageId
��P Z
)
��Z [
{
�� 	
var
�� 
data
�� 
=
�� 
await
�� 
GetAsync
�� %
<
��% &
List
��& *
<
��* +
	ProductVm
��+ 4
>
��4 5
>
��5 6
(
��6 7
$"
��7 9
$str
��9 P
{
��P Q

languageId
��Q [
}
��[ \
$str
��\ ]
{
��] ^
take
��^ b
}
��b c
"
��c d
)
��d e
;
��e f
return
�� 
data
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
	ProductVm
�� (
>
��( )
>
��) *
GetLatestProducts
��+ <
(
��< =
int
��= @
take
��A E
,
��E F
string
��G M

languageId
��N X
)
��X Y
{
�� 	
var
�� 
data
�� 
=
�� 
await
�� 
GetAsync
�� %
<
��% &
List
��& *
<
��* +
	ProductVm
��+ 4
>
��4 5
>
��5 6
(
��6 7
$"
��7 9
$str
��9 N
{
��N O

languageId
��O Y
}
��Y Z
$str
��Z [
{
��[ \
take
��\ `
}
��` a
"
��a b
)
��b c
;
��c d
return
�� 
data
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ProductDetails
�� (
>
��( )
GetProductDetails
��* ;
(
��; <
int
��< ?
	productId
��@ I
,
��I J
string
��K Q

languageId
��R \
)
��\ ]
{
�� 	
var
�� 
data
�� 
=
�� 
await
�� 
GetAsync
�� %
<
��% &
ProductDetails
��& 4
>
��4 5
(
��5 6
$"
��6 8
$str
��8 N
{
��N O
	productId
��O X
}
��X Y
$str
��Y Z
{
��Z [

languageId
��[ e
}
��e f
"
��f g
)
��g h
;
��h i
return
�� 
data
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
	ProductVm
�� (
>
��( )
>
��) *
GetRelatedProduct
��+ <
(
��< =
int
��= @
	productId
��A J
,
��J K
string
��L R

languageId
��S ]
,
��] ^
int
��_ b
take
��c g
)
��g h
{
�� 	
var
�� 
data
�� 
=
�� 
await
�� 
GetAsync
�� %
<
��% &
List
��& *
<
��* +
	ProductVm
��+ 4
>
��4 5
>
��5 6
(
��6 7
$"
��7 9
$str
��9 O
{
��O P
	productId
��P Y
}
��Y Z
$str
��Z [
{
��[ \
take
��\ `
}
��` a
$str
��a b
{
��b c

languageId
��c m
}
��m n
"
��n o
)
��o p
;
��p q
return
�� 
data
�� 
;
�� 
}
�� 	
}
�� 
}�� � 
]F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\RoleApiClient.cs
	namespace 	
eShopSolution
 
. 
ApiIntergration '
{ 
public 

class 
RoleApiClient 
:  
IRoleApiClient! /
{ 
private 
readonly 
IHttpClientFactory +
_httpClientFactory, >
;> ?
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
RoleApiClient 
( 
IHttpClientFactory /
httpClientFactory0 A
,A B 
IHttpContextAccessorC W
httpContextAccessorX k
,k l
IConfigurationm {
configuration	| �
)
� �
{ 	
_httpClientFactory 
=  
httpClientFactory! 2
;2 3
_configuration 
= 
configuration *
;* + 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
} 	
public 
async 
Task 
< 
	ApiResult #
<# $
List$ (
<( )
RoleVm) /
>/ 0
>0 1
>1 2
GetAll3 9
(9 :
): ;
{ 	
var 
sessions 
=  
_httpContextAccessor /
./ 0
HttpContext0 ;
.; <
Session< C
.C D
	GetStringD M
(M N
$strN U
)U V
;V W
var 
client 
= 
_httpClientFactory +
.+ ,
CreateClient, 8
(8 9
)9 :
;: ;
client   
.   
BaseAddress   
=    
new  ! $
Uri  % (
(  ( )
_configuration  ) 7
[  7 8
$str  8 E
]  E F
)  F G
;  G H
client!! 
.!! !
DefaultRequestHeaders!! (
.!!( )
Authorization!!) 6
=!!7 8
new!!9 <%
AuthenticationHeaderValue!!= V
(!!V W
$str!!W _
,!!_ `
sessions!!a i
)!!i j
;!!j k
var"" 
response"" 
="" 
await""  
client""! '
.""' (
GetAsync""( 0
(""0 1
$"""1 3
$str""3 =
"""= >
)""> ?
;""? @
var## 
body## 
=## 
await## 
response## %
.##% &
Content##& -
.##- .
ReadAsStringAsync##. ?
(##? @
)##@ A
;##A B
if$$ 
($$ 
response$$ 
.$$ 
IsSuccessStatusCode$$ ,
)$$, -
{%% 
List&& 
<&& 
RoleVm&& 
>&& !
myDeserializedObjList&& 2
=&&3 4
(&&5 6
List&&6 :
<&&: ;
RoleVm&&; A
>&&A B
)&&B C
JsonConvert&&C N
.&&N O
DeserializeObject&&O `
(&&` a
body&&a e
,&&e f
typeof&&g m
(&&m n
List&&n r
<&&r s
RoleVm&&s y
>&&y z
)&&z {
)&&{ |
;&&| }
return'' 
new'' 
ApiSuccessResult'' +
<''+ ,
List'', 0
<''0 1
RoleVm''1 7
>''7 8
>''8 9
(''9 :!
myDeserializedObjList'': O
)''O P
;''P Q
}(( 
return)) 
JsonConvert)) 
.)) 
DeserializeObject)) 0
<))0 1
ApiErrorResult))1 ?
<))? @
List))@ D
<))D E
RoleVm))E K
>))K L
>))L M
>))M N
())N O
body))O S
)))S T
;))T U
}** 	
}++ 
},, �

^F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\SlideApiClient.cs
	namespace

 	
eShopSolution


 
.

 
ApiIntergration

 '
{ 
public 

class 
SlideApiClient 
:  !
BaseApiClient" /
,/ 0
ISlideApiClient1 @
{ 
public 
SlideApiClient 
( 
IHttpClientFactory 0
httpClientFactory1 B
,B C 
IHttpContextAccessor '
httpContextAccessor( ;
,; <
IConfiguration "
configuration# 0
)0 1
:2 3
base4 8
(8 9
httpClientFactory9 J
,J K
httpContextAccessorL _
,_ `
configurationa n
)n o
{ 	
} 	
public 
async 
Task 
< 
List 
< 
SlideVm &
>& '
>' (
GetAll) /
(/ 0
)0 1
{ 	
return 
await 
GetAsync !
<! "
List" &
<& '
SlideVm' .
>. /
>/ 0
(0 1
$str1 >
)> ?
;? @
} 	
} 
} �0
]F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.ApiIntergration\UserApiClient.cs
	namespace		 	
eShopSolution		
 
.		 
ApiIntergration		 '
{

 
public 

class 
UserApiClient 
:  
BaseApiClient! .
,. /
IUserApiClient0 >
{ 
public 
UserApiClient 
( 
IHttpClientFactory /
httpClientFactory0 A
,A B 
IHttpContextAccessorC W
httpContextAccessorX k
,k l
IConfigurationm {
configuration	| �
)
� �
: 
base 
( 
httpClientFactory $
,$ %
httpContextAccessor& 9
,9 :
configuration; H
)H I
{ 	
} 	
public 
async 
Task 
< 
	ApiResult #
<# $
string$ *
>* +
>+ ,
Authenticate- 9
(9 :
LoginRequest: F
requestG N
)N O
{ 	
var 
data 
= 
await 
	PostAsync &
<& '
	ApiResult' 0
<0 1
string1 7
>7 8
>8 9
(9 :
$str: S
,S T
requestU \
)\ ]
;] ^
return 
data 
; 
} 	
public 
async 
Task 
< 
	ApiResult #
<# $
bool$ (
>( )
>) *
Delete+ 1
(1 2
Guid2 6
Id7 9
)9 :
{ 	
var 
data 
= 
await 
DeleteAsync (
<( )
	ApiResult) 2
<2 3
bool3 7
>7 8
>8 9
(9 :
$": <
$str< G
{G H
IdH J
}J K
"K L
)L M
;M N
return 
data 
; 
}   	
public## 
async## 
Task## 
<## 
	ApiResult## #
<### $
UserVm##$ *
>##* +
>##+ ,
GetById##- 4
(##4 5
Guid##5 9
id##: <
)##< =
{$$ 	
var%% 
data%% 
=%% 
await%% 
GetAsync%% %
<%%% &
	ApiResult%%& /
<%%/ 0
UserVm%%0 6
>%%6 7
>%%7 8
(%%8 9
$"%%9 ;
$str%%; F
{%%F G
id%%G I
}%%I J
"%%J K
)%%K L
;%%L M
return&& 
data&& 
;&& 
}'' 	
public** 
async** 
Task** 
<** 
	ApiResult** #
<**# $
PagedResult**$ /
<**/ 0
UserVm**0 6
>**6 7
>**7 8
>**8 9
GetUsersPagings**: I
(**I J 
GetUserPagingRequest**J ^
request**_ f
)**f g
{++ 	
var,, 
data,, 
=,, 
await,, 
GetAsync,, %
<,,% &
	ApiResult,,& /
<,,/ 0
PagedResult,,0 ;
<,,; <
UserVm,,< B
>,,B C
>,,C D
>,,D E
(,,E F
$",,F H
$str,,H d
",,d e
+,,f g
$"-- 
{-- 
request-- 
.-- 
	PageIndex-- $
}--$ %
$str--% /
{--/ 0
request--0 7
.--7 8
PageSize--8 @
}--@ A
$str--A J
{--J K
request--K R
.--R S
KeyWord--S Z
}--Z [
"--[ \
)--\ ]
;--] ^
return.. 
data.. 
;.. 
}// 	
public22 
async22 
Task22 
<22 
	ApiResult22 #
<22# $
bool22$ (
>22( )
>22) *
RegisterUser22+ 7
(227 8
RegisterRequest228 G
request22H O
)22O P
{33 	
var44 
data44 
=44 
await44 
	PostAsync44 &
<44& '
	ApiResult44' 0
<440 1
bool441 5
>445 6
>446 7
(447 8
$str448 D
,44D E
request44F M
)44M N
;44N O
return66 
data66 
;66 
}77 	
public:: 
async:: 
Task:: 
<:: 
	ApiResult:: #
<::# $
bool::$ (
>::( )
>::) *

RoleAssign::+ 5
(::5 6
Guid::6 :
Id::; =
,::= >
RoleAssignRequest::? P
request::Q X
)::X Y
{;; 	
var<< 
data<< 
=<< 
await<< 
PutAsync<< %
<<<% &
	ApiResult<<& /
<<</ 0
bool<<0 4
><<4 5
><<5 6
(<<6 7
$"<<7 9
$str<<9 D
{<<D E
Id<<E G
}<<G H
$str<<H N
"<<N O
,<<O P
request<<Q X
)<<X Y
;<<Y Z
return== 
data== 
;== 
}>> 	
publicAA 
asyncAA 
TaskAA 
<AA 
	ApiResultAA #
<AA# $
boolAA$ (
>AA( )
>AA) *

UpdateUserAA+ 5
(AA5 6
GuidAA6 :
idAA; =
,AA= >
UserUpdateRequestAA? P
requestAAQ X
)AAX Y
{BB 	
varCC 
dataCC 
=CC 
awaitCC 
PutAsyncCC %
<CC% &
	ApiResultCC& /
<CC/ 0
boolCC0 4
>CC4 5
>CC5 6
(CC6 7
$"CC7 9
$strCC9 D
{CCD E
idCCE G
}CCG H
"CCH I
,CCI J
requestCCK R
)CCR S
;CCS T
returnDD 
dataDD 
;DD 
}EE 	
}FF 
}GG 