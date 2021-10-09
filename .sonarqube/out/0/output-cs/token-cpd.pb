´
dF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopeSolution.Utilities\Constants\SystemConstants.cs
	namespace 	
eShopeSolution
 
. 
	Utilities "
." #
	Constants# ,
{ 
public 

class 
SystemConstants  
{ 
public		 
const		 
string		  
MainConnectionString		 0
=		1 2
$str		3 D
;		D E
public

 
const

 
string

 
CartSession

 '
=

( )
$str

* 7
;

7 8
public 
class 
AppSettings  
{ 	
public 
const 
string 
DefaultLanguageId  1
=2 3
$str4 G
;G H
public 
const 
string 
Token  %
=& '
$str( /
;/ 0
public 
const 
string 
BaseAddress  +
=, -
$str. ;
;; <
} 	
public 
class 
ProductSettings $
{ 	
public 
const 
int $
NumberOfFeaturedProducts 5
=6 7
$num8 :
;: ;
public 
const 
int "
NumberOfLatestProducts 3
=4 5
$num6 8
;8 9
} 	
public 
class 
ProductConstants %
{ 	
public 
const 
string 
NA  "
=# $
$str% *
;* +
} 	
} 
} £
eF:\C#\Website\BackEnd\hocDuAnWEB\eShopSolution\eShopeSolution.Utilities\Exceptions\EShopeException.cs
	namespace 	
eShopeSolution
 
. 
	Utilities "
." #

Exceptions# -
{ 
public 
class
 
EShopeException 
:  !
	Exception" +
{ 
public		 
EShopeException		 
(		 
)		  
{

 	
} 	
public 
EShopeException 
( 
string %
message& -
)- .
: 
base 
( 
message 
) 
{ 	
} 	
public 
EShopeException 
( 
string %
message& -
,- .
	Exception/ 8
inner9 >
)> ?
: 
base 
( 
message 
, 
inner !
)! "
{ 	
} 	
} 
} 