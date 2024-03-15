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
}(( ¶
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
>		- .
(		. /
)		/ 0
;		0 1
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
} ô*
o/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Controllers/ProductController.cs
	namespace 	
Product_Service
 
. 
Controllers %
{		 
[

 
ApiController

 
]

 
[ 
Route 

(
 
$str 
) 
]  
public 

class 
ProductController "
:# $
ControllerBase% 3
{ 
private 
readonly 
IProductService (
_productService) 8
;8 9
public 
ProductController  
(  !
IProductService! 0
productService1 ?
)? @
{ 	
_productService 
= 
productService ,
;, -
} 	
[ 	
HttpGet	 
( 
$str "
)" #
]# $
public 
async 
Task 
< 
IActionResult '
>' (
Get) ,
(, -
string- 3
id4 6
)6 7
{ 	
var 
existingProduct 
=  !
await" '
_productService( 7
.7 8
GetAsync8 @
(@ A
idA C
)C D
;D E
if 
( 
existingProduct 
is  "
null# '
)' (
return 
NotFound 
(  
)  !
;! "
return 
Ok 
( 
existingProduct %
)% &
;& '
} 	
[ 	
HttpGet	 
] 
public   
async   
Task   
<   
IActionResult   '
>  ' (
GetAllProducts  ) 7
(  7 8
)  8 9
{!! 	
var"" 
allProducts"" 
="" 
await"" #
_productService""$ 3
.""3 4
GetAsync""4 <
(""< =
)""= >
;""> ?
if## 
(## 
allProducts## 
.## 
Any## 
(##  
)##  !
)##! "
return$$ 
Ok$$ 
($$ 
allProducts$$ %
)$$% &
;$$& '
return&& 
NotFound&& 
(&& 
)&& 
;&& 
}'' 	
[)) 	
HttpPost))	 
])) 
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
PostProduct**) 4
(**4 5
ProductModel**5 A
productModel**B N
)**N O
{++ 	
await,, 
_productService,, !
.,,! "
CreateAsync,," -
(,,- .
productModel,,. :
),,: ;
;,,; <
return-- 
CreatedAtAction-- "
(--" #
nameof--# )
(--) *
Get--* -
)--- .
,--. /
new--0 3
{--4 5
id--6 8
=--9 :
productModel--; G
.--G H
Id--H J
}--K L
,--L M
productModel--N Z
)--Z [
;--[ \
}.. 	
[00 	
HttpPut00	 
(00 
$str00 "
)00" #
]00# $
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
UpdateProduct11) 6
(116 7
string117 =
id11> @
,11@ A
ProductModel11B N
productModel11O [
)11[ \
{22 	
var33 
existingProduct33 
=33  !
await33" '
_productService33( 7
.337 8
GetAsync338 @
(33@ A
id33A C
)33C D
;33D E
if44 
(44 
existingProduct44 
is44  "
null44# '
)44' (
return55 

BadRequest55 !
(55! "
)55" #
;55# $
productModel77 
.77 
Id77 
=77 
existingProduct77 -
.77- .
Id77. 0
;770 1
await99 
_productService99 !
.99! "
UpdateAsync99" -
(99- .
productModel99. :
)99: ;
;99; <
return:: 
Ok:: 
(:: 
):: 
;:: 
};; 	
[== 	

HttpDelete==	 
(== 
$str== %
)==% &
]==& '
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
DeleteProduct>>) 6
(>>6 7
string>>7 =
id>>> @
)>>@ A
{?? 	
var@@ 
existingProduct@@ 
=@@  !
await@@" '
_productService@@( 7
.@@7 8
GetAsync@@8 @
(@@@ A
id@@A C
)@@C D
;@@D E
ifAA 
(AA 
existingProductAA 
isAA  "
nullAA# '
)AA' (
returnBB 

BadRequestBB !
(BB! "
)BB" #
;BB# $
awaitDD 
_productServiceDD !
.DD! "
RemoveAsyncDD" -
(DD- .
idDD. 0
)DD0 1
;DD1 2
returnFF 
	NoContentFF 
(FF 
)FF 
;FF 
}GG 	
}HH 
}II ¬
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