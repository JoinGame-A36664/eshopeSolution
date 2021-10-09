ã
kF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\CategoriesController.cs
	namespace		 	
eShopSolution		
 
.		 

BackendApi		 "
.		" #
Controllers		# .
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class  
CategoriesController %
:& '
ControllerBase( 6
{ 
private 
readonly 
ICategoryService )
_categoryService* :
;: ;
public  
CategoriesController #
(# $
ICategoryService$ 4
categoryService5 D
)D E
{ 	
_categoryService 
= 
categoryService .
;. /
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAllPaging) 5
(5 6
string6 <

languageId= G
)G H
{ 	
var 
products 
= 
await  
_categoryService! 1
.1 2
GetAll2 8
(8 9

languageId9 C
)C D
;D E
return 
Ok 
( 
products 
) 
;  
} 	
} 
} ã
eF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\HomeController.cs
	namespace

 	
eShopSolution


 
.

 

BackendApi

 "
.

" #
Controllers

# .
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
private 
readonly 
ILogger  
<  !
HomeController! /
>/ 0
_logger1 8
;8 9
public 
HomeController 
( 
ILogger %
<% &
HomeController& 4
>4 5
logger6 <
)< =
{ 	
_logger 
= 
logger 
; 
} 	
public 
IActionResult 
Index "
(" #
)# $
{ 	
return 
Ok 
( 
) 
; 
} 	
} 
} €
iF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\LanguageController.cs
	namespace		 	
eShopSolution		
 
.		 

BackendApi		 "
.		" #
Controllers		# .
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
LanguagesController $
:% &
ControllerBase' 5
{ 
private 
readonly 
ILanguageService )
_languageService* :
;: ;
public 
LanguagesController "
(" #
ILanguageService 
languageService ,
), -
{ 	
_languageService 
= 
languageService .
;. /
} 	
[ 	
HttpGet	 
( 
) 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
var 
products 
= 
await  
_languageService! 1
.1 2
GetAll2 8
(8 9
)9 :
;: ;
return 
Ok 
( 
products 
) 
;  
} 	
} 
} ´
gF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\OrdersController.cs
	namespace

 	
eShopSolution


 
.

 

BackendApi

 "
.

" #
Controllers

# .
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
OrdersController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
IOrderService &
_orderService' 4
;4 5
public 
OrdersController 
(  
IOrderService  -
orderService. :
): ;
{ 	
_orderService 
= 
orderService (
;( )
} 	
[ 	
HttpPost	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
Create) /
(/ 0
CheckoutRequest1 @
requestA H
)H I
{ 	
if 
( 
! 

ModelState 
. 
IsValid #
)# $
{   
return!! 

BadRequest!! !
(!!! "

ModelState!!" ,
)!!, -
;!!- .
}"" 
var$$ 
order$$ 
=$$ 
await$$ 
_orderService$$ +
.$$+ ,
CreateOrder$$, 7
($$7 8
request$$8 ?
)$$? @
;$$@ A
if%% 
(%% 
order%% 
==%% 
$num%% 
)%% 
return&& 

BadRequest&& !
(&&! "
)&&" #
;&&# $
return)) 
Ok)) 
()) 
order)) 
))) 
;)) 
}** 	
}-- 
}.. ô¶
iF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\ProductsController.cs
	namespace 	
eShopSolution
 
. 

BackendApi "
." #
Controllers# .
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
ProductsController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IProductService (
_ProductService) 8
;8 9
public 
ProductsController !
(! "
IProductService" 1
productService2 @
)@ A
{   	
_ProductService!! 
=!! 
productService!! ,
;!!, -
}"" 	
[$$ 	
HttpGet$$	 
($$ 
$str$$ 
)$$ 
]$$ 
[%% 	
AllowAnonymous%%	 
]%% 
public&& 
async&& 
Task&& 
<&& 
IActionResult&& '
>&&' (
GetAllPaging&&) 5
(&&5 6
[&&6 7
	FromQuery&&7 @
]&&@ A)
GetManageProductPagingRequest&&B _
request&&` g
)&&g h
{'' 	
var(( 
products(( 
=(( 
await((  
_ProductService((! 0
.((0 1
GetAllPaging((1 =
(((= >
request((> E
)((E F
;((F G
return)) 
Ok)) 
()) 
products)) 
))) 
;))  
}** 	
[11 	
HttpGet11	 
(11 
$str11 +
)11+ ,
]11, -
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (
GetById22) 0
(220 1
int221 4
	productId225 >
,22> ?
string22@ F

languageId22G Q
)22Q R
{33 	
var44 
Product44 
=44 
await44 
_ProductService44  /
.44/ 0
GetById440 7
(447 8
	productId448 A
,44A B

languageId44C M
)44M N
;44N O
if55 
(55 
Product55 
==55 
null55 
)55  
return66 

BadRequest66 !
(66! "
$str66" 7
)667 8
;668 9
return77 
Ok77 
(77 
Product77 
)77 
;77 
}88 	
[:: 	
AllowAnonymous::	 
]:: 
[;; 	
HttpGet;;	 
(;; 
$str;; /
);;/ 0
];;0 1
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
GetFeaturedProducts<<) <
(<<< =
int<<= @
take<<A E
,<<E F
string<<G M

languageId<<N X
)<<X Y
{== 	
var>> 
Products>> 
=>> 
await>>  
_ProductService>>! 0
.>>0 1
GetFeaturedProducts>>1 D
(>>D E

languageId>>E O
,>>O P
take>>Q U
)>>U V
;>>V W
return@@ 
Ok@@ 
(@@ 
Products@@ 
)@@ 
;@@  
}AA 	
[CC 	
AllowAnonymousCC	 
]CC 
[DD 	
HttpGetDD	 
(DD 
$strDD -
)DD- .
]DD. /
publicEE 
asyncEE 
TaskEE 
<EE 
IActionResultEE '
>EE' (
GetLatestProductsEE) :
(EE: ;
intEE; >
takeEE? C
,EEC D
stringEEE K

languageIdEEL V
)EEV W
{FF 	
varGG 
ProductsGG 
=GG 
awaitGG  
_ProductServiceGG! 0
.GG0 1
GetLatestProductsGG1 B
(GGB C

languageIdGGC M
,GGM N
takeGGO S
)GGS T
;GGT U
returnII 
OkII 
(II 
ProductsII 
)II 
;II  
}JJ 	
[LL 	
AllowAnonymousLL	 
]LL 
[MM 	
HttpGetMM	 
(MM 
$strMM :
)MM: ;
]MM; <
publicNN 
asyncNN 
TaskNN 
<NN 
IActionResultNN '
>NN' (
GetRelatedProductsNN) ;
(NN; <
intNN< ?
	productIdNN@ I
,NNI J
stringNNK Q

languageIdNNR \
,NN\ ]
intNN^ a
takeNNb f
)NNf g
{OO 	
varPP 
ProductsPP 
=PP 
awaitPP  
_ProductServicePP! 0
.PP0 1
GetRelatedProductsPP1 C
(PPC D
	productIdPPD M
,PPM N

languageIdPPO Y
,PPY Z
takePP[ _
)PP_ `
;PP` a
returnRR 
OkRR 
(RR 
ProductsRR 
)RR 
;RR  
}SS 	
[UU 	
AllowAnonymousUU	 
]UU 
[VV 	
HttpGetVV	 
(VV 
$strVV 3
)VV3 4
]VV4 5
publicWW 
asyncWW 
TaskWW 
<WW 
IActionResultWW '
>WW' (
GetDetalisProductWW) :
(WW: ;
intWW; >
	productIdWW? H
,WWH I
stringWWJ P

languageIdWWQ [
)WW[ \
{XX 	
varYY 
productYY 
=YY 
awaitYY 
_ProductServiceYY  /
.YY/ 0
GetByIdYY0 7
(YY7 8
	productIdYY8 A
,YYA B

languageIdYYC M
)YYM N
;YYN O
varZZ 

imagePathsZZ 
=ZZ 
awaitZZ "
_ProductServiceZZ# 2
.ZZ2 3
GetImagePathsZZ3 @
(ZZ@ A
	productIdZZA J
)ZZJ K
;ZZK L
var\\ 
data\\ 
=\\ 
new\\ 
ProductDetails\\ )
(\\) *
)\\* +
{]] 

ImagePaths^^ 
=^^ 

imagePaths^^ '
,^^' (

Categories__ 
=__ 
product__ $
.__$ %

Categories__% /
,__/ 0
DateCreated`` 
=`` 
product`` %
.``% &
DateCreated``& 1
,``1 2
Descriptionaa 
=aa 
productaa %
.aa% &
Descriptionaa& 1
,aa1 2
Detailsbb 
=bb 
productbb !
.bb! "
Detailsbb" )
,bb) *
Idcc 
=cc 
productcc 
.cc 
Idcc 
,cc  

IsFeatureddd 
=dd 
productdd $
.dd$ %

IsFeatureddd% /
,dd/ 0

LanguageIdee 
=ee 
productee $
.ee$ %

LanguageIdee% /
,ee/ 0
Nameff 
=ff 
productff 
.ff 
Nameff #
,ff# $
Pricegg 
=gg 
productgg 
.gg  
Pricegg  %
,gg% &
SeoAliashh 
=hh 
producthh "
.hh" #
SeoAliashh# +
,hh+ ,
SeoDescriptionii 
=ii  
productii! (
.ii( )
SeoDescriptionii) 7
,ii7 8
SeoTitlejj 
=jj 
productjj "
.jj" #
SeoTitlejj# +
,jj+ ,
Stockkk 
=kk 
productkk 
.kk  
Stockkk  %
,kk% &
	ViewCountll 
=ll 
productll #
.ll# $
	ViewCountll$ -
}mm 
;mm 
ifoo 
(oo 
dataoo 
==oo 
nulloo 
)oo 
returnpp 

BadRequestpp !
(pp! "
datapp" &
)pp& '
;pp' (
returnqq 
Okqq 
(qq 
dataqq 
)qq 
;qq 
}rr 	
[tt 	
HttpPosttt	 
]tt 
[uu 	
Consumesuu	 
(uu 
$struu '
)uu' (
]uu( )
publicvv 
asyncvv 
Taskvv 
<vv 
IActionResultvv '
>vv' (
Createvv) /
(vv/ 0
[vv0 1
FromFormvv1 9
]vv9 : 
ProductCreateRequestvv; O
requestvvP W
)vvW X
{ww 	
ifzz 
(zz 
!zz 

ModelStatezz 
.zz 
IsValidzz #
)zz# $
{{{ 
return|| 

BadRequest|| !
(||! "

ModelState||" ,
)||, -
;||- .
}}} 
var 
	productId 
= 
await !
_ProductService" 1
.1 2
Create2 8
(8 9
request9 @
)@ A
;A B
if
ÄÄ 
(
ÄÄ 
	productId
ÄÄ 
==
ÄÄ 
$num
ÄÄ 
)
ÄÄ 
return
ÅÅ 

BadRequest
ÅÅ !
(
ÅÅ! "
)
ÅÅ" #
;
ÅÅ# $
var
ÑÑ 
product
ÑÑ 
=
ÑÑ 
await
ÑÑ 
_ProductService
ÑÑ  /
.
ÑÑ/ 0
GetById
ÑÑ0 7
(
ÑÑ7 8
	productId
ÑÑ8 A
,
ÑÑA B
request
ÑÑC J
.
ÑÑJ K

LanguageId
ÑÑK U
)
ÑÑU V
;
ÑÑV W
return
àà 
CreatedAtAction
àà "
(
àà" #
nameof
àà# )
(
àà) *
GetById
àà* 1
)
àà1 2
,
àà2 3
new
àà4 7
{
àà8 9
id
àà: <
=
àà= >
	productId
àà? H
}
ààI J
,
ààJ K
product
ààL S
)
ààS T
;
ààT U
}
ââ 	
[
ãã 	
HttpPut
ãã	 
]
ãã 
public
åå 
async
åå 
Task
åå 
<
åå 
IActionResult
åå '
>
åå' (
Update
åå) /
(
åå/ 0"
ProductUpdateRequest
åå0 D
request
ååE L
)
ååL M
{
çç 	
if
éé 
(
éé 
!
éé 

ModelState
éé 
.
éé 
IsValid
éé #
)
éé# $
{
èè 
return
êê 

BadRequest
êê !
(
êê! "

ModelState
êê" ,
)
êê, -
;
êê- .
}
ëë 
var
íí 
affectedResult
íí 
=
íí  
await
íí! &
_ProductService
íí' 6
.
íí6 7
Update
íí7 =
(
íí= >
request
íí> E
)
ííE F
;
ííF G
if
ìì 
(
ìì 
affectedResult
ìì 
==
ìì !
$num
ìì" #
)
ìì# $
return
îî 

BadRequest
îî !
(
îî! "
affectedResult
îî" 0
)
îî0 1
;
îî1 2
return
ññ 
Ok
ññ 
(
ññ 
affectedResult
ññ $
)
ññ$ %
;
ññ% &
}
óó 	
[
ôô 	

HttpDelete
ôô	 
(
ôô 
$str
ôô !
)
ôô! "
]
ôô" #
public
öö 
async
öö 
Task
öö 
<
öö 
IActionResult
öö '
>
öö' (
Delete
öö) /
(
öö/ 0
int
öö0 3
	productId
öö4 =
)
öö= >
{
õõ 	
var
úú 
affectedResult
úú 
=
úú  
await
úú! &
_ProductService
úú' 6
.
úú6 7
Delete
úú7 =
(
úú= >
	productId
úú> G
)
úúG H
;
úúH I
if
ùù 
(
ùù 
affectedResult
ùù 
==
ùù !
$num
ùù" #
)
ùù# $
return
ûû 

BadRequest
ûû !
(
ûû! "
)
ûû" #
;
ûû# $
return
†† 
Ok
†† 
(
†† 
affectedResult
†† $
)
††$ %
;
††% &
}
°° 	
[
§§ 	
	HttpPatch
§§	 
(
§§ 
$str
§§ +
)
§§+ ,
]
§§, -
public
•• 
async
•• 
Task
•• 
<
•• 
IActionResult
•• '
>
••' (
UpdatePrice
••) 4
(
••4 5
int
••5 8
	productId
••9 B
,
••B C
decimal
••D K
newPrice
••L T
)
••T U
{
¶¶ 	
var
ßß 
isSuccessful
ßß 
=
ßß 
await
ßß $
_ProductService
ßß% 4
.
ßß4 5
UpdatePrice
ßß5 @
(
ßß@ A
	productId
ßßA J
,
ßßJ K
newPrice
ßßL T
)
ßßT U
;
ßßU V
if
®® 
(
®® 
isSuccessful
®® 
==
®® 
false
®®  %
)
®®% &
return
©© 

BadRequest
©© !
(
©©! "
)
©©" #
;
©©# $
return
™™ 
Ok
™™ 
(
™™ 
isSuccessful
™™ "
)
™™" #
;
™™# $
}
´´ 	
[
≠≠ 	
	HttpPatch
≠≠	 
(
≠≠ 
$str
≠≠ 1
)
≠≠1 2
]
≠≠2 3
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
IActionResult
ÆÆ '
>
ÆÆ' (
UpdateStock
ÆÆ) 4
(
ÆÆ4 5
int
ÆÆ5 8
	productId
ÆÆ9 B
,
ÆÆB C
int
ÆÆD G
newStock
ÆÆH P
)
ÆÆP Q
{
ØØ 	
var
∞∞ 
isSuccessful
∞∞ 
=
∞∞ 
await
∞∞ $
_ProductService
∞∞% 4
.
∞∞4 5
UpdateStock
∞∞5 @
(
∞∞@ A
	productId
∞∞A J
,
∞∞J K
newStock
∞∞L T
)
∞∞T U
;
∞∞U V
if
±± 
(
±± 
isSuccessful
±± 
==
±± 
false
±±  %
)
±±% &
return
≤≤ 

BadRequest
≤≤ !
(
≤≤! "
)
≤≤" #
;
≤≤# $
return
≥≥ 
Ok
≥≥ 
(
≥≥ 
isSuccessful
≥≥ "
)
≥≥" #
;
≥≥# $
}
¥¥ 	
[
∏∏ 	
HttpPost
∏∏	 
(
∏∏ 
$str
∏∏ 
)
∏∏ 
]
∏∏ 
[
ππ 	
Consumes
ππ	 
(
ππ 
$str
ππ '
)
ππ' (
]
ππ( )
public
∫∫ 
async
∫∫ 
Task
∫∫ 
<
∫∫ 
IActionResult
∫∫ '
>
∫∫' (
CreateImage
∫∫) 4
(
∫∫4 5
[
∫∫5 6
FromForm
∫∫6 >
]
∫∫> ?'
ProductImageCreateRequest
∫∫@ Y
request
∫∫Z a
)
∫∫a b
{
ªª 	
if
ºº 
(
ºº 
!
ºº 

ModelState
ºº 
.
ºº 
IsValid
ºº #
)
ºº# $
{
ΩΩ 
return
ææ 

BadRequest
ææ !
(
ææ! "

ModelState
ææ" ,
)
ææ, -
;
ææ- .
}
øø 
var
¡¡ 
imageId
¡¡ 
=
¡¡ 
await
¡¡ 
_ProductService
¡¡  /
.
¡¡/ 0
AddImage
¡¡0 8
(
¡¡8 9
request
¡¡9 @
)
¡¡@ A
;
¡¡A B
if
¬¬ 
(
¬¬ 
imageId
¬¬ 
==
¬¬ 
$num
¬¬ 
)
¬¬ 
return
√√ 

BadRequest
√√ !
(
√√! "
)
√√" #
;
√√# $
var
∆∆ 
image
∆∆ 
=
∆∆ 
await
∆∆ 
_ProductService
∆∆ -
.
∆∆- .
GetImageById
∆∆. :
(
∆∆: ;
imageId
∆∆; B
)
∆∆B C
;
∆∆C D
return
»» 
CreatedAtAction
»» "
(
»»" #
nameof
»»# )
(
»») *
GetImageById
»»* 6
)
»»6 7
,
»»7 8
new
»»9 <
{
»»= >
id
»»? A
=
»»B C
imageId
»»D K
}
»»L M
,
»»M N
image
»»O T
)
»»T U
;
»»U V
}
…… 	
[
ÀÀ 	
HttpPut
ÀÀ	 
(
ÀÀ 
$str
ÀÀ #
)
ÀÀ# $
]
ÀÀ$ %
public
ÃÃ 
async
ÃÃ 
Task
ÃÃ 
<
ÃÃ 
IActionResult
ÃÃ '
>
ÃÃ' (
UpdateImage
ÃÃ) 4
(
ÃÃ4 5
int
ÃÃ5 8
imageId
ÃÃ9 @
,
ÃÃ@ A
[
ÃÃB C
FromForm
ÃÃC K
]
ÃÃK L'
ProductImageUpdateRequest
ÃÃM f
request
ÃÃg n
)
ÃÃn o
{
ÕÕ 	
if
ŒŒ 
(
ŒŒ 
!
ŒŒ 

ModelState
ŒŒ 
.
ŒŒ 
IsValid
ŒŒ #
)
ŒŒ# $
{
œœ 
return
–– 

BadRequest
–– !
(
––! "

ModelState
––" ,
)
––, -
;
––- .
}
—— 
var
”” 
result
”” 
=
”” 
await
”” 
_ProductService
”” .
.
””. /
UpDateImage
””/ :
(
””: ;
imageId
””; B
,
””B C
request
””D K
)
””K L
;
””L M
if
‘‘ 
(
‘‘ 
result
‘‘ 
==
‘‘ 
$num
‘‘ 
)
‘‘ 
return
’’ 

BadRequest
’’ !
(
’’! "
)
’’" #
;
’’# $
return
◊◊ 
Ok
◊◊ 
(
◊◊ 
result
◊◊ 
)
◊◊ 
;
◊◊ 
}
ÿÿ 	
[
⁄⁄ 	

HttpDelete
⁄⁄	 
(
⁄⁄ 
$str
⁄⁄ 2
)
⁄⁄2 3
]
⁄⁄3 4
public
€€ 
async
€€ 
Task
€€ 
<
€€ 
IActionResult
€€ '
>
€€' (
RemoveImage
€€) 4
(
€€4 5
int
€€5 8
imageId
€€9 @
)
€€@ A
{
‹‹ 	
if
›› 
(
›› 
!
›› 

ModelState
›› 
.
›› 
IsValid
›› #
)
››# $
{
ﬁﬁ 
return
ﬂﬂ 

BadRequest
ﬂﬂ !
(
ﬂﬂ! "

ModelState
ﬂﬂ" ,
)
ﬂﬂ, -
;
ﬂﬂ- .
}
‡‡ 
var
‚‚ 
result
‚‚ 
=
‚‚ 
await
‚‚ 
_ProductService
‚‚ .
.
‚‚. /
RemoveImage
‚‚/ :
(
‚‚: ;
imageId
‚‚; B
)
‚‚B C
;
‚‚C D
if
„„ 
(
„„ 
result
„„ 
==
„„ 
$num
„„ 
)
„„ 
return
‰‰ 

BadRequest
‰‰ !
(
‰‰! "
)
‰‰" #
;
‰‰# $
return
ÊÊ 
Ok
ÊÊ 
(
ÊÊ 
result
ÊÊ 
)
ÊÊ 
;
ÊÊ 
}
ÁÁ 	
[
ÈÈ 	
HttpGet
ÈÈ	 
(
ÈÈ 
$str
ÈÈ #
)
ÈÈ# $
]
ÈÈ$ %
public
ÍÍ 
async
ÍÍ 
Task
ÍÍ 
<
ÍÍ 
IActionResult
ÍÍ '
>
ÍÍ' (
GetImageById
ÍÍ) 5
(
ÍÍ5 6
int
ÍÍ6 9
	productId
ÍÍ: C
,
ÍÍC D
int
ÍÍE H
imageId
ÍÍI P
)
ÍÍP Q
{
ÎÎ 	
var
ÏÏ 
image
ÏÏ 
=
ÏÏ 
await
ÏÏ 
_ProductService
ÏÏ -
.
ÏÏ- .
GetImageById
ÏÏ. :
(
ÏÏ: ;
imageId
ÏÏ; B
)
ÏÏB C
;
ÏÏC D
if
ÌÌ 
(
ÌÌ 
image
ÌÌ 
==
ÌÌ 
null
ÌÌ 
)
ÌÌ 
return
ÓÓ 

BadRequest
ÓÓ !
(
ÓÓ! "
$str
ÓÓ" 6
)
ÓÓ6 7
;
ÓÓ7 8
return
ÔÔ 
Ok
ÔÔ 
(
ÔÔ 
image
ÔÔ 
)
ÔÔ 
;
ÔÔ 
}
 	
[
ÚÚ 	
HttpPut
ÚÚ	 
(
ÚÚ 
$str
ÚÚ "
)
ÚÚ" #
]
ÚÚ# $
public
ÛÛ 
async
ÛÛ 
Task
ÛÛ 
<
ÛÛ 
IActionResult
ÛÛ '
>
ÛÛ' (
CategoryAssign
ÛÛ) 7
(
ÛÛ7 8
int
ÛÛ8 ;
id
ÛÛ< >
,
ÛÛ> ?
[
ÛÛ@ A
FromBody
ÛÛA I
]
ÛÛI J#
CategoryAssignRequest
ÛÛK `
request
ÛÛa h
)
ÛÛh i
{
ÙÙ 	
if
ıı 
(
ıı 
!
ıı 

ModelState
ıı 
.
ıı 
IsValid
ıı #
)
ıı# $
return
ˆˆ 

BadRequest
ˆˆ !
(
ˆˆ! "

ModelState
ˆˆ" ,
)
ˆˆ, -
;
ˆˆ- .
var
¯¯ 
result
¯¯ 
=
¯¯ 
await
¯¯ 
_ProductService
¯¯ .
.
¯¯. /
CategoryAssign
¯¯/ =
(
¯¯= >
id
¯¯> @
,
¯¯@ A
request
¯¯B I
)
¯¯I J
;
¯¯J K
if
˘˘ 
(
˘˘ 
!
˘˘ 
result
˘˘ 
.
˘˘ 
IsSuccessed
˘˘ #
)
˘˘# $
{
˙˙ 
return
˚˚ 

BadRequest
˚˚ !
(
˚˚! "
result
˚˚" (
)
˚˚( )
;
˚˚) *
}
¸¸ 
return
˝˝ 
Ok
˝˝ 
(
˝˝ 
result
˝˝ 
)
˝˝ 
;
˝˝ 
}
˛˛ 	
}
ˇˇ 
}ÄÄ ≈
fF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\RolesController.cs
	namespace 	
eShopSolution
 
. 

BackendApi "
." #
Controllers# .
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
RolesController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IRoleService %
_roleService& 2
;2 3
public 
RolesController 
( 
IRoleService +
roleService, 7
)7 8
{ 	
_roleService 
= 
roleService &
;& '
} 	
[ 	
HttpGet	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
var 
roles 
= 
await 
_roleService *
.* +
GetAll+ 1
(1 2
)2 3
;3 4
return   
Ok   
(   
roles   
)   
;   
}!! 	
}"" 
}## â
gF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\SlidesController.cs
	namespace 	
eShopSolution
 
. 

BackendApi "
." #
Controllers# .
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
SlidesController !
:" #
ControllerBase$ 2
{ 
private 
readonly 
ISlideService &
_slideService' 4
;4 5
public 
SlidesController 
(  
ISlideService  -
slideService. :
): ;
{ 	
_slideService 
= 
slideService (
;( )
} 	
[ 	
HttpGet	 
] 
[ 	
AllowAnonymous	 
] 
public 
async 
Task 
< 
IActionResult '
>' (
GetAll) /
(/ 0
)0 1
{ 	
var 
roles 
= 
await 
_slideService +
.+ ,
GetAll, 2
(2 3
)3 4
;4 5
return   
Ok   
(   
roles   
)   
;   
}!! 	
}"" 
}## Ê>
fF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Controllers\UsersController.cs
	namespace 	
eShopSolution
 
. 

BackendApi "
." #
Controllers# .
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
	Authorize 
] 
public 

class 
UsersController  
:! "
ControllerBase# 1
{ 
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
UsersController 
( 
IUserService +
userService, 7
)7 8
{ 	
_userService 
= 
userService &
;& '
} 	
[ 	
HttpPost	 
( 
$str  
)  !
]! "
[ 	
AllowAnonymous	 
] 
public 
async 
Task 
< 
IActionResult '
>' (

Authencate) 3
(3 4
[4 5
FromBody5 =
]= >
LoginRequest? K
requestL S
)S T
{   	
if!! 
(!! 
!!! 

ModelState!! 
.!! 
IsValid!! #
)!!# $
{"" 
return## 

BadRequest## !
(##! "

ModelState##" ,
)##, -
;##- .
}$$ 
var&& 
resultToken&& 
=&& 
await&& #
_userService&&$ 0
.&&0 1

Authencate&&1 ;
(&&; <
request&&< C
)&&C D
;&&D E
if(( 
((( 
string(( 
.(( 
IsNullOrEmpty(( $
((($ %
resultToken((% 0
.((0 1
	ResultObj((1 :
)((: ;
)((; <
{)) 
return** 

BadRequest** !
(**! "
resultToken**" -
)**- .
;**. /
}++ 
return-- 
Ok-- 
(-- 
resultToken-- !
)--! "
;--" #
}.. 	
[00 	
HttpPost00	 
]00 
[11 	
AllowAnonymous11	 
]11 
public22 
async22 
Task22 
<22 
IActionResult22 '
>22' (
Register22) 1
(221 2
[222 3
FromBody223 ;
]22; <
RegisterRequest22= L
request22M T
)22T U
{33 	
if44 
(44 
!44 

ModelState44 
.44 
IsValid44 #
)44# $
return55 

BadRequest55 !
(55! "

ModelState55" ,
)55, -
;55- .
var66 
result66 
=66 
await66 
_userService66 +
.66+ ,
Register66, 4
(664 5
request665 <
)66< =
;66= >
if77 
(77 
!77 
result77 
.77 
IsSuccessed77 #
)77# $
{88 
return99 

BadRequest99 !
(99! "
result99" (
)99( )
;99) *
}:: 
return<< 
Ok<< 
(<< 
result<< 
)<< 
;<< 
}== 	
[@@ 	
HttpPut@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' (
UpdateAA) /
(AA/ 0
GuidAA0 4
idAA5 7
,AA7 8
[AA9 :
FromBodyAA: B
]AAB C
UserUpdateRequestAAD U
requestAAV ]
)AA] ^
{BB 	
ifCC 
(CC 
!CC 

ModelStateCC 
.CC 
IsValidCC #
)CC# $
returnDD 

BadRequestDD !
(DD! "

ModelStateDD" ,
)DD, -
;DD- .
varFF 
resultFF 
=FF 
awaitFF 
_userServiceFF +
.FF+ ,
UpdateFF, 2
(FF2 3
idFF3 5
,FF5 6
requestFF7 >
)FF> ?
;FF? @
ifGG 
(GG 
!GG 
resultGG 
.GG 
IsSuccessedGG #
)GG# $
{HH 
returnII 

BadRequestII !
(II! "
resultII" (
)II( )
;II) *
}JJ 
returnKK 
OkKK 
(KK 
resultKK 
)KK 
;KK 
}LL 	
[OO 	
HttpPutOO	 
(OO 
$strOO 
)OO 
]OO 
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (

RoleAssignPP) 3
(PP3 4
GuidPP4 8
idPP9 ;
,PP; <
[PP= >
FromBodyPP> F
]PPF G
RoleAssignRequestPPH Y
requestPPZ a
)PPa b
{QQ 	
ifRR 
(RR 
!RR 

ModelStateRR 
.RR 
IsValidRR #
)RR# $
returnSS 

BadRequestSS !
(SS! "

ModelStateSS" ,
)SS, -
;SS- .
varUU 
resultUU 
=UU 
awaitUU 
_userServiceUU +
.UU+ ,

RoleAssignUU, 6
(UU6 7
idUU7 9
,UU9 :
requestUU; B
)UUB C
;UUC D
ifVV 
(VV 
!VV 
resultVV 
.VV 
IsSuccessedVV #
)VV# $
{WW 
returnXX 

BadRequestXX !
(XX! "
resultXX" (
)XX( )
;XX) *
}YY 
returnZZ 
OkZZ 
(ZZ 
resultZZ 
)ZZ 
;ZZ 
}[[ 	
[^^ 	
HttpGet^^	 
(^^ 
$str^^ 
)^^ 
]^^ 
public__ 
async__ 
Task__ 
<__ 
IActionResult__ '
>__' (
GetAllPaging__) 5
(__5 6
[__6 7
	FromQuery__7 @
]__@ A 
GetUserPagingRequest__B V
request__W ^
)__^ _
{`` 	
varaa 
Usersaa 
=aa 
awaitaa 
_userServiceaa *
.aa* +
GetUserPagingaa+ 8
(aa8 9
requestaa9 @
)aa@ A
;aaA B
returnbb 
Okbb 
(bb 
Usersbb 
)bb 
;bb 
}cc 	
[ee 	
HttpGetee	 
(ee 
$stree 
)ee 
]ee 
publicff 
asyncff 
Taskff 
<ff 
IActionResultff '
>ff' (
GetByIdff) 0
(ff0 1
Guidff1 5
idff6 8
)ff8 9
{gg 	
varhh 
userhh 
=hh 
awaithh 
_userServicehh )
.hh) *
GetByIdhh* 1
(hh1 2
idhh2 4
)hh4 5
;hh5 6
returnii 
Okii 
(ii 
userii 
)ii 
;ii 
}jj 	
[nn 	

HttpDeletenn	 
(nn 
$strnn 
)nn 
]nn 
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
Deleteoo) /
(oo/ 0
Guidoo0 4
idoo5 7
)oo7 8
{pp 	
varqq 
resultqq 
=qq 
awaitqq 
_userServiceqq +
.qq+ ,
Deleteqq, 2
(qq2 3
idqq3 5
)qq5 6
;qq6 7
returnss 
Okss 
(ss 
resultss 
)ss 
;ss 
}tt 	
}uu 
}vv ÷
`F:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Models\ErrorViewModel.cs
	namespace 	
eShopSolution
 
. 

BackendApi "
." #
Models# )
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
} ‘

RF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Program.cs
	namespace

 	
eShopSolution


 
.

 

BackendApi

 "
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
} ä`
RF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopSolution.BackendApi\Startup.cs
	namespace 	
eShopSolution
 
. 

BackendApi "
{   
public!! 

class!! 
Startup!! 
{"" 
public## 
Startup## 
(## 
IConfiguration## %
configuration##& 3
)##3 4
{$$ 	
Configuration%% 
=%% 
configuration%% )
;%%) *
}&& 	
public(( 
IConfiguration(( 
Configuration(( +
{((, -
get((. 1
;((1 2
}((3 4
public++ 
void++ 
ConfigureServices++ %
(++% &
IServiceCollection++& 8
services++9 A
)++A B
{,, 	
services// 
.// 
AddDbContext// !
<//! "
EShopDbContext//" 0
>//0 1
(//1 2
options//2 9
=>//: <
options00 
.00 
UseSqlServer00  
(00  !
Configuration00! .
.00. /
GetConnectionString00/ B
(00B C
SystemConstants00C R
.00R S 
MainConnectionString00S g
)00g h
)00h i
)00i j
;00j k
services33 
.33 
AddIdentity33  
<33  !
AppUser33! (
,33( )
AppRole33* 1
>331 2
(332 3
)333 4
.44 $
AddEntityFrameworkStores44 %
<44% &
EShopDbContext44& 4
>444 5
(445 6
)446 7
.55 $
AddDefaultTokenProviders55 %
(55% &
)55& '
;55' (
services88 
.88 
AddTransient88 !
<88! "
IProductService88" 1
,881 2
ProductService883 A
>88A B
(88B C
)88C D
;88D E
services:: 
.:: 
AddTransient:: !
<::! "
IStorageService::" 1
,::1 2
FileStorageService::3 E
>::E F
(::F G
)::G H
;::H I
services;; 
.;; 
AddTransient;; !
<;;! "
UserManager;;" -
<;;- .
AppUser;;. 5
>;;5 6
,;;6 7
UserManager;;8 C
<;;C D
AppUser;;D K
>;;K L
>;;L M
(;;M N
);;N O
;;;O P
services<< 
.<< 
AddTransient<< !
<<<! "
SignInManager<<" /
<<</ 0
AppUser<<0 7
><<7 8
,<<8 9
SignInManager<<: G
<<<G H
AppUser<<H O
><<O P
><<P Q
(<<Q R
)<<R S
;<<S T
services== 
.== 
AddTransient== !
<==! "
RoleManager==" -
<==- .
AppRole==. 5
>==5 6
,==6 7
RoleManager==8 C
<==C D
AppRole==D K
>==K L
>==L M
(==M N
)==N O
;==O P
services>> 
.>> 
AddTransient>> !
<>>! "
IUserService>>" .
,>>. /
UserService>>0 ;
>>>; <
(>>< =
)>>= >
;>>> ?
services?? 
.?? 
AddTransient?? !
<??! "
IRoleService??" .
,??. /
RoleService??0 ;
>??; <
(??< =
)??= >
;??> ?
services@@ 
.@@ 
AddTransient@@ !
<@@! "
ICategoryService@@" 2
,@@2 3
CategoryService@@4 C
>@@C D
(@@D E
)@@E F
;@@F G
servicesAA 
.AA 
AddTransientAA !
<AA! "
IOrderServiceAA" /
,AA/ 0
OrderServiceAA1 =
>AA= >
(AA> ?
)AA? @
;AA@ A
servicesCC 
.CC 
AddTransientCC !
<CC! "
ILanguageServiceCC" 2
,CC2 3
LanguageServiceCC4 C
>CCC D
(CCD E
)CCE F
;CCF G
servicesEE 
.EE 
AddTransientEE !
<EE! "
ISlideServiceEE" /
,EE/ 0
SlideServiceEE1 =
>EE= >
(EE> ?
)EE? @
;EE@ A
servicesaa 
.aa 
AddControllersaa #
(aa# $
)aa$ %
.bb 
AddFluentValidationbb $
(bb$ %
fvbb% '
=>bb( *
fvbb+ -
.bb- .4
(RegisterValidatorsFromAssemblyContainingbb. V
<bbV W!
LoginRequestValidatorbbW l
>bbl m
(bbm n
)bbn o
)bbo p
;bbp q
servicesee 
.ee 
AddSwaggerGenee "
(ee" #
cee# $
=>ee% '
{ff 
cgg 
.gg 

SwaggerDocgg 
(gg 
$strgg !
,gg! "
newgg# &
OpenApiInfogg' 2
{gg3 4
Titlegg5 :
=gg; <
$strgg= U
,ggU V
VersionggW ^
=gg_ `
$strgga e
}ggf g
)ggg h
;ggh i
cjj 
.jj !
AddSecurityDefinitionjj '
(jj' (
$strjj( 0
,jj0 1
newjj2 5!
OpenApiSecuritySchemejj6 K
{kk 
Descriptionmm 
=mm  !
$strmo" <
,oo< =
Namepp 
=pp 
$strpp *
,pp* +
Inqq 
=qq 
ParameterLocationqq *
.qq* +
Headerqq+ 1
,qq1 2
Typerr 
=rr 
SecuritySchemeTyperr -
.rr- .
ApiKeyrr. 4
,rr4 5
Schemess 
=ss 
$strss %
}tt 
)tt 
;tt 
cvv 
.vv "
AddSecurityRequirementvv (
(vv( )
newvv) ,&
OpenApiSecurityRequirementvv- G
(vvG H
)vvH I
{ww 
{xx 
newyy !
OpenApiSecuritySchemeyy /
{zz 
	Reference{{ !
={{" #
new{{$ '
OpenApiReference{{( 8
{|| 
Type}}  
=}}! "
ReferenceType}}# 0
.}}0 1
SecurityScheme}}1 ?
,}}? @
Id~~ 
=~~  
$str~~! )
} 
, 
Scheme
ÄÄ  
=
ÄÄ! "
$str
ÄÄ# +
,
ÄÄ+ ,
Name
ÅÅ 
=
ÅÅ  
$str
ÅÅ! )
,
ÅÅ) *
In
ÇÇ 
=
ÇÇ 
ParameterLocation
ÇÇ 0
.
ÇÇ0 1
Header
ÇÇ1 7
,
ÇÇ7 8
}
ÉÉ 
,
ÉÉ 
new
ÑÑ 
List
ÑÑ  
<
ÑÑ  !
string
ÑÑ! '
>
ÑÑ' (
(
ÑÑ( )
)
ÑÑ) *
}
ÖÖ 
}
ÜÜ 
)
ÜÜ 
;
ÜÜ 
}
áá 
)
áá 
;
áá 
string
åå 
issuer
åå 
=
åå 
Configuration
åå )
.
åå) *
GetValue
åå* 2
<
åå2 3
string
åå3 9
>
åå9 :
(
åå: ;
$str
åå; J
)
ååJ K
;
ååK L
string
çç 

signingKey
çç 
=
çç 
Configuration
çç  -
.
çç- .
GetValue
çç. 6
<
çç6 7
string
çç7 =
>
çç= >
(
çç> ?
$str
çç? K
)
ççK L
;
ççL M
byte
éé 
[
éé 
]
éé 
signingKeyBytes
éé "
=
éé# $
System
éé% +
.
éé+ ,
Text
éé, 0
.
éé0 1
Encoding
éé1 9
.
éé9 :
UTF8
éé: >
.
éé> ?
GetBytes
éé? G
(
ééG H

signingKey
ééH R
)
ééR S
;
ééS T
services
ëë 
.
ëë 
AddAuthentication
ëë &
(
ëë& '
opt
ëë' *
=>
ëë+ -
{
íí 
opt
ìì 
.
ìì '
DefaultAuthenticateScheme
ìì -
=
ìì. /
JwtBearerDefaults
ìì0 A
.
ììA B"
AuthenticationScheme
ììB V
;
ììV W
opt
îî 
.
îî $
DefaultChallengeScheme
îî *
=
îî+ ,
JwtBearerDefaults
îî- >
.
îî> ?"
AuthenticationScheme
îî? S
;
îîS T
}
ïï 
)
ïï 
.
ññ 
AddJwtBearer
ññ 
(
ññ 
options
ññ !
=>
ññ" $
{
óó 
options
òò 
.
òò "
RequireHttpsMetadata
òò ,
=
òò- .
false
òò/ 4
;
òò4 5
options
ôô 
.
ôô 
	SaveToken
ôô !
=
ôô" #
true
ôô$ (
;
ôô( )
options
õõ 
.
õõ '
TokenValidationParameters
õõ 1
=
õõ2 3
new
õõ4 7'
TokenValidationParameters
õõ8 Q
(
õõQ R
)
õõR S
{
úú 
ValidateIssuer
ûû "
=
ûû# $
true
ûû% )
,
ûû) *
ValidIssuer
üü 
=
üü  !
issuer
üü" (
,
üü( )
ValidateAudience
†† $
=
††% &
true
††' +
,
††+ ,
ValidAudience
°° !
=
°°" #
issuer
°°$ *
,
°°* +
ValidateLifetime
¢¢ $
=
¢¢% &
true
¢¢' +
,
¢¢+ ,&
ValidateIssuerSigningKey
££ ,
=
££- .
true
££/ 3
,
££3 4
	ClockSkew
§§ 
=
§§ 
System
§§  &
.
§§& '
TimeSpan
§§' /
.
§§/ 0
Zero
§§0 4
,
§§4 5
IssuerSigningKey
•• $
=
••% &
new
••' *"
SymmetricSecurityKey
••+ ?
(
••? @
signingKeyBytes
••@ O
)
••O P
}
¶¶ 
;
¶¶ 
}
ßß 
)
ßß 
;
ßß 
}
®® 	
public
´´ 
void
´´ 
	Configure
´´ 
(
´´ !
IApplicationBuilder
´´ 1
app
´´2 5
,
´´5 6!
IWebHostEnvironment
´´7 J
env
´´K N
)
´´N O
{
¨¨ 	
if
≠≠ 
(
≠≠ 
env
≠≠ 
.
≠≠ 
IsDevelopment
≠≠ !
(
≠≠! "
)
≠≠" #
)
≠≠# $
{
ÆÆ 
app
ØØ 
.
ØØ '
UseDeveloperExceptionPage
ØØ -
(
ØØ- .
)
ØØ. /
;
ØØ/ 0
}
∞∞ 
else
±± 
{
≤≤ 
app
≥≥ 
.
≥≥ !
UseExceptionHandler
≥≥ '
(
≥≥' (
$str
≥≥( 5
)
≥≥5 6
;
≥≥6 7
app
µµ 
.
µµ 
UseHsts
µµ 
(
µµ 
)
µµ 
;
µµ 
}
∂∂ 
app
∑∑ 
.
∑∑ !
UseHttpsRedirection
∑∑ #
(
∑∑# $
)
∑∑$ %
;
∑∑% &
app
∏∏ 
.
∏∏ 
UseStaticFiles
∏∏ 
(
∏∏ 
)
∏∏  
;
∏∏  !
app
∫∫ 
.
∫∫ 
UseAuthentication
∫∫ !
(
∫∫! "
)
∫∫" #
;
∫∫# $
app
ºº 
.
ºº 

UseRouting
ºº 
(
ºº 
)
ºº 
;
ºº 
app
ææ 
.
ææ 
UseAuthorization
ææ  
(
ææ  !
)
ææ! "
;
ææ" #
app
¡¡ 
.
¡¡ 

UseSwagger
¡¡ 
(
¡¡ 
)
¡¡ 
;
¡¡ 
app
¬¬ 
.
¬¬ 
UseSwaggerUI
¬¬ 
(
¬¬ 
c
¬¬ 
=>
¬¬ !
{
√√ 
c
ƒƒ 
.
ƒƒ 
SwaggerEndpoint
ƒƒ !
(
ƒƒ! "
$str
ƒƒ" <
,
ƒƒ< =
$str
ƒƒ> Y
)
ƒƒY Z
;
ƒƒZ [
}
≈≈ 
)
≈≈ 
;
≈≈ 
app
«« 
.
«« 
UseEndpoints
«« 
(
«« 
	endpoints
«« &
=>
««' )
{
»» 
	endpoints
…… 
.
……  
MapControllerRoute
…… ,
(
……, -
name
   
:
   
$str
   #
,
  # $
pattern
ÀÀ 
:
ÀÀ 
$str
ÀÀ E
)
ÀÀE F
;
ÀÀF G
}
ÃÃ 
)
ÃÃ 
;
ÃÃ 
}
ÕÕ 	
}
ŒŒ 
}œœ 