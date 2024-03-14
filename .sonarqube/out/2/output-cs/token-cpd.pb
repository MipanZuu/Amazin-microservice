å
i/Users/dentabramasta/Amazin-Project/APIGateaway/AmazinGateaway/Product-Service/Services/ProductService.cs
	namespace 	
Product_Service
 
. 
Services "
;" #
public 
class 
ProductService 
{		 
private

 
readonly

 
IMongoCollection

 %
<

% &
ProductModel

& 2
>

2 3
_productCollection

4 F
;

F G
public 

ProductService 
( 
IOptions "
<" #
DatabaseSettings# 3
>3 4
databaseSettings5 E
)E F
{ 
var 
mongoClient 
= 
new 
MongoClient )
() *
databaseSettings* :
.: ;
Value; @
.@ A
ConnectionStringA Q
)Q R
;R S
var 
mongoDb 
= 
mongoClient !
.! "
GetDatabase" -
(- .
databaseSettings. >
.> ?
Value? D
.D E
DatabaseNameE Q
)Q R
;R S
_productCollection 
= 
mongoDb $
.$ %
GetCollection% 2
<2 3
ProductModel3 ?
>? @
(@ A
databaseSettingsA Q
.Q R
ValueR W
.W X
CollectionNameX f
)f g
;g h
} 
public 

async 
Task 
< 
List 
< 
ProductModel '
>' (
>( )
GetAsync* 2
(2 3
)3 4
=>5 7
await8 =
_productCollection> P
.P Q
FindQ U
(U V
_V W
=>X Z
true[ _
)_ `
.` a
ToListAsynca l
(l m
)m n
;n o
public 

async 
Task 
< 
ProductModel "
>" #
GetAsync$ ,
(, -
string- 3
id4 6
)6 7
=>8 :
await 
_productCollection  
.  !
Find! %
(% &
x& '
=>( *
x+ ,
., -
Id- /
==0 2
id3 5
)5 6
.6 7
FirstOrDefaultAsync7 J
(J K
)K L
;L M
public 

async 
Task 
CreateAsync !
(! "
ProductModel" .
productModel/ ;
); <
=>= ?
await@ E
_productCollectionF X
.X Y
InsertOneAsyncY g
(g h
productModelh t
)t u
;u v
public 

async 
Task 
UpdateAsync !
(! "
ProductModel" .
productModel/ ;
); <
=>= ?
await 
_productCollection  
.  !
ReplaceOneAsync! 0
(0 1
x1 2
=>3 5
x6 7
.7 8
Id8 :
==; =
productModel> J
.J K
IdK M
,M N
productModelO [
)[ \
;\ ]
public 

async 
Task 
RemoveAsync !
(! "
string" (
id) +
)+ ,
=>- /
await0 5
_productCollection6 H
.H I
DeleteOneAsyncI W
(W X
xX Y
=>Z \
x] ^
.^ _
Id_ a
==b d
ide g
)g h
;h i
} µ
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
<		 
ProductService		 ,
>		, -
(		- .
)		. /
;		/ 0
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
} Ï*
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
readonly 
ProductService #
_productService$ 3
;3 4
public 

ProductController 
( 
ProductService +
productService, :
): ;
=>< >
_productService? N
=O P
productServiceQ _
;_ `
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