Sets

i    'number of countries'                  /1*57/
t    'number of years'                      /1*24/
m    'index for input'                      /1*1/;

$call gdxxrw.exe CI.xlsx par=carbon rng=sheet1!A1:Y58 
*=== Now import data from GDX
Parameter carbon(i,t);
$gdxin CI.gdx
$load carbon
$gdxin

$call gdxxrw.exe share_oil.xlsx par=so rng=sheet1!A1:Y58 
*=== Now import data from GDX
Parameter so(i,t);
$gdxin share_oil.gdx
$load so
$gdxin

$call gdxxrw.exe share_coal.xlsx par=sc rng=sheet1!A1:Y58 
*=== Now import data from GDX
Parameter sc(i,t);
$gdxin share_coal.gdx
$load sc
$gdxin

$call gdxxrw.exe share_gas.xlsx par=sg rng=sheet1!A1:Y58 
*=== Now import data from GDX
Parameter sg(i,t);
$gdxin share_gas.gdx
$load sg
$gdxin

$call gdxxrw.exe max_coal.xlsx par=mxc rng=sheet1!A1:BF2 
*=== Now import data from GDX
Parameter mxc(m,i);
$gdxin max_coal.gdx
$load mxc
$gdxin

$call gdxxrw.exe min_coal.xlsx par=mnc rng=sheet1!A1:BF2 
*=== Now import data from GDX
Parameter mnc(m,i);
$gdxin min_coal.gdx
$load mnc
$gdxin

$call gdxxrw.exe max_oil.xlsx par=mxo rng=sheet1!A1:BF2 
*=== Now import data from GDX
Parameter mxo(m,i);
$gdxin max_oil.gdx
$load mxo
$gdxin

$call gdxxrw.exe min_oil.xlsx par=mno rng=sheet1!A1:BF2 
*=== Now import data from GDX
Parameter mno(m,i);
$gdxin min_oil.gdx
$load mno
$gdxin

$call gdxxrw.exe max_gas.xlsx par=mxg rng=sheet1!A1:BF2 
*=== Now import data from GDX
Parameter mxg(m,i);
$gdxin max_gas.gdx
$load mxg
$gdxin

$call gdxxrw.exe min_gas.xlsx par=mng rng=sheet1!A1:BF2 
*=== Now import data from GDX
Parameter mng(m,i);
$gdxin min_gas.gdx
$load mng
$gdxin

Acronym zero

display sc ;
display so ;
display sg ;
display carbon ;

Parameter
C_I(t)         
s_coal(t)
s_oil(t)
s_gas(t)

coal_max
coal_min

oil_max
oil_min

gas_max
gas_min

EF_coal(i)
EF_oil(i)
EF_gas(i);

Positive Variables
efc
efo
efg
resid(t);

Variable  obj;

Equations
resid_def(t)   "define residual for each country"
obj_def        "sum of squared residuals"

coallow
coalup

gaslow
gasup

oillow
oilup;

resid_def(t).. resid(t) =e= C_I(t) - s_coal(t)*efc - s_oil(t)*efo - s_gas(t)*efg;

obj_def.. obj =e= sum(t, resid(t)**2);

coallow.. efc =g= coal_min ;
coalup.. efc =l= coal_max ;

gaslow.. efg =g= gas_min ;
gasup.. efg =l= gas_max ;

oillow.. efo =g= oil_min ;
oilup.. efo =l= oil_max ;   

Model  OLS /all/;

loop (i$(ord(i)<= 57),

C_I(t) = carbon(i,t);
s_coal(t) = sc(i,t);
s_oil(t)  = so(i,t);
s_gas(t)  = sg(i,t);

loop (m$(ord(m)<= 1),

coal_max = mxc(m,i) ;
coal_min = mnc(m,i) ;

oil_max = mxo(m,i) ; 
oil_min = mno(m,i) ;

gas_max = mxg(m,i) ;
gas_min = mng(m,i) ;

)

Solve  OLS using NLP minimizing obj;

EF_coal(i)=efc.l;
EF_oil(i)=efo.l;
EF_gas(i)=efg.l;

);


EF_coal(i)$(NOT EF_coal(i)) = zero;
EF_oil(i)$(NOT EF_oil(i)) = zero;
EF_gas(i)$(NOT EF_gas(i)) = zero;


display EF_coal;
display EF_oil;
display EF_gas; 
