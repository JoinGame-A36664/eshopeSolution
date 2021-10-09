�
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
} �
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
} �
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
} �
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
}.. ��
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
�� 
(
�� 
	productId
�� 
==
�� 
$num
�� 
)
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
var
�� 
product
�� 
=
�� 
await
�� 
_ProductService
��  /
.
��/ 0
GetById
��0 7
(
��7 8
	productId
��8 A
,
��A B
request
��C J
.
��J K

LanguageId
��K U
)
��U V
;
��V W
return
�� 
CreatedAtAction
�� "
(
��" #
nameof
��# )
(
��) *
GetById
��* 1
)
��1 2
,
��2 3
new
��4 7
{
��8 9
id
��: <
=
��= >
	productId
��? H
}
��I J
,
��J K
product
��L S
)
��S T
;
��T U
}
�� 	
[
�� 	
HttpPut
��	 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Update
��) /
(
��/ 0"
ProductUpdateRequest
��0 D
request
��E L
)
��L M
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 

BadRequest
�� !
(
��! "

ModelState
��" ,
)
��, -
;
��- .
}
�� 
var
�� 
affectedResult
�� 
=
��  
await
��! &
_ProductService
��' 6
.
��6 7
Update
��7 =
(
��= >
request
��> E
)
��E F
;
��F G
if
�� 
(
�� 
affectedResult
�� 
==
�� !
$num
��" #
)
��# $
return
�� 

BadRequest
�� !
(
��! "
affectedResult
��" 0
)
��0 1
;
��1 2
return
�� 
Ok
�� 
(
�� 
affectedResult
�� $
)
��$ %
;
��% &
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
int
��0 3
	productId
��4 =
)
��= >
{
�� 	
var
�� 
affectedResult
�� 
=
��  
await
��! &
_ProductService
��' 6
.
��6 7
Delete
��7 =
(
��= >
	productId
��> G
)
��G H
;
��H I
if
�� 
(
�� 
affectedResult
�� 
==
�� !
$num
��" #
)
��# $
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
return
�� 
Ok
�� 
(
�� 
affectedResult
�� $
)
��$ %
;
��% &
}
�� 	
[
�� 	
	HttpPatch
��	 
(
�� 
$str
�� +
)
��+ ,
]
��, -
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
UpdatePrice
��) 4
(
��4 5
int
��5 8
	productId
��9 B
,
��B C
decimal
��D K
newPrice
��L T
)
��T U
{
�� 	
var
�� 
isSuccessful
�� 
=
�� 
await
�� $
_ProductService
��% 4
.
��4 5
UpdatePrice
��5 @
(
��@ A
	productId
��A J
,
��J K
newPrice
��L T
)
��T U
;
��U V
if
�� 
(
�� 
isSuccessful
�� 
==
�� 
false
��  %
)
��% &
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
return
�� 
Ok
�� 
(
�� 
isSuccessful
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	
	HttpPatch
��	 
(
�� 
$str
�� 1
)
��1 2
]
��2 3
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
UpdateStock
��) 4
(
��4 5
int
��5 8
	productId
��9 B
,
��B C
int
��D G
newStock
��H P
)
��P Q
{
�� 	
var
�� 
isSuccessful
�� 
=
�� 
await
�� $
_ProductService
��% 4
.
��4 5
UpdateStock
��5 @
(
��@ A
	productId
��A J
,
��J K
newStock
��L T
)
��T U
;
��U V
if
�� 
(
�� 
isSuccessful
�� 
==
�� 
false
��  %
)
��% &
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
return
�� 
Ok
�� 
(
�� 
isSuccessful
�� "
)
��" #
;
��# $
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
[
�� 	
Consumes
��	 
(
�� 
$str
�� '
)
��' (
]
��( )
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
CreateImage
��) 4
(
��4 5
[
��5 6
FromForm
��6 >
]
��> ?'
ProductImageCreateRequest
��@ Y
request
��Z a
)
��a b
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 

BadRequest
�� !
(
��! "

ModelState
��" ,
)
��, -
;
��- .
}
�� 
var
�� 
imageId
�� 
=
�� 
await
�� 
_ProductService
��  /
.
��/ 0
AddImage
��0 8
(
��8 9
request
��9 @
)
��@ A
;
��A B
if
�� 
(
�� 
imageId
�� 
==
�� 
$num
�� 
)
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
var
�� 
image
�� 
=
�� 
await
�� 
_ProductService
�� -
.
��- .
GetImageById
��. :
(
��: ;
imageId
��; B
)
��B C
;
��C D
return
�� 
CreatedAtAction
�� "
(
��" #
nameof
��# )
(
��) *
GetImageById
��* 6
)
��6 7
,
��7 8
new
��9 <
{
��= >
id
��? A
=
��B C
imageId
��D K
}
��L M
,
��M N
image
��O T
)
��T U
;
��U V
}
�� 	
[
�� 	
HttpPut
��	 
(
�� 
$str
�� #
)
��# $
]
��$ %
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
UpdateImage
��) 4
(
��4 5
int
��5 8
imageId
��9 @
,
��@ A
[
��B C
FromForm
��C K
]
��K L'
ProductImageUpdateRequest
��M f
request
��g n
)
��n o
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 

BadRequest
�� !
(
��! "

ModelState
��" ,
)
��, -
;
��- .
}
�� 
var
�� 
result
�� 
=
�� 
await
�� 
_ProductService
�� .
.
��. /
UpDateImage
��/ :
(
��: ;
imageId
��; B
,
��B C
request
��D K
)
��K L
;
��L M
if
�� 
(
�� 
result
�� 
==
�� 
$num
�� 
)
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� 2
)
��2 3
]
��3 4
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
RemoveImage
��) 4
(
��4 5
int
��5 8
imageId
��9 @
)
��@ A
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
return
�� 

BadRequest
�� !
(
��! "

ModelState
��" ,
)
��, -
;
��- .
}
�� 
var
�� 
result
�� 
=
�� 
await
�� 
_ProductService
�� .
.
��. /
RemoveImage
��/ :
(
��: ;
imageId
��; B
)
��B C
;
��C D
if
�� 
(
�� 
result
�� 
==
�� 
$num
�� 
)
�� 
return
�� 

BadRequest
�� !
(
��! "
)
��" #
;
��# $
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� #
)
��# $
]
��$ %
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetImageById
��) 5
(
��5 6
int
��6 9
	productId
��: C
,
��C D
int
��E H
imageId
��I P
)
��P Q
{
�� 	
var
�� 
image
�� 
=
�� 
await
�� 
_ProductService
�� -
.
��- .
GetImageById
��. :
(
��: ;
imageId
��; B
)
��B C
;
��C D
if
�� 
(
�� 
image
�� 
==
�� 
null
�� 
)
�� 
return
�� 

BadRequest
�� !
(
��! "
$str
��" 6
)
��6 7
;
��7 8
return
�� 
Ok
�� 
(
�� 
image
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPut
��	 
(
�� 
$str
�� "
)
��" #
]
��# $
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
CategoryAssign
��) 7
(
��7 8
int
��8 ;
id
��< >
,
��> ?
[
��@ A
FromBody
��A I
]
��I J#
CategoryAssignRequest
��K `
request
��a h
)
��h i
{
�� 	
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
return
�� 

BadRequest
�� !
(
��! "

ModelState
��" ,
)
��, -
;
��- .
var
�� 
result
�� 
=
�� 
await
�� 
_ProductService
�� .
.
��. /
CategoryAssign
��/ =
(
��= >
id
��> @
,
��@ A
request
��B I
)
��I J
;
��J K
if
�� 
(
�� 
!
�� 
result
�� 
.
�� 
IsSuccessed
�� #
)
��# $
{
�� 
return
�� 

BadRequest
�� !
(
��! "
result
��" (
)
��( )
;
��) *
}
�� 
return
�� 
Ok
�� 
(
�� 
result
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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
}## �
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
}## �>
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
}vv �
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
} �

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
} �`
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
��  
=
��! "
$str
��# +
,
��+ ,
Name
�� 
=
��  
$str
��! )
,
��) *
In
�� 
=
�� 
ParameterLocation
�� 0
.
��0 1
Header
��1 7
,
��7 8
}
�� 
,
�� 
new
�� 
List
��  
<
��  !
string
��! '
>
��' (
(
��( )
)
��) *
}
�� 
}
�� 
)
�� 
;
�� 
}
�� 
)
�� 
;
�� 
string
�� 
issuer
�� 
=
�� 
Configuration
�� )
.
��) *
GetValue
��* 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
$str
��; J
)
��J K
;
��K L
string
�� 

signingKey
�� 
=
�� 
Configuration
��  -
.
��- .
GetValue
��. 6
<
��6 7
string
��7 =
>
��= >
(
��> ?
$str
��? K
)
��K L
;
��L M
byte
�� 
[
�� 
]
�� 
signingKeyBytes
�� "
=
��# $
System
��% +
.
��+ ,
Text
��, 0
.
��0 1
Encoding
��1 9
.
��9 :
UTF8
��: >
.
��> ?
GetBytes
��? G
(
��G H

signingKey
��H R
)
��R S
;
��S T
services
�� 
.
�� 
AddAuthentication
�� &
(
��& '
opt
��' *
=>
��+ -
{
�� 
opt
�� 
.
�� '
DefaultAuthenticateScheme
�� -
=
��. /
JwtBearerDefaults
��0 A
.
��A B"
AuthenticationScheme
��B V
;
��V W
opt
�� 
.
�� $
DefaultChallengeScheme
�� *
=
��+ ,
JwtBearerDefaults
��- >
.
��> ?"
AuthenticationScheme
��? S
;
��S T
}
�� 
)
�� 
.
�� 
AddJwtBearer
�� 
(
�� 
options
�� !
=>
��" $
{
�� 
options
�� 
.
�� "
RequireHttpsMetadata
�� ,
=
��- .
false
��/ 4
;
��4 5
options
�� 
.
�� 
	SaveToken
�� !
=
��" #
true
��$ (
;
��( )
options
�� 
.
�� '
TokenValidationParameters
�� 1
=
��2 3
new
��4 7'
TokenValidationParameters
��8 Q
(
��Q R
)
��R S
{
�� 
ValidateIssuer
�� "
=
��# $
true
��% )
,
��) *
ValidIssuer
�� 
=
��  !
issuer
��" (
,
��( )
ValidateAudience
�� $
=
��% &
true
��' +
,
��+ ,
ValidAudience
�� !
=
��" #
issuer
��$ *
,
��* +
ValidateLifetime
�� $
=
��% &
true
��' +
,
��+ ,&
ValidateIssuerSigningKey
�� ,
=
��- .
true
��/ 3
,
��3 4
	ClockSkew
�� 
=
�� 
System
��  &
.
��& '
TimeSpan
��' /
.
��/ 0
Zero
��0 4
,
��4 5
IssuerSigningKey
�� $
=
��% &
new
��' *"
SymmetricSecurityKey
��+ ?
(
��? @
signingKeyBytes
��@ O
)
��O P
}
�� 
;
�� 
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
	Configure
�� 
(
�� !
IApplicationBuilder
�� 1
app
��2 5
,
��5 6!
IWebHostEnvironment
��7 J
env
��K N
)
��N O
{
�� 	
if
�� 
(
�� 
env
�� 
.
�� 
IsDevelopment
�� !
(
��! "
)
��" #
)
��# $
{
�� 
app
�� 
.
�� '
UseDeveloperExceptionPage
�� -
(
��- .
)
��. /
;
��/ 0
}
�� 
else
�� 
{
�� 
app
�� 
.
�� !
UseExceptionHandler
�� '
(
��' (
$str
��( 5
)
��5 6
;
��6 7
app
�� 
.
�� 
UseHsts
�� 
(
�� 
)
�� 
;
�� 
}
�� 
app
�� 
.
�� !
UseHttpsRedirection
�� #
(
��# $
)
��$ %
;
��% &
app
�� 
.
�� 
UseStaticFiles
�� 
(
�� 
)
��  
;
��  !
app
�� 
.
�� 
UseAuthentication
�� !
(
��! "
)
��" #
;
��# $
app
�� 
.
�� 

UseRouting
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseAuthorization
��  
(
��  !
)
��! "
;
��" #
app
�� 
.
�� 

UseSwagger
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseSwaggerUI
�� 
(
�� 
c
�� 
=>
�� !
{
�� 
c
�� 
.
�� 
SwaggerEndpoint
�� !
(
��! "
$str
��" <
,
��< =
$str
��> Y
)
��Y Z
;
��Z [
}
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseEndpoints
�� 
(
�� 
	endpoints
�� &
=>
��' )
{
�� 
	endpoints
�� 
.
��  
MapControllerRoute
�� ,
(
��, -
name
�� 
:
�� 
$str
�� #
,
��# $
pattern
�� 
:
�� 
$str
�� E
)
��E F
;
��F G
}
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� 