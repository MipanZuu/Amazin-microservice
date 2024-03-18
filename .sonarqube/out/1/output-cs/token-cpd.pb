Š%
i/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Services/ProductService.cs
	namespace 	
Product_Service
 
. 
Services "
{ 
public 

	interface 
IProductService $
{		 
Task

 
<

 
List

 
<

 
ProductModel

 
>

 
>

  
GetAsync

! )
(

) *
)

* +
;

+ ,
Task 
< 
ProductModel 
> 
GetAsync #
(# $
string$ *
id+ -
)- .
;. /
Task 
CreateAsync 
( 
ProductModel %
productModel& 2
)2 3
;3 4
Task 
UpdateAsync 
( 
ProductModel %
productModel& 2
)2 3
;3 4
Task 
RemoveAsync 
( 
string 
id  "
)" #
;# $
} 
public 

class 
ProductService 
:  !
IProductService" 1
{ 
private 
readonly 
IMongoCollection )
<) *
ProductModel* 6
>6 7
_productCollection8 J
;J K
public 
ProductService 
( 
IOptions &
<& '
DatabaseSettings' 7
>7 8
databaseSettings9 I
)I J
{ 	
var 
mongoClient 
= 
new !
MongoClient" -
(- .
databaseSettings. >
.> ?
Value? D
.D E
ConnectionStringE U
)U V
;V W
var 
mongoDb 
= 
mongoClient %
.% &
GetDatabase& 1
(1 2
databaseSettings2 B
.B C
ValueC H
.H I
DatabaseNameI U
)U V
;V W
_productCollection 
=  
mongoDb! (
.( )
GetCollection) 6
<6 7
ProductModel7 C
>C D
(D E
databaseSettingsE U
.U V
ValueV [
.[ \
CollectionName\ j
)j k
;k l
} 	
public 
async 
Task 
< 
List 
< 
ProductModel +
>+ ,
>, -
GetAsync. 6
(6 7
)7 8
=>9 ;
await< A
_productCollectionB T
.T U
FindU Y
(Y Z
_Z [
=>\ ^
true_ c
)c d
.d e
ToListAsynce p
(p q
)q r
;r s
public 
async 
Task 
< 
ProductModel &
>& '
GetAsync( 0
(0 1
string1 7
id8 :
): ;
=>< >
await 
_productCollection $
.$ %
Find% )
() *
x* +
=>, .
x/ 0
.0 1
Id1 3
==4 6
id7 9
)9 :
.: ;
FirstOrDefaultAsync; N
(N O
)O P
;P Q
public!! 
async!! 
Task!! 
CreateAsync!! %
(!!% &
ProductModel!!& 2
productModel!!3 ?
)!!? @
=>!!A C
await!!D I
_productCollection!!J \
.!!\ ]
InsertOneAsync!!] k
(!!k l
productModel!!l x
)!!x y
;!!y z
public## 
async## 
Task## 
UpdateAsync## %
(##% &
ProductModel##& 2
productModel##3 ?
)##? @
=>##A C
await$$ 
_productCollection$$ $
.$$$ %
ReplaceOneAsync$$% 4
($$4 5
x$$5 6
=>$$7 9
x$$: ;
.$$; <
Id$$< >
==$$? A
productModel$$B N
.$$N O
Id$$O Q
,$$Q R
productModel$$S _
)$$_ `
;$$` a
public&& 
async&& 
Task&& 
RemoveAsync&& %
(&&% &
string&&& ,
id&&- /
)&&/ 0
=>&&1 3
await&&4 9
_productCollection&&: L
.&&L M
DeleteOneAsync&&M [
(&&[ \
x&&\ ]
=>&&^ `
x&&a b
.&&b c
Id&&c e
==&&f h
id&&i k
)&&k l
;&&l m
}'' 
}(( á
Y/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
	Configure 
< 
DatabaseSettings +
>+ ,
(, -
builder- 4
.4 5
Configuration5 B
.B C

GetSectionC M
(M N
$strN ]
)] ^
)^ _
;_ `
builder		 
.		 
Services		 
.		 
AddSingleton		 
<		 
IProductService		 -
,		- .
ProductService		/ =
>		= >
(		> ?
)		? @
;		@ A
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
! 
app 
. 	
Environment	 
. 
IsDevelopment "
(" #
)# $
)$ %
{ 
app 
. 
UseExceptionHandler 
( 
$str )
)) *
;* +
app 
. 
UseHsts 
( 
) 
; 
} 
app 
. 
UseHttpsRedirection 
( 
) 
; 
app 
. 
UseStaticFiles 
( 
) 
; 
app 
. 
UseAuthorization 
( 
) 
; 
app 
. 
MapGet 

(
 
$str 
, 
( 
) 
=> 
$str 7
)7 8
;8 9
app 
. 
MapControllers 
( 
) 
; 
app 
. 
MapControllerRoute 
( 
name   
:   	
$str  
 
,   
pattern!! 
:!! 
$str!! 5
)!!5 6
;!!6 7
app## 
.## 
Run## 
(## 
)## 	
;##	 
’
e/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Models/ProductModel.cs
	namespace 	
Product_Service
 
. 
Models  
;  !
public 
class 
ProductModel 
{ 
[ 
BsonId 
] 
[		 
BsonRepresentation		 
(		 
BsonType		  
.		  !
ObjectId		! )
)		) *
]		* +
public

 

string

 
?

 
Id

 
{

 
get

 
;

 
set

 
;

  
}

! "
[ 
BsonElement 
( 
$str 
) 
] 
public  
string! '
Name( ,
{- .
get/ 2
;2 3
set4 7
;7 8
}9 :
=; <
null= A
!A B
;B C
[ 
BsonElement 
( 
$str 
) 
]  
public! '
string( .
Description/ :
{; <
get= @
;@ A
setB E
;E F
}G H
=I J
nullK O
!O P
;P Q
[ 
BsonElement 
( 
$str 
) 
] 
public 

int 
Price 
{ 
get 
; 
set 
; 
}  !
} Ñ*
o/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Controllers/ProductController.cs
	namespace 	
Product_Service
 
. 
Controllers %
;% &
[ 
ApiController 
] 
[		 
Route		 
(		 
$str		 
)		 
]		 
public

 
class

 
ProductController

 
:

  
ControllerBase

! /
{ 
private 
readonly 
IProductService $
_productService% 4
;4 5
public 

ProductController 
( 
IProductService ,
productService- ;
); <
=>= ?
_productService@ O
=P Q
productServiceR `
;` a
[ 
HttpGet 
( 
$str 
) 
]  
public 

async 
Task 
< 
IActionResult #
># $
Get% (
(( )
string) /
id0 2
)2 3
{ 
var 
existingProduct 
= 
await #
_productService$ 3
.3 4
GetAsync4 <
(< =
id= ?
)? @
;@ A
if 

( 
existingProduct 
is 
null #
)# $
return 
NotFound 
( 
) 
; 
return 
Ok 
( 
existingProduct !
)! "
;" #
} 
[ 
HttpGet 
] 
public 

async 
Task 
< 
IActionResult #
># $
GetAllProducts% 3
(3 4
)4 5
{ 
var 
allProducts 
= 
await 
_productService  /
./ 0
GetAsync0 8
(8 9
)9 :
;: ;
if 

( 
allProducts 
. 
Any 
( 
) 
) 
return 
Ok 
( 
allProducts !
)! "
;" #
return   
NotFound   
(   
)   
;   
}!! 
[$$ 
HttpPost$$ 
]$$ 
public%% 

async%% 
Task%% 
<%% 
IActionResult%% #
>%%# $
PostProduct%%% 0
(%%0 1
ProductModel%%1 =
productModel%%> J
)%%J K
{&& 
await'' 
_productService'' 
.'' 
CreateAsync'' )
('') *
productModel''* 6
)''6 7
;''7 8
return(( 
CreatedAtAction(( 
((( 
nameof(( %
(((% &
Get((& )
)(() *
,((* +
new((, /
{((0 1
id((2 4
=((5 6
productModel((7 C
.((C D
Id((D F
}((G H
,((H I
productModel((J V
)((V W
;((W X
})) 
[++ 
HttpPut++ 
(++ 
$str++ 
)++ 
]++  
public,, 

async,, 
Task,, 
<,, 
IActionResult,, #
>,,# $
UpdateProduct,,% 2
(,,2 3
String,,3 9
id,,: <
,,,< =
ProductModel,,> J
productModel,,K W
),,W X
{-- 
var.. 
existingProduct.. 
=.. 
await.. #
_productService..$ 3
...3 4
GetAsync..4 <
(..< =
id..= ?
)..? @
;..@ A
if// 

(// 
existingProduct// 
is// 
null// #
)//# $
return00 

BadRequest00 
(00 
)00 
;00  
productModel22 
.22 
Id22 
=22 
existingProduct22 )
.22) *
Id22* ,
;22, -
await44 
_productService44 
.44 
UpdateAsync44 )
(44) *
productModel44* 6
)446 7
;447 8
return55 
Ok55 
(55 
)55 
;55 
}66 
[88 

HttpDelete88 
(88 
$str88 !
)88! "
]88" #
public99 

async99 
Task99 
<99 
IActionResult99 #
>99# $
DeleteProduct99% 2
(992 3
String993 9
id99: <
)99< =
{:: 
var;; 
existingProduct;; 
=;; 
await;; #
_productService;;$ 3
.;;3 4
GetAsync;;4 <
(;;< =
id;;= ?
);;? @
;;;@ A
if<< 

(<< 
existingProduct<< 
is<< 
null<< #
)<<# $
return== 

BadRequest== 
(== 
)== 
;==  
await?? 
_productService?? 
.?? 
RemoveAsync?? )
(??) *
id??* ,
)??, -
;??- .
returnAA 
	NoContentAA 
(AA 
)AA 
;AA 
}BB 
}CC ¬
r/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Controllers/HelloWorldController.cs
	namespace 	
Product_Service
 
. 
Controllers %
;% &
public 
class  
HelloWorldController !
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
public		 
IActionResult		 
Index		 "
(		" #
)		# $
{

 	
return 
Content 
( 
$str 9
)9 :
;: ;
} 	
} 
} ß
q/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Configurations/DatabaseSettings.cs
	namespace 	
Product_Service
 
. 
Configurations (
;( )
public 
class 
DatabaseSettings 
{ 
public 

string 
ConnectionString "
{# $
get% (
;( )
set* -
;- .
}/ 0
=1 2
null3 7
!7 8
;8 9
public 

string 
DatabaseName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 

string 
CollectionName  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
}		 